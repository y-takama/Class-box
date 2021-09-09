//
//  AttendanceListView.swift
//  AttendanceListView
//
//  Created by 髙間洋平 on 2021/08/28.
//

import SwiftUI

struct AttendanceListView: View {
    let classes: TimeTable
    @ObservedObject var viewModel: AttendanceListViewModel
    var body: some View {
        
        List {
            ForEach(viewModel.attendanceList, id: \.self) { list in
                NavigationLink(destination:
                    ClassUserNote()
                , label: {
                    VStack(spacing: 4) {
                        Text(list.status)
                            .font(.headline)
//                            .padding()
                        Text(list.TimestampString)
                            .modifier(SecondaryCaptionTextStyle())
                    }
                })
                
            }.onDelete { indexSet in
                let listId = indexSet.map{
                    viewModel.attendanceList[$0].listId
                }
                let classId = indexSet.map{
                    viewModel.attendanceList[$0].classId
                }
                let status = indexSet.map{
                    viewModel.attendanceList[$0].status
                }
                rowRemove(offsets: indexSet, listId: listId[0], classId: classId[0], status: status[0])
            }
        }
        .listStyle(PlainListStyle())
    }
    func rowRemove(offsets: IndexSet, listId: String, classId: String , status: String) {
        viewModel.attendanceList.remove(atOffsets: offsets)
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let dogRef = COLLECTION_USERS.document(uid).collection("LH").document(classId).collection("AttendanceList").document(listId)
        dogRef.delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            }
            if status == "出席" {
                COLLECTION_USERS.document(uid).collection("LH").document(classId).updateData(["attendance": viewModel.classinfo.attendance! - 1]) { _ in
                }
            }
            if status == "遅刻" {
                COLLECTION_USERS.document(uid).collection("LH").document(classId).updateData(["behindtime": viewModel.classinfo.behindtime! - 1]) { _ in
                }
            }
            if status == "欠席" {
                COLLECTION_USERS.document(uid).collection("LH").document(classId).updateData(["absence": viewModel.classinfo.absence! - 1]) { _ in
                }
            }
        }
    }
}

//func removeClass() {
//    guard let user = AuthViewModel.shared.currentUser else { return }
//    
//    COLLECTION_USERS.document(uid).collection("2021LH").document(classes.classId).delete() { err in
//        if let err = err {
//            print("Error removing document: \(err)")
//        } else {
//            COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(classes.classId).collection("registeredUser").document(uid).delete() { err in
//                if let err = err {
//                    print("Error removing document: \(err)")
//                } else {
//                    showingTimeTable = true
//                }
//            }
//        }
//    }
//}
