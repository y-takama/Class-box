//
//  SearchTimetableViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/25.
//

import SwiftUI

class SearchTimetableViewModel: ObservableObject {
    
    @Published var timetable = [TimeTable]()
    @Published var timetables: String?
    @State var campus: Bool
    @Published var loading = false
    
    
    init(timetables: String, campus: Bool) {
        self.timetables = timetables
        self.campus = campus
        fetchTimeTable()
    }
    
    func fetchTimeTable() {
        self.loading = true
        guard let user = AuthViewModel.shared.currentUser else { return }
        if campus {
            let docRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021AS").whereField("campus", isEqualTo: "").whereField("timetable", arrayContains: timetables!)
            docRef.getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let timetable = documents.map({ TimeTable(dictionary: $0.data()) })
                self.timetable = timetable.sorted(by: {
                    $0.courseName < $1.courseName
                })
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.loading = false
                }
            }
        } else {
            let docRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021AS").whereField("campus", isEqualTo: user.campus!).whereField("timetable", arrayContains: timetables!)
            docRef.getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let timetable = documents.map({ TimeTable(dictionary: $0.data()) })
                self.timetable = timetable.sorted(by: {
                    $0.courseName < $1.courseName
                })
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.loading = false
                }
            }
        }
        
        
//        self.loading = true
//        guard let user = AuthViewModel.shared.currentUser else { return }
//        let docRef = COLLECTION_TIMETABLE.document(user.university!).collection(user.campus!).document("2021AS").collection(timetables!)
//        docRef.getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            let timetable = documents.map({ TimeTable(dictionary: $0.data()) })
//            self.timetable = timetable.sorted(by: {
//                $0.courseName < $1.courseName
//            })
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                self.loading = false
//            }
//        }
    }
    func filteredClass(_ query: String) -> [TimeTable] {
        let lowercasedQuery = query.lowercased()
        return timetable.filter({ $0.courseName.contains(lowercasedQuery) || $0.classCode!.contains(lowercasedQuery) || $0.teacherName!.contains(lowercasedQuery)})
    }
}
