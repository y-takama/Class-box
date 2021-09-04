//
//  Message.swift
//  Message
//
//  Created by 髙間洋平 on 2021/08/18.
//

import Firebase

struct Message: Identifiable {
    let user: User
    let id: String
    let fromId: String
    let toId: String
    let timestamp: Timestamp
    let username: String?
    let profileImageUrl: String
    let text: String
    let fullname: String
    let isFromCurrentUser: Bool
    
    
    var chatPartnerId: String { return fromId == Auth.auth().currentUser?.uid ? toId : fromId }

    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
    }
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
    
    var detailedTimestampString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: timestamp.dateValue())
    }
}
