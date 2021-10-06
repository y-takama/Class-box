//
//  NotificationViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/05.
//

import SwiftUI

class NotificationViewModel: ObservableObject {
    
    @Published var notification = [CNotification]()
    @Published var loading = false
    
    init() {
        fetchNotification()
    }
    
    func fetchNotification() {
        self.loading = true
        let docRef = COLLECTION_NOTIFICATION
        docRef.getDocuments { snapshot, err in
            if err == nil {
                guard let documents = snapshot?.documents else { return }
                self.notification = documents.map({ CNotification(dictionary: $0.data()) })
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.loading = false
            }
        }
    }
}
