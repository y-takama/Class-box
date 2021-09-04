//
//  MessageViewModel.swift
//  MessageViewModel
//
//  Created by 髙間洋平 on 2021/08/24.
//

import Foundation

struct MessageViewModel {
    let message: Message
    
    var currentUid: String { return AuthViewModel.shared.userSession?.uid ?? "" }
    
    var isFromCurrentUser: Bool { return message.fromId == currentUid }
}
