//
//  Notification.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/05.
//

import Firebase
import FirebaseFirestoreSwift

struct CNotification: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    var name: String?
    var title: String?
    var subtitle: String?
    var content: String?
    let order: Int?
    var profileImageUrl: String?
    var fullname: String?
    var ImageUrl: String?
    var headerImageUrl: String?
    var isRead: Bool?
    let timestamp: Timestamp
    
   
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.subtitle = dictionary["subtitle"] as? String ?? ""
        self.content = dictionary["content"] as? String ?? ""
        self.order = dictionary["order"] as? Int ?? 0
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.ImageUrl = dictionary["ImageUrl"] as? String ?? ""
        self.headerImageUrl = dictionary["headerImageUrl"] as? String ?? ""
        self.isRead = dictionary["isRead"] as? Bool ?? false
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
    
    var TimestampString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter.string(from: timestamp.dateValue())
    }
    var TimestampDetailString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd h:mm"
        return formatter.string(from: timestamp.dateValue())
    }
    
}

enum NotificationType: Int {
    case like
    case reply
    case follow
    
    var notificationText: String {
        switch self {
        case .like: return " いいねをしました"
        case .reply: return " replied to one of your tweets"
        case .follow: return " あなたをフォローしました"
        }
    }
}
