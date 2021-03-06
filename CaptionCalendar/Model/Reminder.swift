//
//  Reminder.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import Firebase
import FirebaseFirestoreSwift

struct Reminder: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    var name: String?
    var reminderID: String?
    var title: String?
    var subtitle: String?
    let order: Int?
    var courseName: String?
    var categoryName: String?
    var day: Bool
    var dayDetail: Bool
    var color: String?
    var coloropacity: Double?
    var headerImageUrl: String?
    let timestamp: Timestamp
    
   
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.reminderID = dictionary["reminderID"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.subtitle = dictionary["subtitle"] as? String ?? ""
        self.order = dictionary["order"] as? Int ?? 0
        self.courseName = dictionary["courseName"] as? String ?? ""
        self.categoryName = dictionary["categoryName"] as? String ?? ""
        self.day = dictionary["day"] as? Bool ?? false
        self.dayDetail = dictionary["dayDetail"] as? Bool ?? false
        self.color = dictionary["color"] as? String ?? ""
        self.coloropacity = dictionary["coloropacity"] as? Double ?? 1
        self.headerImageUrl = dictionary["headerImageUrl"] as? String ?? ""
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
    var TimestampCalendarString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMdd"
        return formatter.string(from: timestamp.dateValue())
    }
    var date_time_date: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.timeZone = TimeZone(identifier:  "Asia/Tokyo")
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: timestamp.dateValue())
    }
}
