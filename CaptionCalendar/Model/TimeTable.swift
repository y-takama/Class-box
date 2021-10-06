//
//  TimeTable.swift
//  TimeTable
//
//  Created by 髙間洋平 on 2021/08/18.
//

import Firebase
import FirebaseFirestoreSwift

struct TimeTable: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    var university: String?
    var courseName: String
    var roomLocation: String?
    var teacherName: String?
    var teacherName2: String?
    let unit: Int?
    var author: String?
    var editer: String?
    var campus: String?
    var timetable: String?
    var semester: String?
    var resident: String?
    var classCode: String?
    var timetables: String?
    var color: String?
    var classId: String
    var listId: String
    var graduate: String?
    let status: String
    var absence: Int?
    var attendance: Int?
    var behindtime: Int?
    var attendanceNone: Int?
    var attendanceSometimes: Int?
    var attendanceEverytime: Int?
    var attendanceReport: Int?
    var attendanceNotClear: Int?
    var beforeattendanceNone: Int?
    var beforeattendanceSometimes: Int?
    var beforeattendanceEverytime: Int?
    var beforeattendanceReport: Int?
    var beforeattendanceNotClear: Int?
    var unit1: Int?
    var unit2: Int?
    var unit3: Int?
    var unit4: Int?
    var unit5: Int?
    var beforeunit1: Int?
    var beforeunit2: Int?
    var beforeunit3: Int?
    var beforeunit4: Int?
    var beforeunit5: Int?
    let timestamp: Timestamp
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.university = dictionary["university"] as? String ?? ""
        self.courseName = dictionary["courseName"] as? String ?? ""
        self.roomLocation = dictionary["roomLocation"] as? String ?? ""
        self.teacherName = dictionary["teacherName"] as? String ?? ""
        self.teacherName2 = dictionary["teacherName"] as? String ?? ""
        self.unit = dictionary["unit"] as? Int ?? 0
        self.author = dictionary["author"] as? String ?? ""
        self.editer = dictionary["editer"] as? String ?? ""
        self.campus = dictionary["campus"] as? String ?? ""
        self.timetable = dictionary["timetablesemeste"] as? String ?? ""
        self.semester = dictionary["birthplace"] as? String ?? ""
        self.resident = dictionary["resident"] as? String ?? ""
        self.classCode = dictionary["classCode"] as? String ?? ""
        self.timetables = dictionary["timetables"] as? String ?? ""
        self.color = dictionary["color"] as? String ?? "Color"
        self.classId = dictionary["classId"] as? String ?? ""
        self.listId = dictionary["listId"] as? String ?? ""
        self.graduate = dictionary["graduate"] as? String ?? ""
        self.status = dictionary["status"] as? String ?? ""
        self.absence = dictionary["absence"] as? Int ?? 0
        self.attendance = dictionary["attendance"] as? Int ?? 0
        self.behindtime = dictionary["behindtime"] as? Int ?? 0
        self.id = dictionary["uid"] as? String ?? ""
        self.attendanceNone = dictionary["attendanceNone"] as? Int ?? 0
        self.attendanceSometimes = dictionary["attendanceSometimes"] as? Int ?? 0
        self.attendanceEverytime = dictionary["attendanceEverytime"] as? Int ?? 0
        self.attendanceReport = dictionary["attendanceReport"] as? Int ?? 0
        self.attendanceNotClear = dictionary["attendanceNotClear"] as? Int ?? 0
        self.beforeattendanceNone = dictionary["beforeattendanceNone"] as? Int ?? 0
        self.beforeattendanceSometimes = dictionary["beforeattendanceSometimes"] as? Int ?? 0
        self.beforeattendanceEverytime = dictionary["beforeattendanceEverytime"] as? Int ?? 0
        self.beforeattendanceReport = dictionary["beforeattendanceReport"] as? Int ?? 0
        self.beforeattendanceNotClear = dictionary["beforeattendanceNotClear"] as? Int ?? 0
        self.unit1 = dictionary["unit1"] as? Int ?? 0
        self.unit2 = dictionary["unit2"] as? Int ?? 0
        self.unit3 = dictionary["unit3"] as? Int ?? 0
        self.unit4 = dictionary["unit4"] as? Int ?? 0
        self.unit5 = dictionary["unit5"] as? Int ?? 0
        self.beforeunit1 = dictionary["beforeunit1"] as? Int ?? 0
        self.beforeunit2 = dictionary["beforeunit2"] as? Int ?? 0
        self.beforeunit3 = dictionary["beforeunit3"] as? Int ?? 0
        self.beforeunit4 = dictionary["beforeunit4"] as? Int ?? 0
        self.beforeunit5 = dictionary["beforeunit5"] as? Int ?? 0
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
    
    var TimestampString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter.string(from: timestamp.dateValue())
    }
}
