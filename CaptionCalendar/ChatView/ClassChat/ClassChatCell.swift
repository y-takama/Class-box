//
//  ClassChatCell.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/29.
//

import SwiftUI
//import KingfisherSwiftUI

struct ClassChatCell: View {
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
                    
//                    KFImage(URL(string: message.user.profileImageUrl))
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 36, height: 36)
//                        .clipShape(Circle())
                    NavigationLink(destination: {
                        ChatFromUserProfileView(user: user, viewModel: MessageViewModel(message: message, messageUser: user))
                    }, label: {
                        Circle()
                            .frame(width: 52, height: 52)
                            .foregroundColor(Color(.systemGray5))
                    })
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(message.fullname!)
//                            .bold()
                            .font(.system(size: 9))
                            .padding(.top, 5)
                        HStack {
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
                    }
                    
                }
                .padding(.horizontal)
                .padding(.trailing, 60)
                Spacer()
            }
        }
        .rotationEffect(.degrees(-180))
        .navigationBarTitleDisplayMode(.inline)
    }
}
