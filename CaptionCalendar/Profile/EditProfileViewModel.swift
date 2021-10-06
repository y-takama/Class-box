//
//  EditProfileViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/30.
//

import SwiftUI
import Firebase

class EditProfileViewModel: ObservableObject {
    @Published var uploadComplete = false
    @Published var uploadCompletes = false
    @Published var loading = false
    var user: User
    
    init(user: User) {
        self.user = user
        fetchUser()
    }
    
    func saveUserImage(profileImage: UIImage) {
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        guard let uid = user.id else { return }
        let storageRef = Storage.storage().reference(withPath: "\(uid)/profile_image/")
        storageRef.putData(imageData, metadata: nil) { _, error in
            storageRef.downloadURL { url, _ in
                let profileImageUrl = url?.absoluteString
                COLLECTION_USERS.document(uid).updateData(["profileImageUrl": profileImageUrl as Any]) { _ in
                    self.user.profileImageUrl = profileImageUrl!
                    self.uploadComplete = true
                }
            }
        }
    }
    func saveBackImage(backImage: UIImage) {
        guard let imageData = backImage.jpegData(compressionQuality: 0.5) else { return }
        guard let uid = user.id else { return }
        let storageRef = Storage.storage().reference(withPath: "\(uid)/background_image/")
        storageRef.putData(imageData, metadata: nil) { _, error in
            storageRef.downloadURL { url, _ in
                let backImageUrl = url?.absoluteString
                COLLECTION_USERS.document(uid).updateData(["backImageUrl": backImageUrl as Any]) { _ in
//                    self.user.backImageUrl = backImageUrl!
//                    self.uploadComplete = true
                }
            }
        }
    }
    
    func saveUserInfo(fullname: String, username: String) {
        guard let uid = user.id else { return }
        let data = ["fullname": fullname,
                    "username": username] as [String: Any]
        COLLECTION_USERS.document(uid).updateData(data) { _ in
            self.user.fullname = fullname
            self.user.username! = username
            self.uploadCompletes = true
        }
    }
    func fetchUser() {
        self.loading = true
        COLLECTION_USERS.document(user.uid!).getDocument { snapshot, _ in
            let userInfo = snapshot.map({ User(dictionary: $0.data()!)})
            self.user = userInfo!
            self.loading = false
        }
    }
}
