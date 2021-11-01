//
//  ConversationsViewModel.swift
//  ConversationsViewModel
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI

class ConversationsViewModel: ObservableObject {
    @Published var recentMessages = [Message]()
    @Published var classChat: User
    @Published var loading = false
    private var recentMessagesDictionary = [String: Message]()
    
    init(classChat: User) {
        self.classChat = classChat
        fetchRecentMessages()
        fethClassChat()
    }
    
    func fetchRecentMessages() {
        print("aaaaa")
        self.loading = true
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_USERS.document(uid).collection("bloakList").getDocuments { snapshot, _ in
            guard let blockUser = snapshot?.documents.map({ $0.documentID }) else { return }
            if blockUser.isEmpty {
                let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
                query.addSnapshotListener { snapshot, error in
                    guard let changes = snapshot?.documentChanges else { return }
                    changes.forEach { change in
                        print("DEBUG12  :\(change)")
                        let messageData = change.document.data()
                        let uid = change.document.documentID
                        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
                            guard let data = snapshot?.data() else { return }
                            let user = User(dictionary: data)
                            self.recentMessagesDictionary[uid] = Message(user: user, dictionary: messageData)
                            self.recentMessages = Array(self.recentMessagesDictionary.values)
                            self.recentMessages = self.recentMessages.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
                        }
                    }
                }
            } else {
                let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
                query.addSnapshotListener { snapshot, error in
                    guard let changes = snapshot?.documentChanges else { return }
                    changes.forEach { change in
                        print("DEBUG12  :\(change)")
                        let messageData = change.document.data()
                        let uid = change.document.documentID
                        if blockUser.firstIndex(of: uid) == nil {
                            COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
                                guard let data = snapshot?.data() else { return }
                                let user = User(dictionary: data)
                                self.recentMessagesDictionary[uid] = Message(user: user, dictionary: messageData)
                                self.recentMessages = Array(self.recentMessagesDictionary.values)
                                self.recentMessages = self.recentMessages.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
                            }
                        }
                    }
                }
            }
            self.loading = false
        }
    }
    func fethClassChat() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument{ snapshot, _ in
            guard let data = snapshot?.data() else { return }
            self.classChat = User(dictionary: data)
        }
    }
}
