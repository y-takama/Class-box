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
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 9) {
                    ForEach(viewModel.messages) { message in
                        MessageView(viewModel: MessageViewModel(message: message, messageUser: user), message: message, user: user)
                    }
                    .padding(.top, 8)
                }
            }
            .rotationEffect(.degrees(-180))
            .onTapGesture {
                UIApplication.shared.closeKeyboard()
            }
            .onAppear(perform: {
                readedMessage()
            })
            MessageInputView(messageText: $messageText, action: sendMessage)
        }
        .navigationTitle(user.fullname!)
    }
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
    func readedMessage() {
        viewModel.readedMessage()
    }
}

