//
//  ChatView.swift
//  ChatView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI

struct ChatView: View {
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    @State var messageText: String = ""
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 9) {
                    ForEach(viewModel.messages) { message in
                        MessageView(message: message)
                    }
                    .padding(.top, 8)
                    .padding(.bottom, -8)
                }
            }
            .rotationEffect(.degrees(-180))
            
            MessageInputView(messageText: $messageText, action: sendMessage)
        }
        .navigationTitle(user.fullname!)
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }

    }
    
    
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

