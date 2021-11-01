//
//  ConversationClassViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/29.
//

import SwiftUI

class ConversationClassViewModel: ObservableObject {
    @Published var timetable = [TimeTable]()
//    @Published var classchat = [TimeTable]()
    @Published var loading = false
    
    init() {
        fetchTimeTable()
    }
    
    func fetchTimeTable() {
        self.loading = true
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let docRef = COLLECTION_USERS.document(uid).collection("2021AS")
        docRef.getDocuments { snapshot, err in
            guard let documents = snapshot?.documents else { return }
            self.timetable = documents.map({ TimeTable(dictionary: $0.data()) })
            print("DEBUG101 : \(self.timetable)")
            
//            guard let classes = snapshot?.documents.map({ TimeTable(dictionary: $0.data())}) else { return }
//            classes.forEach { classinfo in
//                COLLECTION_TIMETABLE.document(user.university!).collection("2021AS").document(classinfo.classId).getDocument { snapshot, _ in
//                    let classes = snapshot.map({ TimeTable(dictionary: $0.data()!)})
//                    self.timetable.append(classes!)
//                    print("DEBUG101 : \(self.timetable)")
//                }
//            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.loading = false
            }
        }
    }
}
