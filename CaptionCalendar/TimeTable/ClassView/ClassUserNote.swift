//
//  ClassUserNote.swift
//  ClassUserNote
//
//  Created by 髙間洋平 on 2021/08/29.
//

import SwiftUI

struct ClassUserNote: View {
    @State private var showingAlert = false
    @ObservedObject var viewModel: ClassUserNoteViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let classes: TimeTable
    var body: some View {
        ScrollView {
//            Text("\(viewModel.classInfo.attendance!)")
            
        }
        .navigationBarItems(trailing: removeButton)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("消去"),
                  message: Text("消去してもよろしいですか？"),
                  primaryButton: .cancel(Text("Cancel")),
                  secondaryButton: .destructive(Text("消去"),
                                                action: removeClass)
            )
        }
    }
    
    var removeButton: some View {
        Button(action: {
            showingAlert.toggle()
        }, label: {
            Image(systemName: "trash")
                .font(.system(size: 17))
                .foregroundColor(Color("TextColor"))
        })
    }
    
    func removeClass() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let classId = classes.classId
        let listId = classes.listId
        let dogRef = COLLECTION_USERS.document(uid).collection("2021AS").document(classId).collection("AttendanceList").document(listId)
        dogRef.delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            }
            else if classes.status == "出席" {
                let attendance = viewModel.classInfo.attendance!
                COLLECTION_USERS.document(uid).collection("2021AS").document(classId).updateData(["attendance": attendance - 1]) { _ in
                    mode.wrappedValue.dismiss()
                }
            }
            else if classes.status == "遅刻" {
                let behindtime = viewModel.classInfo.behindtime!
                COLLECTION_USERS.document(uid).collection("2021AS").document(classId).updateData(["behindtime": behindtime - 1]) { _ in
                    mode.wrappedValue.dismiss()
                }
            }
            else if classes.status == "欠席" {
                let absence = viewModel.classInfo.absence!
                COLLECTION_USERS.document(uid).collection("2021AS").document(classId).updateData(["absence": absence - 1]) { _ in
                    mode.wrappedValue.dismiss()
                }
            }
        }
    }
}
