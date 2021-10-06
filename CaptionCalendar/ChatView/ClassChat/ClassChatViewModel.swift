//
//  ClassChatViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/29.
//

import SwiftUI
import Firebase

class ClassChatViewModel: ObservableObject {
    let user: User
    let classInfo: TimeTable
    @Published var messages = [Message]()
    
    init(user: User, classInfo: TimeTable) {
        self.user = user
        self.classInfo = classInfo
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let classChatRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(classInfo.classId).collection("classChat")
        classChatRef.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            changes.forEach { change in
                let messageData = change.document.data()
                guard let fromId = messageData["fromId"] as? String else { return }
                COLLECTION_USERS.document(fromId).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.messages.append(Message(user: user, dictionary: messageData))
                    self.messages.sort(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
                }
            }
        }
    }
    
    func sendMessage(_ messageText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        let classChatRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(classInfo.classId).collection("classChat").document()
        let classChatRecentRef =  COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(classInfo.classId).collection("recent-messages")
        let messageID = classChatRef.documentID
        let data: [String: Any] = ["text": messageText,
                                   "id": messageID,
                                   "fromId": currentUid,
                                   "fullname": user.fullname!,
                                   "timestamp": Timestamp(date: Date())]
        let recentData: [String: Any] = ["text": messageText,
                                         "id": classInfo.classId,
                                         "fromId": currentUid,
                                         "read": true,
                                         "courseName": classInfo.courseName,
                                         "fullname": user.fullname!,
                                         "timestamp": Timestamp(date: Date())]
        classChatRef.setData(data)
        classChatRecentRef.document(classInfo.classId).setData(recentData)
    }
    
    func readedMessage() {
        let classChatRecentRef =  COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(classInfo.classId).collection("recent-messages")
        let data: [String: Any] = ["read": false]
        classChatRecentRef.document(classInfo.classId).updateData(data)
    }
}
