//
//  ClassChatView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/29.
//
import SwiftUI

struct ClassChatView: View {
    let user: User
    let classinfo: TimeTable
    @ObservedObject var viewModel: ClassChatViewModel
    @State var messageText: String = ""
    
    init(user: User, classinfo: TimeTable) {
        self.user = user
        self.classinfo = classinfo
        self.viewModel = ClassChatViewModel(user: user, classInfo: classinfo)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 9) {
                    ForEach(viewModel.messages) { message in
                        ClassChatCell(message: message, user: user)
                    }
                    .padding(.top, 8)
                    .padding(.bottom, -8)
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
        .navigationTitle(classinfo.courseName)
    }
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
    func readedMessage() {
//        viewModel.readedMessage()
    }
}

