//
//  ProfileViewModel.swift
//  ProfileViewModel
//
//  Created by 髙間洋平 on 2021/08/22.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var loading = false
    init(user: User) {
        self.user = user
        fetchUser()
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

