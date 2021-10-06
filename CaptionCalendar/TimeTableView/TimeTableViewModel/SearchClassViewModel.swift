//
//  SearchClassViewModel.swift
//  SearchClassViewModel
//
//  Created by 髙間洋平 on 2021/08/23.
//

import SwiftUI
import Firebase

class SearchClassViewModel: ObservableObject {
    
    @Published var timetable = [TimeTable]()
    @Published var timetables: String?
    @Published var loading = false
//    let classInfo: TimeTable
    //    init() {
    ////        fetchTimeTable()
    //    }
    init(timetables: String) {
        self.timetables = timetables
//        self.classInfo = classInfo
        fetchTimeTable()
    }
    func fetchTimeTable() {
        self.loading = true
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_TIMETABLE.document(user.university!).collection(user.campus!).document("2021LH").collection(timetables!)
        //        let docRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let timetable = documents.map({ TimeTable(dictionary: $0.data()) })
            self.timetable = timetable
            
        }
        self.loading = false
    }
    
    func registrationClass(dayOfWeek: String,
                           timePeriod: String,
                           classId: String,
                           courseName: String,
                           roomLocation: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("2021LH").document(classId)
        let DogRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(classId).collection("registeredUser").document(uid)
        let docID = docRef.documentID
        let data = ["courseName": courseName,
                    "roomLocation": roomLocation,
                    "note": "",
                    "timetables": "\(dayOfWeek)\(timePeriod)",
                    "attendance": 0,
                    "behindtime": 0,
                    "absence": 0,
                    "classId": docID] as [String: Any]
//        let recentData: [String: Any] = ["id": docID,
//                                         "read": true,
//                                         "courseName": courseName,
//                                         "timestamp": Timestamp(date: Date())]
//        let classChatRecentRef =  COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(docID).collection("recent-messages")
        docRef.setData(data) { _ in
            DogRef.setData([:]) { _ in
                
            }
        }
//        classChatRecentRef.document(docID).setData(recentData)
    }
    
    
    func filteredClass(_ query: String) -> [TimeTable] {
        let lowercasedQuery = query.lowercased()
        return timetable.filter({ $0.courseName.contains(lowercasedQuery) || $0.classCode!.contains(lowercasedQuery) || $0.teacherName!.contains(lowercasedQuery)})
    }
}
