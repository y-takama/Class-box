//
//  ClassModel.swift
//  ClassModel
//
//  Created by 髙間洋平 on 2021/08/23.
//

import Firebase
import FirebaseFirestoreSwift

struct ClassModel: Identifiable, Decodable {
    var id: String = UUID().uuidString
    var courseName: String
    var roomLocation: String?
    var teacherName: String?
    var classCode: String?
    var unit: String
    var author: String?
    var editer: String?
    var campus: String?
    var classId: String
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.courseName = dictionary["courseName"] as? String ?? ""
        self.roomLocation = dictionary["roomLocation"] as? String ?? ""
        self.teacherName = dictionary["teacherName"] as? String ?? ""
        self.classCode = dictionary["classCode"] as? String ?? ""
        self.unit = dictionary["unit"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        self.editer = dictionary["editer"] as? String ?? ""
        self.campus = dictionary["campus"] as? String ?? ""
        self.classId = dictionary["classId"] as? String ?? ""
    }
}
