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
    static let shared = ReminderMainViewModel()
    
    
    init() {
        fetchReminder()
    }
    
    func fetchReminder() {
        self.loading = true
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("reminder_category")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let reminder = documents.map({ Reminder(dictionary: $0.data()) })
            self.reminder = reminder.sorted(by: { $0.timestamp.dateValue() < $1.timestamp.dateValue() })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.loading = false
            }
        }
    }
}
