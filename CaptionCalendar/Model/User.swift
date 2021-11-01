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
    var profileImageUrl: String?
    var backImageUrl: String?
    var fullname: String?
    let email: String
//    var stats: UserStats?
    var userStats: String?
    var bio: String?
    var job: String?
    var university: String?
    var campus: String?
    var highschool: String?
    var status: String?
    var birthplace: String?
    var resident: String?
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
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.backImageUrl = dictionary["backImageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? "not set"
//        self.stats = UserStats(followers: 0, following: 0)
        self.userStats = dictionary["userStats"] as? String ?? ""
        self.bio = dictionary["bio"] as? String ?? ""
        self.job = dictionary["job"] as? String ?? ""
        self.university = dictionary["university"] as? String ?? ""
        self.campus = dictionary["campus"] as? String ?? ""
        self.highschool = dictionary["highschool"] as? String ?? ""
        self.status = dictionary["status"] as? String ?? ""
        self.birthplace = dictionary["birthplace"] as? String ?? ""
        self.resident = dictionary["resident"] as? String ?? ""
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
