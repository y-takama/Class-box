//
//  Setting.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/11/05.
//

import Firebase
import FirebaseFirestoreSwift

struct Setting: Identifiable{
    @DocumentID var id: String?
    var calendar_timetables: Bool
    var calendar_reminder: Bool
    var calendar_detail: Bool
    var timatable_show_6thperiod: Bool
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.calendar_timetables = dictionary["calendar_timetables"] as? Bool ?? false
        self.calendar_reminder = dictionary["calendar_reminder"] as? Bool ?? false
        self.calendar_detail = dictionary["calendar_detail"] as? Bool ?? false
        self.timatable_show_6thperiod = dictionary["timatable_show_6thperiod"] as? Bool ?? false
    }
}

