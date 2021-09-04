//
//  ProfileViewModel.swift
//  ProfileViewModel
//
//  Created by 髙間洋平 on 2021/08/22.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var users: User?
    init() {
        fetchUser()
    }
    func fetchUser() {
//        print("DEBUG")
        guard let uid = userSession?.uid else { return }
//        print("DEBUG9\(uid)")
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            self.users = User(dictionary: data)
//            guard let user = try? snapshot?.data(as: User.self) else { return }
//            self.users = user
            
        }
    }
}
