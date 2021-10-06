//
//  ClassChatViewModel.swift
//  ClassChatViewModel
//
//  Created by 髙間洋平 on 2021/08/29.
//

import SwiftUI

class ClassChatViewModel: ObservableObject {
    @Published var userId: User
    
    init(userId: User) {
        self.userId = userId
//        fetchChatUser()
    }
//    func fetchChatUser() {
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
//
//    }
}
