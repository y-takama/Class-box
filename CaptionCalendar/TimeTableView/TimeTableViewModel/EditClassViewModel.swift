//
//  EditClassViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/25.
//

import SwiftUI
import Firebase

class EditClassViewModel: ObservableObject {
    @Published var classId: TimeTable
    @Published var classInfo: TimeTable
    @Published var editClass: TimeTable
    
    init(classId: TimeTable, classInfo: TimeTable, editClass: TimeTable) {
        self.classId = classId
        self.classInfo = classInfo
        self.editClass = editClass
        fetchClass()
        fetchEditClass()
    }
    
    func fetchClass() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let ClassId = classId.classId
        let docRef = COLLECTION_TIMETABLE.document(user.university!).collection(classId.timetable!).document(ClassId).collection("registeredUser")
        docRef.getDocuments { snapshot, _ in
            guard let classList = snapshot?.documents.map({ $0.documentID }) else { return }
            if classList.isEmpty == false {
                classList.forEach { classes in
                    if classes == uid {
                        COLLECTION_USERS.document(uid).collection("2021LH").document(ClassId).getDocument { snapshot, _ in
                            let classInfo = snapshot.map({ TimeTable(dictionary: $0.data()!)})
                            self.classInfo = classInfo!
                        }
                    }
                }
            }
        }
    }
    
    func fetchEditClass() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let ClassId = classId.classId
        COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(ClassId).getDocument { snapshot, _ in
            let editclass = snapshot.map({ TimeTable(dictionary: $0.data()!)})
            self.editClass = editclass!
        }
    }
}
