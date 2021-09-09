//
//  AttendanceListViewModel.swift
//  AttendanceListViewModel
//
//  Created by 髙間洋平 on 2021/08/28.
//

import SwiftUI

class AttendanceListViewModel: ObservableObject {
    @Published var attendanceList = [TimeTable]()
    @Published var classInfo: TimeTable
    @Published var classinfo: TimeTable
    
    init(classInfo: TimeTable, classinfo: TimeTable) {
        self.classInfo = classInfo
        self.classinfo = classInfo
        AttendanceList()
//        fetchClass()
    }
    func AttendanceList() {
        //        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let ClassId = classInfo.classId
        let dogRef = COLLECTION_USERS.document(uid).collection("LH").document(ClassId).collection("AttendanceList")
        dogRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.attendanceList = documents.map({ TimeTable(dictionary: $0.data())})
            if self.attendanceList.count == documents.count {
                self.attendanceList = self.attendanceList.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
            }
        }
    }
    
    func fetchClass() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let ClassId = classInfo.classId
        COLLECTION_USERS.document(uid).collection("LH").document(ClassId).getDocument { snapshot, _ in
            let classinfo = snapshot.map({ TimeTable(dictionary: $0.data()!)})
            self.classinfo = classinfo!
        }
    }
}
