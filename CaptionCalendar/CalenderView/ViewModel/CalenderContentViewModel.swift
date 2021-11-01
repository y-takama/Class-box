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
    
    init() {
        fetchReminder()
        fetchCalendar()
    }
    
    func fetchReminder() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("reminder")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.reminder = documents.map({ Reminder(dictionary: $0.data()) })
        }
    }
    func fetchCalendar() {
        print("rrrrrrrrrrr")
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("calendar")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.calendar = documents.map({ CCalendar(dictionary: $0.data()) })
        }
    }
}
