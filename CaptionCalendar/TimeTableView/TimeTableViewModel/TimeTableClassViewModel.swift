//
//  TimeTableClassViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/24.
//

import SwiftUI

class TimeTableClassViewModel: ObservableObject {
    @Published var timetable = [TimeTable]()
    @Published var loading = false
    
    init() {
        fetchTimeTable()
    }
    
    func fetchTimeTable() {
        self.loading = true
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let DogRef = COLLECTION_USERS.document(uid).collection("2021LH")
        DogRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.timetable = documents.map({ TimeTable(dictionary: $0.data()) })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.loading = false
            }
        }
    }
}
