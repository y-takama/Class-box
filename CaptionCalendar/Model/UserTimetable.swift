//
//  UserTimetable.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/19.
//

import Foundation
import FirebaseFirestoreSwift

struct UserTimetable: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var courseName: String?
    var roomLocation: String?
    
    enum CodingKeys: String, CodingKey {
        case courseName
        case roomLocation
    }
}
