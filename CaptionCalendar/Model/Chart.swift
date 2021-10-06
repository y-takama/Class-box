//
//  Chart.swift
//  Chart
//
//  Created by 髙間洋平 on 2021/08/26.
//

import Firebase
import FirebaseFirestoreSwift

struct Chart: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    var attendanceNone: Int?
    var attendanceSometimes: Int?
    var attendanceEverytime: Int?
    var attendanceReport: Int?
    var attendanceNotClear: Int?
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.attendanceNone = dictionary["attendanceNone"] as? Int ?? 0
        self.attendanceSometimes = dictionary["attendanceSometimes"] as? Int ?? 0
        self.attendanceEverytime = dictionary["attendanceEverytime"] as? Int ?? 0
        self.attendanceReport = dictionary["attendanceReport"] as? Int ?? 0
        self.attendanceNotClear = dictionary["attendanceNotClear"] as? Int ?? 0
    }
}
