//
//  SearchClassViewModel.swift
//  SearchClassViewModel
//
//  Created by 髙間洋平 on 2021/08/23.
//

import SwiftUI

class SearchClassViewModel: ObservableObject {
    
    @Published var timeTable = [TimeTable]()
    @Published var timetable = [TimeTable]()
    
    init() {
        fetchTimeTable()
        fetchUserTimeTable()
    }
    
    func fetchTimeTable() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_TIMETABLE.document(user.university!).collection("LH")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.timetable = documents.map({ TimeTable(dictionary: $0.data()) })
        }
    }
    
    func fetchUserTimeTable() {
            guard let user = AuthViewModel.shared.currentUser else { return }
            guard let uid = AuthViewModel.shared.userSession?.uid else { return }
            let docRef = COLLECTION_USERS.document(uid).collection("LH")
            docRef.getDocuments { snapshot, _ in
                guard let classList = snapshot?.documents.map({ $0.documentID }) else { return }
                if classList.isEmpty == false {
                    classList.forEach { classes in
                        COLLECTION_TIMETABLE.document(user.university!).collection("LH").document(classes).getDocument { snapshot, _ in
                            let timetable = snapshot.map({ TimeTable(dictionary: $0.data()!)})
                            self.timeTable.append(timetable!)
                        }
                    }
                }
            }
        }
    
    func registrationClass(dayOfWeek: String,
                           timePeriod: String,
                           classId: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("LH").document(classId)
        let DogRef = COLLECTION_TIMETABLE.document(user.university!).collection("LH").document(classId).collection("registeredUser").document(uid)
        let docID = docRef.documentID
        let data = ["note": "",
                    "timetable": "\(dayOfWeek)\(timePeriod)",
                    "attendance": 0,
                    "behindtime": 0,
                    "absence": 0,
                    "classId": docID] as [String: Any]
        docRef.setData(data) { _ in
            DogRef.setData([:]) { _ in
                
            }
        }
    }
}
