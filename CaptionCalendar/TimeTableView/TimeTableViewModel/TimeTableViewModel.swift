//
//  TimeViewModel.swift
//  TimeViewModel
//
//  Created by 髙間洋平 on 2021/08/20.
//

import SwiftUI
import Firebase

class TimeTableViewModel: ObservableObject {
    @Binding var isPresented: Bool
    var timeTable: TimeTable?
    
    init(isPresented: Binding<Bool>, timeTable: TimeTable?) {
        self._isPresented = isPresented
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
        let docRef = COLLECTION_TIMETABLE.document(user.university!).collection("LH").document()
        let docID = docRef.documentID
        let data: [String: Any] = ["university": user.university as Any,
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
        docRef.setData(data) { _ in
            self.isPresented = false
        }
    }
}
