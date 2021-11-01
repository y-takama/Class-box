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
    func ShowClassChat() {
        COLLECTION_USERS.document(user.uid!).updateData(["isShowClassChat": user.isShowClassChat! ? false : true]) { _ in
            self.complete = true
            AuthViewModel.shared.fetchUser()
        }
    }
}
