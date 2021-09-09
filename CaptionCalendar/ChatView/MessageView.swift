//
//  MessageView.swift
//  MessageView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
//import KingfisherSwiftUI

struct MessageView: View {
    let message: Message
//    let viewModel: MessageViewModel
    
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
                    
                    Circle()
                        .frame(width: 52, height: 52)
                        .foregroundColor(Color(.systemGray5))
                    
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
//        .navigationTitle()
        .navigationBarTitleDisplayMode(.inline)
    }
}
