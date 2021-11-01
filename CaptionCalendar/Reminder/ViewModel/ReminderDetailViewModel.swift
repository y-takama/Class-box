//
//  ReminderDetailViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/28.
//

import SwiftUI

class ReminderDetailViewModel: ObservableObject {
    @Published var reminder: Reminder
    
    init(reminder: Reminder) {
        self.reminder = reminder
        fetchReminder()
    }
    
    func fetchReminder() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("reminder").document(reminder.reminderID!)
        docRef.getDocument { snapshot, err in
            if err == nil {
                let reminderInfo = snapshot.map({ Reminder(dictionary: $0.data() ?? [:])})
                self.reminder = reminderInfo!
            }
        }
    }
}

