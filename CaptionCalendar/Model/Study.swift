//
//  Study.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/17.
//

import Firebase
import FirebaseFirestoreSwift

struct Study: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    var courseName: String?
    var courseID: String?
    var title: String?
    var imageName: String?
    let order: Int?
    var header: String?
    var headerContents: String?
//    var content1: String?
//    var content2: String?
//    var content3: String?
    var questionTop: String?
    var question: String?
    var questionBottom: String?
    var questionTop1: String?
    var questionTop2: String?
    var question1: String?
    var question2: String?
    var questionBottom1: String?
    var questionBottom2: String?
    var choice1: Int?
    var choice1_1: String?
    var choice1_2: String?
    var choice1_3: String?
    var choice1_4: String?
    var choice1_5: String?
    var choice1_6: String?
    var choice1_7: String?
    var choice1_8: String?
    var choice1_9: String?
    var choice1_10: String?
    var choice2: Int?
    var choice2_1: String?
    var choice2_2: String?
    var choice2_3: String?
    var choice2_4: String?
    var choice2_5: String?
    var choice2_6: String?
    var choice2_7: String?
    var choice2_8: String?
    var choice2_9: String?
    var choice2_10: String?
    var answer1: Int?
    var answer2: Int?
    var timer: Int?
    var detailID: String?
    var questionID: String?
    var nextID: String?
    let timestamp: Timestamp
   
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.courseName = dictionary["courseName"] as? String ?? ""
        self.courseID = dictionary["courseID"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.imageName = dictionary["imageName"] as? String ?? ""
        self.order = dictionary["order"] as? Int ?? 0
        self.header = dictionary["header"] as? String ?? ""
        self.headerContents = dictionary["headerContents"] as? String ?? ""
        self.questionTop = dictionary["questionTop"] as? String ?? ""
        self.question = dictionary["question"] as? String ?? ""
        self.questionBottom = dictionary["questionBottom"] as? String ?? ""
        self.questionTop1 = dictionary["questionTop1"] as? String ?? ""
        self.questionTop2 = dictionary["questionTop2"] as? String ?? ""
        self.question1 = dictionary["question1"] as? String ?? ""
        self.question2 = dictionary["question2"] as? String ?? ""
        self.questionBottom1 = dictionary["questionBottom1"] as? String ?? ""
        self.questionBottom2 = dictionary["questionBottom2"] as? String ?? ""
        self.choice1 = dictionary["choice1"] as? Int ?? 0
        self.choice1_1 = dictionary["choice1_1"] as? String ?? ""
        self.choice1_2 = dictionary["choice1_2"] as? String ?? ""
        self.choice1_3 = dictionary["choice1_3"] as? String ?? ""
        self.choice1_4 = dictionary["choice1_4"] as? String ?? ""
        self.choice1_5 = dictionary["choice1_5"] as? String ?? ""
        self.choice1_6 = dictionary["choice1_6"] as? String ?? ""
        self.choice1_7 = dictionary["choice1_7"] as? String ?? ""
        self.choice1_8 = dictionary["choice1_8"] as? String ?? ""
        self.choice1_9 = dictionary["choice1_9"] as? String ?? ""
        self.choice1_10 = dictionary["choice1_10"] as? String ?? ""
        self.choice2 = dictionary["choice2"] as? Int ?? 0
        self.choice2_1 = dictionary["choice2_1"] as? String ?? ""
        self.choice2_2 = dictionary["choice2_2"] as? String ?? ""
        self.choice2_3 = dictionary["choice2_3"] as? String ?? ""
        self.choice2_4 = dictionary["choice2_4"] as? String ?? ""
        self.choice2_5 = dictionary["choice2_5"] as? String ?? ""
        self.choice2_6 = dictionary["choice2_6"] as? String ?? ""
        self.choice2_7 = dictionary["choice2_7"] as? String ?? ""
        self.choice2_8 = dictionary["choice2_8"] as? String ?? ""
        self.choice2_9 = dictionary["choice2_9"] as? String ?? ""
        self.choice2_10 = dictionary["choice2_10"] as? String ?? ""
        self.answer1 = dictionary["answer1"] as? Int ?? 0
        self.answer2 = dictionary["answer2"] as? Int ?? 0
        self.timer = dictionary["timer"] as? Int ?? 0
        self.detailID = dictionary["detailID"] as? String ?? ""
        self.questionID = dictionary["questionID"] as? String ?? ""
        self.nextID = dictionary["nextID"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
    
    var TimestampString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter.string(from: timestamp.dateValue())
    }
}
