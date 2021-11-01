//
//  RequestView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/21.
//

import SwiftUI
import Kingfisher

struct RequestView: View {
    @StateObject var viewModel = RequestViewModel()
    var body: some View {
        ForEach(viewModel.request, id: \.self) { userinfo in
            HStack(spacing: 10) {
                if userinfo.isRead! {
                    Circle()
                        .fill(Color("TintColor"))
                        .frame(width: 6, height: 6)
                        .padding(.leading, 6)
                } else {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 6, height: 6)
                        .padding(.leading, 6)
                        .onAppear() {
                            isRead(id: userinfo.docId!)
                        }
                }
                Button(action: {
                    //                        self.classuser = classinfo
                    //                        withAnimation() {
                    //                            userinfomation.toggle()
                    //                        }
                }, label: {
                    if userinfo.profileImageUrl == "" {
                        let username = userinfo.fullname
                        let start = String(username!.prefix(2))
                        Text(start)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(width: 32, height: 32)
                            .padding(4)
                            .clipShape(Circle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 0.3)
                            )
                            .foregroundColor(Color("TextColor"))
                    } else {
                        KFImage(URL(string: userinfo.profileImageUrl!))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .background(Color("TintColor"))
                            .clipShape(Circle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 0.3)
                            )
                    }
                })
                VStack(alignment: .leading, spacing: 6) {
                    Text(userinfo.fullname!)
                        .bold()
                        .font(.system(size: 13)) +
                    Text(" さんがあなたをフォローしました")
                        .font(.system(size: 12)) +
                    Text("         ") +
                    Text(userinfo.timestampString)
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                }.frame(width: getScreenBounds().width - 220)
                UserActionButton(viewModel: UserListViewModel(user: userinfo))
                    .frame(width: 90, alignment: .trailing)
                Button(action: {
                    DeleteNotification(id: userinfo.docId!)
                }, label: {
                    Image(systemName: "trash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14 ,height: 14)
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("TextColor"), lineWidth: 0.3)
                        )
                })
            }
            .padding(.trailing, 10)
            .padding(.vertical, 5)
        }
        
    }
    func isRead(id: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let docRef = COLLECTION_NOTIFICATION.document(uid).collection("user-notifications").document(id)
        docRef.updateData(["isRead": true])
    }
    func DeleteNotification(id: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let docRef = COLLECTION_NOTIFICATION.document(uid).collection("user-notifications").document(id)
        docRef.delete() { err in
            if err == nil {
                viewModel.fetchUserRequest()
            }
        }
    }
}
