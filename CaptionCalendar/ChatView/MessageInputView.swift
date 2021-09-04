//
//  MessageInputView.swift
//  MessageInputView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
//    let placeholder: String
    
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            HStack {
                TextField("Message...", text: $messageText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 25)
                    .foregroundColor(Color("TextColor"))
                    .padding(7)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                if messageText.count < 1 {
                    Button(action: {}) {
                        Image(systemName: "paperplane")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                            .frame(width: 25, height: 25)
                    }
                } else {
                    Button(action: action) {
                        Image(systemName: "paperplane")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("CaptionColor"))
                            .frame(width: 25, height: 25)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
    }
}
