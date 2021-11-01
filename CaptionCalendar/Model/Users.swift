//
//  Users.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/22.
//

import Firebase
import FirebaseFirestoreSwift

struct Users: Identifiable, Decodable, Hashable {
//    static func == (lhs: Users, rhs: Users) -> Bool {
//        lhs.stats == rhs.stats
//    }
    
    @DocumentID var id: String?
    var docId: String
    var username: String?
    var profileImageUrl: String?
    var fullname: String?
    var university: String?
    var isFollowed = false
    var isRead: Bool?
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id }
//    var stats: UserStats?
    let timestamp: Timestamp
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.docId = dictionary["docId"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.university = dictionary["university"] as? String ?? ""
        self.isRead = dictionary["isRead"] as? Bool ?? false
//        self.stats = UserStats(followers: 0, following: 0)
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
