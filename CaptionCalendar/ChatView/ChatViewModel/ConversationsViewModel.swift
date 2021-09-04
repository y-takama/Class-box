//
//  ConversationsViewModel.swift
//  ConversationsViewModel
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI

class ConversationsViewModel: ObservableObject {
    @Published var recentMessages = [Message]()
    private var recentMessagesDictionary = [String: Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("user-blocklist").getDocuments { snapshot, _ in
            guard let blockUser = snapshot?.documents.map({ $0.documentID }) else { return }
            print("DEBUG12  :\(blockUser)")
            if blockUser.isEmpty == true {
                let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
                print("DEBUG11  :\(query)")
                query.order(by: "timestamp", descending: true)

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
    //                    if blockUser.firstIndex(of: change) == nil {
    //
    //                    }
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
        }
    }
}
