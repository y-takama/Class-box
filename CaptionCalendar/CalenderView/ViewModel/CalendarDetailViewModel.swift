//
//  CalendarDetailViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/28.
//

import SwiftUI

class CalendarDetailViewModel: ObservableObject {
    @Published var calendar: CCalendar
    
    init(calendar: CCalendar) {
        self.calendar = calendar
        fetchCalendar()
    }
    
    func fetchCalendar() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("calendar").document(calendar.calendarID!)
        docRef.getDocument { snapshot, err in
            if err == nil {
                let calendarInfo = snapshot.map({ CCalendar(dictionary: $0.data() ?? [:])})
                self.calendar = calendarInfo!
            }
        }
    }
}
