//
//  CalenderContentViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/04.
//

import SwiftUI

class CalenderContentViewModel: ObservableObject {
    
    @Published var reminder = [Reminder]()
    @Published var calendar = [CCalendar]()
    @Published var loading = false
    
    init() {
        fetchReminder()
        fetchCalendar()
    }
    
    func fetchReminder() {
        self.loading = true
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("reminder")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let reminder = documents.map({ Reminder(dictionary: $0.data()) })
            self.reminder = reminder.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.loading = false
            }
        }
    }
    func fetchCalendar() {
        self.loading = true
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("calendar")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.calendar = documents.map({ CCalendar(dictionary: $0.data()) })
//            self.calendar = calendar.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.loading = false
            }
        }
    }
}
