//
//  TimeTableClassViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/24.
//

import SwiftUI

class TimeTableClassViewModel: ObservableObject {
    @Published var timetable = [TimeTable]()
    @State var university = TimeTable(dictionary: [:])
    @Published var loading = false
    @Published var showloading = false
    static let shared = TimeTableClassViewModel()
    
    init() {
        fetchTimeTable()
        fetchUniversity()
    }
    
    func fetchTimeTable() {
        self.loading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showloading = true
        }
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let DogRef = COLLECTION_USERS.document(uid).collection("2021AS")
        DogRef.getDocuments() { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else { return }
            self.timetable = documents.map({ TimeTable(dictionary: $0.data()) })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                if self.showloading {
                    self.showloading = false
                }
                self.loading = false
            }
        }
        print("aaaaaaaaaa")
    }
    func fetchUniversity() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let DocRef = COLLECTION_TIMETABLE.document(user.university!)
        DocRef.getDocument { snapshot, err in
            if err == nil {
                let universityInfo = snapshot.map({ TimeTable(dictionary: $0.data() ?? [:])})
                self.university = universityInfo!
            }
        }
    }
}
