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
        COLLECTION_USERS.document(uid).collection("bloakList").getDocuments { snapshot, _ in
            guard let blockUser = snapshot?.documents.map({ $0.documentID }) else { return }
            if blockUser.isEmpty {
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
//                if blockUser.contains(self.user.uid!) {
//                } else {
//                    let query = COLLECTION_MESSAGES.document(uid).collection(self.user.id!)
//                    query.addSnapshotListener { snapshot, error in
//                        guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
//                        changes.forEach { change in
//                            let messageData = change.document.data()
//                            guard let fromId = messageData["fromId"] as? String else { return }
//                            COLLECTION_USERS.document(fromId).getDocument { snapshot, _ in
//                                guard let data = snapshot?.data() else { return }
//                                let user = User(dictionary: data)
//                                self.messages.append(Message(user: user, dictionary: messageData))
//                                self.messages.sort(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
//                            }
//                        }
//                    }
//                }
                if blockUser.firstIndex(of: self.user.id!) != nil {
                } else {
//                    print("www\(blockUser)")
//                    print("www\(self.user.id!)")
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
        let sendData: [String: Any] = ["text": messageText,
                                       "id": messageID,
                                       "fromId": currentUid,
                                       "toId": user.id!,
                                       "read": true,
                                       "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        receivingUserRef.document(messageID).setData(data)
        receivingRecentRef.document(currentUid).setData(sendData)
        currentRecentRef.document(user.id!).setData(data)
    }
    
    func readedMessage() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        let currentRecentRef =  COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        let data: [String: Any] = ["read": false]
        currentRecentRef.document(user.id!).updateData(data)
    }
    
//    func sendMessageTouser(to token: String) {
//        print("sendMessageTouser()")
////        var isNotRead: Int = 0
////        for data in datas.data {
////            if !data.isRead && title == data.userID { isNotRead += 1 }
////        }
////        isNotRead += 1
//        let urlString = "https://fcm.googleapis.com/fcm/send"
//        let url = NSURL(string: urlString)!
//        let paramString: [String : Any] = ["to" : token,
//                                           "priority": "high",
//                                           "notification" : ["title" : user.fullname!, "body" : messageText],
//                                           "data" : ["user" : "test_id"]
//        ]
//        let request = NSMutableURLRequest(url: url as URL)
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONSerialization.data(withJSONObject:paramString, options: [.prettyPrinted])
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("key=\(legacyServerKey)", forHTTPHeaderField: "Authorization")
//        let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
//            do {
//                if let jsonData = data {
//                    if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
//                        NSLog("Received data:\n\(jsonDataDict))")
////                        firebaseData.createData(sender: title,msg1: body)
//                    }
//                }
//            } catch let err as NSError {
//                print(err.debugDescription)
//            }
//        }
//        task.resume()
//    }
}
