//
//  TimeViewModel.swift
//  TimeViewModel
//
//  Created by 髙間洋平 on 2021/08/20.
//

import SwiftUI
import Firebase

class TimeTableViewModel: ObservableObject {
//    @Binding var isPresented: Bool
    var timeTable: TimeTable?
    
    init(timeTable: TimeTable?) {
//        self._isPresented = isPresented
        self.timeTable = timeTable
    }
    
    func uploadTimeTable(courseName: String,
                         roomLocation: String,
                         teacherName: String,
                         teacherName2: String,
                         unit: String,
                         classCode: String,
                         dayOfWeek: String,
                         timePeriod: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let docfef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document()
        let docID = docfef.documentID
        let docRef = COLLECTION_USERS.document(user.id!).collection("2021LH").document(docID)
        let DogRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(docID).collection("registeredUser").document(uid)
        let datas: [String: Any] = ["university": user.university as Any,
                                   "courseName": courseName,
                                   "roomLocation": roomLocation,
                                   "teacherName": teacherName,
                                   "teacherName2": teacherName2,
                                   "unit": unit,
                                   "author": user.fullname as Any,
                                   "campus": user.campus as Any,
                                   "classCode": classCode,
                                   "attendanceNone": 0,
                                   "attendanceSometimes": 0,
                                   "attendanceEverytime": 0,
                                   "attendanceReport": 0,
                                   "attendanceNotClear": 0,
                                   "timetables": "\(dayOfWeek)\(timePeriod)",
                                   "classId": docID]
        let data = ["note": "",
                    "timetable": "\(dayOfWeek)\(timePeriod)",
                    "attendance": 0,
                    "behindtime": 0,
                    "absence": 0,
                    "classId": docID] as [String: Any]
        docfef.setData(datas) { _ in
            docRef.setData(data) { _ in
                DogRef.setData([:]) { _ in
//                    self.isPresented = false
                }
            }
            
        }
    }
}
