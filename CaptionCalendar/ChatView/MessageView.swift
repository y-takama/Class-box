//
//  MessageView.swift
//  MessageView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
import Kingfisher
//import KingfisherSwiftUI

struct MessageView: View {
    @ObservedObject var viewModel: MessageViewModel
    let message: Message
    let user: User
    
    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                HStack(alignment: .bottom) {
                    Spacer()
                    
                    Text(message.detailedTimestampString)
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: 10))
                        .padding(.trailing, -18)
                        .padding(.leading, 60)
                        .padding(.bottom, 5)
                    
                    Text(message.text)
                        .font(.system(size: 13))
                        .padding(14)
                        .background(Color(red: 128/255, green: 150/255, blue: 148/255))
                        .clipShape(ChatBubble(isFromCurrentUser: true))
                        .foregroundColor(.white)
                        .padding(.horizontal)}
            } else {
                HStack(alignment: .bottom) {
                    NavigationLink(destination: {
                        ChatFromUserProfileView(user: user, viewModel: MessageViewModel(message: message, messageUser: user))
                    }, label: {
                        if viewModel.messageUser.profileImageUrl == "" {
                            let username = message.user.fullname!
                            let start = String(username.prefix(2))
                            Text(start)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(width: 34, height: 34)
                                .padding(4)
                //                .background(Color("TintColor").opacity(0.8))
                                .clipShape(Circle())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 21)
                                        .stroke(Color.gray, lineWidth: 0.3)
                                )
                                .foregroundColor(Color("TextColor"))
                        } else {
                            KFImage(URL(string: viewModel.messageUser.profileImageUrl!))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 42, height: 42)
                                .background(Color("TintColor"))
                                .clipShape(Circle())
                        }
                    })
                    
                    
                    Text(message.text)
                        .font(.system(size: 13))
                        .padding(14)
                        .frame(minWidth: 40)
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(Color("TextColor"))
                    
                    Text(message.detailedTimestampString)
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: 10))
                        .padding(.trailing, -18)
                        .padding(.bottom, 5)
//                        .background(Color.green)
                }
                .padding(.horizontal)
                .padding(.trailing, 60)
//                .background(Color.blue)
//                .padding(.leading, 1)
                Spacer()
            }
        }
        .rotationEffect(.degrees(-180))
        .navigationBarTitleDisplayMode(.inline)
    }
}
