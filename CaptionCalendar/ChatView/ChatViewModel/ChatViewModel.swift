//
//  ChatViewModel.swift
//  ChatViewModel
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject {
    let user: User
    @Published var messages = [Message]()
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_USERS.document(uid).collection("user-blocklist").getDocuments { snapshot, _ in
            guard let blockUser = snapshot?.documents.map({ $0.documentID }) else { return }
//            print("DEBUG1  :\(blockUser)")
            if blockUser.isEmpty == true {
                let query = COLLECTION_MESSAGES.document(uid).collection(self.user.id!)
                query.addSnapshotListener { snapshot, error in
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
            } else {
//                print("DEBUG2  :\(self.user.id!)")
                if blockUser.firstIndex(of: self.user.id!) != nil {
//                    print("DEBUG2  :true")
                } else {
                    let query = COLLECTION_MESSAGES.document(uid).collection(self.user.id!)
                    query.addSnapshotListener { snapshot, error in
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
            }
        }
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
//        guard let uid = user.id else { return }
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id!).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(user.id!).collection(currentUid)
        let receivingRecentRef = COLLECTION_MESSAGES.document(user.id!).collection("recent-messages")
        let currentRecentRef =  COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        
        let messageID = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText,
                                   "id": messageID,
                                   "fromId": currentUid,
                                   "toId": user.id!,
                                   "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        receivingUserRef.document(messageID).setData(data)
        receivingRecentRef.document(currentUid).setData(data)
        currentRecentRef.document(user.id!).setData(data)
    }
}
