//
//  EditClassViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/25.
//

import SwiftUI
import Firebase

class EditClassViewModel: ObservableObject {
    @Published var classInfo: TimeTable
    
    init(classInfo: TimeTable) {
        self.classInfo = classInfo
//        fetchEditClass()
    }
    
//    func fetchClass() {
//        guard let user = AuthViewModel.shared.currentUser else { return }
//        let uid = user.uid!
//        let ClassId = classId.classId
//        let docRef = COLLECTION_TIMETABLE.document(user.university!).collection(classId.timetable!).document(ClassId).collection("registeredUser")
//        docRef.getDocuments { snapshot, _ in
//            guard let classList = snapshot?.documents.map({ $0.documentID }) else { return }
//            if classList.isEmpty == false {
//                classList.forEach { classes in
//                    if classes == uid {
//                        COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId).getDocument { snapshot, _ in
//                            let classInfo = snapshot.map({ TimeTable(dictionary: $0.data()!)})
//                            self.classInfo = classInfo!
//                        }
//                    }
//                }
//            }
//        }
//    }
    
    
}
