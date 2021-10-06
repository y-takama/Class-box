//
//  ConversationCell.swift
//  ConversationCell
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    @State var alertDeleteMesage = false
    let message: Message
    let user: User
    
    var body: some View {
        HStack(spacing: 8) {
            if message.user.profileImageUrl == "" {
                let username = message.user.fullname!
                let start = String(username.prefix(2))
                Text(start)
                    .font(.system(size: 17, weight: .semibold))
                    .frame(width: 42, height: 42)
                    .padding(4)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 0.3)
                    )
                    .foregroundColor(Color("TextColor"))
            } else {
                KFImage(URL(string: message.user.profileImageUrl!))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .background(Color("TintColor"))
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 0.3)
                    )
            }
            
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
                HStack {
                    if user.uid == message.fromId {
                        Text("あなた")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                        
                    }
                    Text(message.text)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
            }
            .padding(.trailing,8)
            Spacer()
        }
        .padding(7)
        .padding(.horizontal, 7)
        .background(user.uid != message.fromId && message.read! ? Color.green.opacity(0.05) : Color.clear)
        .alert(isPresented: $alertDeleteMesage) {
            Alert(title: Text("メッセージの消去"),
                  message: Text("消去したメッセージは復元できません。\(message.user.fullname!)さんとのメッセージを消去してもよろしいですか？"),
                  primaryButton: .cancel(Text("Cancel")),
                  secondaryButton: .destructive(Text("メッセージを消去"),
                                                action: deleteMessage)
            )
        }
    }
    func deleteMessage() {
//        guard let user = AuthViewModel.shared.currentUser else { return }
//        let docRef = COLLECTION_MESSAGES.document(message.user.uid!).collection(user.uid!)
//        docRef.delete() { err in
//            if let err = err {
//                print("Error removing document: \(err)")
//                report()
//            }
//        }
    }
}
