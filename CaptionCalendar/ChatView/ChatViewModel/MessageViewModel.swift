//
//  MessageViewModel.swift
//  MessageViewModel
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI

class MessageViewModel: ObservableObject {
    
//    @Published var messageUser = [User]()
    @Published var message: Message
    @Published var messageUser: User
    
    
    init(message: Message, messageUser: User) {
        self.message = message
        self.messageUser = messageUser
        fetchUser()
    }
    
    func fetchUser() {
        let userId = message.fromId
        let userRef = COLLECTION_USERS.document(userId)
        userRef.getDocument { snapshot, _ in
            let userInfo = snapshot.map({ User(dictionary: $0.data()!)})
            self.messageUser = userInfo!
        }
//        guard let user = AuthViewModel.shared.currentUser else { return }
//        let docRef = COLLECTION_TIMETABLE.document(user.university!).collection(user.campus!).document("2021LH").collection(timetables!)
//        docRef.getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            let timetable = documents.map({ TimeTable(dictionary: $0.data()) })
//            self.timetable = timetable.sorted(by: {
//                $0.courseName < $1.courseName
//            })
////            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
////                self.loading = false
////            }
//        }
    }
}
