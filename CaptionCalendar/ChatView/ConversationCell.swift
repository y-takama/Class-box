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
        HStack(spacing: 0) {
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
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(message.user.fullname!)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color("TextColor"))
                        .frame(width: getScreenBounds().width - 190, alignment: .leading)
//                    Spacer()
                    Text("\(message.timestampString)前")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .frame(width: 70, alignment: .trailing)
                        .padding(.leading, 10)
                }
                HStack(spacing: 10) {
                    if user.uid == message.fromId {
                        Text("あなた")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                            .frame(width: 40, alignment: .leading)
                    }
                    Text(message.text)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                    Spacer()
                }
            }.padding(.leading, 10)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 7)
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
