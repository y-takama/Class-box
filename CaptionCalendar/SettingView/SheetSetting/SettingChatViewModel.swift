//
//  SettingChatViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/29.
//

import SwiftUI
import Firebase

class SettingChatViewModel: ObservableObject {
    var user: User
    @Published var complete = false
    
    init(user: User) {
        self.user = user
    }
    func ShowClassChat(_ isShowClassChat: Bool) {
        COLLECTION_USERS.document(user.uid!).updateData(["isShowClassChat": user.isShowClassChat! ? false : true]) { _ in
            self.user.isShowClassChat = isShowClassChat
            self.complete = true
            self.user.isShowClassChat?.toggle()
        }
    }
//    func fethClassChat() {
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
//        COLLECTION_USERS.document(uid).getDocument{ snapshot, _ in
//            guard let data = snapshot?.data() else { return }
//            self.classChat = User(dictionary: data)
//        }
//    }
}
