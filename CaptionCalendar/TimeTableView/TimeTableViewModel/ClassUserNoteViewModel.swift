//
//  ClassUserNoteViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/24.
//

import SwiftUI

class ClassUserNoteViewModel: ObservableObject {
    @Published var attendanceList = [TimeTable]()
    @Published var classInfo: TimeTable
//    @Published var classinfo: TimeTable
    
    init(classInfo: TimeTable) {
        self.classInfo = classInfo
//        self.classinfo = classInfo
//        AttendanceList()
        fetchClass()
    }


    func fetchClass() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let ClassId = classInfo.classId
        COLLECTION_USERS.document(uid).collection("2021LH").document(ClassId).getDocument { snapshot, _ in
            let classinfo = snapshot.map({ TimeTable(dictionary: $0.data()!)})
            self.classInfo = classinfo!
        }
    }
}
