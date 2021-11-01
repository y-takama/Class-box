//
//  CalendarContentReminderViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/15.
//

import SwiftUI

class CalendarContentReminderViewModel: ObservableObject {
    
    @Published var reminder = [Reminder]()
    
    init() {
        fetchReminder()
    }
    
    func fetchReminder() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("reminder")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.reminder = documents.map({ Reminder(dictionary: $0.data()) })
//            self.reminder = reminder.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
        }
    }
}
