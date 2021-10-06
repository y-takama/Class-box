//
//  ReminderMainViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI

class ReminderMainViewModel: ObservableObject {
    
    @Published var reminder = [Reminder]()
    @Published var loading = false
    
    
    init() {
        fetchReminder()
    }
    
    func fetchReminder() {
        self.loading = true
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("reminderCategory")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let reminder = documents.map({ Reminder(dictionary: $0.data()) })
            self.reminder = reminder.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.loading = false
            }
        }
    }
//    func filteredClass(_ query: String) -> [TimeTable] {
//        let lowercasedQuery = query.lowercased()
//        return timetable.filter({ $0.courseName.contains(lowercasedQuery) || $0.classCode!.contains(lowercasedQuery) || $0.teacherName!.contains(lowercasedQuery)})
//    }
}
