//
//  RequestViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/21.
//

import SwiftUI

class RequestViewModel: ObservableObject {
    @Published var request = [User]()
    @Published var conts = [CNotification]()
//    @Published var loading = false
    
    init() {
        fetchUserRequest()
        fetchUserRequestCounts()
    }
    
    func fetchUserRequest() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let docRef = COLLECTION_NOTIFICATION.document(uid).collection("user-notifications").whereField("type", isEqualTo: 2)
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.request = documents.map({ User(dictionary: $0.data()) })
            self.request = self.request.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
        }
    }
    func fetchUserRequestCounts() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let docRef = COLLECTION_NOTIFICATION.document(uid).collection("user-notifications").whereField("type", isEqualTo: 2).whereField("isRead", isEqualTo: false)
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.conts = documents.map({ CNotification(dictionary: $0.data()) })
        }
    }
}
