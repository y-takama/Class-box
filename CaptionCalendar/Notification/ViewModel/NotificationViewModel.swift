//
//  NotificationViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/05.
//

import SwiftUI
import Firebase

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
                self.loading = false
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.loading = false
                }
            }
        }
    }
    static func uploadNotification(toUid touid: String, type: NotificationType) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        guard touid != uid else { return }
        let docRef = COLLECTION_NOTIFICATION.document(touid).collection("user-notifications").document()
        let data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "isRead": false,
                                   "uid": uid,
                                   "type": type.rawValue,
                                   "docId": docRef.documentID,
                                   "profileImageUrl": user.profileImageUrl!,
                                   "fullname": user.fullname!]
        docRef.setData(data)
    }
    static func deleteNotification(toUid touid: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        guard touid != uid else { return }
        let docRef = COLLECTION_NOTIFICATION.document(touid).collection("user-notifications")
            .whereField("uid", isEqualTo: uid)
        docRef.getDocuments { snapshot, err in
            guard let documentid = snapshot?.documents.map({ $0.documentID }) else { return }
            documentid.forEach { id in
                COLLECTION_NOTIFICATION.document(touid).collection("user-notifications").document(id).delete()
            }
        }
    }
}
