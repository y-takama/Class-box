//
//  User.swift
//  User
//
//  Created by 髙間洋平 on 2021/08/18.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    var docId: String?
    var username: String?
    var fullname: String?
    var profileImageUrl: String?
    var backImageUrl: String?
    let email: String
    var userStats: String?
    var bio: String?
    var job: String?
    var university: String?
    var campus: String?
    var uid: String?
    var admin: String?
    var fromId: String?
    var instagramText: String?
    var twitterText: String?
    var isShowClassChat: Bool?
    var isShowTextbook: Bool?
    var isFollowed = false
    var usedTmetable: Bool? = false
    var notification: Bool? = false
    var isRead: Bool?
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id }
    let timestamp: Timestamp
    
    init(message: Message) {
        self.username = message.username
        self.id = message.chatPartnerId
        self.fullname = message.fullname
        self.email = ""
        self.profileImageUrl = message.profileImageUrl
        self.timestamp = message.timestamp
    }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.docId = dictionary["docId"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.backImageUrl = dictionary["backImageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        
        self.userStats = dictionary["userStats"] as? String ?? ""
        self.bio = dictionary["bio"] as? String ?? ""
        self.job = dictionary["job"] as? String ?? ""
        self.university = dictionary["university"] as? String ?? ""
        self.campus = dictionary["campus"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.admin = dictionary["admin"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.instagramText = dictionary["instagramText"] as? String ?? ""
        self.twitterText = dictionary["twitterText"] as? String ?? ""
        self.isShowClassChat = dictionary["isShowClassChat"] as? Bool ?? false
        self.isShowTextbook = dictionary["isShowTextbook"] as? Bool ?? false
        self.usedTmetable = dictionary["usedTmetable"] as? Bool ?? false
        self.notification = dictionary["notification"] as? Bool ?? false
        self.isRead = dictionary["isRead"] as? Bool ?? false
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
}

struct UserStats: Decodable {
    var followers: Int
    var following: Int
}
