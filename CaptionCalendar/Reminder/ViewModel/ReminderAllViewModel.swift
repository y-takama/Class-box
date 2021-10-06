//
//  ReminderAllViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI
import Firebase

class ReminderAllViewModel: ObservableObject {
    
    @Published var reminder = [Reminder]()
    @Published var reminderInfo: Reminder
    @Published var loading = false
    
    init(remindeInfo: Reminder) {
        self.reminderInfo = remindeInfo
        fetchReminder()
    }
    
    func fetchReminder() {
        self.loading = true
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("reminder")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let reminder = documents.map({ Reminder(dictionary: $0.data()) })
            self.reminder = reminder.sorted(by: { $0.timestamp.dateValue() < $1.timestamp.dateValue() })
            self.loading = false
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//
//            }
        }
    }
    func saveUserImage(profileImage: UIImage) {
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let storageRef = Storage.storage().reference(withPath: "\(uid)/reminder/\(reminderInfo.categoryName!)")
        storageRef.putData(imageData, metadata: nil) { _, error in
            storageRef.downloadURL { url, _ in
                let headerImageUrl = url?.absoluteString
                let reminderID = self.reminderInfo.reminderID!
                COLLECTION_USERS.document(uid).collection("reminderCategory").document(reminderID).updateData(["headerImageUrl": headerImageUrl as Any]) { _ in
                }
            }
        }
    }
    func DeleteImage() {
        self.loading = true
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let reminderID = self.reminderInfo.reminderID!
        COLLECTION_USERS.document(uid).collection("reminderCategory").document(reminderID).updateData(["headerImageUrl": ""]) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.loading = false
            }
        }
    }
}
