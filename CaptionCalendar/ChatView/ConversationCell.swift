//
//  ConversationCell.swift
//  ConversationCell
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
//import KingfisherSwiftUI

struct ConversationCell: View {
    let message: Message
    
    
    var body: some View {
        
        HStack(spacing: 8) {
            Circle()
                .frame(width: 52, height: 52)
                .foregroundColor(Color(.systemGray5))
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(message.user.fullname!)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color("TextColor"))
                    
                    Spacer()
                    
                    Text("\(message.timestampString) ago")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .padding(.trailing, -20)
                }
                
                Text(message.text)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            .padding(.trailing,8)
            
            Spacer()
        }
        .padding(7)
        .padding(.top, 7)
        .padding(.bottom, -9)
    }
}
