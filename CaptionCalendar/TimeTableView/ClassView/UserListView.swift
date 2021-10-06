//
//  UserListView.swift
//  UserListView
//
//  Created by 髙間洋平 on 2021/08/26.
//

import SwiftUI
import Kingfisher

struct UserListView: View {
    @ObservedObject var viewModel: ClassDetailViewModel
    @State private var isShowAlert = false
    let user: User
    let classinfo: TimeTable
    var body: some View {
        ScrollView {
            HStack(spacing: 20) {
                NavigationLink(destination:
                                ClassChatView(user: user, classinfo: classinfo)
                , label: {
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("オープンチャット")
                            .font(.system(size: 15, weight: .semibold))
                    }
                    .foregroundColor(Color("TextColor"))
                    .frame(width: 180, height: 46)
                    .overlay(
                        RoundedRectangle(cornerRadius: 23)
                            .stroke(Color("TextColor"), lineWidth: 0.3)
                    )
                })
            }
            .padding(15)
            ForEach(viewModel.classmember) { classinfo in
                if classinfo.fullname! == user.fullname {
                    HStack(spacing: 15) {
                        if classinfo.profileImageUrl == "" {
                            let username = classinfo.fullname
                            let start = String(username!.prefix(2))
                            Text(start)
                                .font(.system(size: 15, weight: .semibold))
                                .frame(width: 38, height: 38)
                                .padding(4)
                                .clipShape(Circle())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 23)
                                        .stroke(Color.gray, lineWidth: 0.3)
                                )
                                .foregroundColor(Color("TextColor"))
                        } else {
                            KFImage(URL(string: classinfo.profileImageUrl!))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 46, height: 46)
                                .background(Color("TintColor"))
                                .clipShape(Circle())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 23)
                                        .stroke(Color.gray, lineWidth: 0.3)
                                )
                        }
                        VStack(alignment: .leading, spacing: 6) {
                            Text(classinfo.fullname!)
                                .bold()
                                .font(.system(size: 15))
                            Text(classinfo.username!)
                                .modifier(SecondaryCaptionTextStyle())
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                } else {
                    HStack(spacing: 15) {
                        if classinfo.profileImageUrl == "" {
                            let username = user.fullname
                            let start = String(username!.prefix(2))
                            Text(start)
                                .font(.system(size: 15, weight: .semibold))
                                .frame(width: 38, height: 38)
                                .padding(4)
                                .clipShape(Circle())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 23)
                                        .stroke(Color.gray, lineWidth: 0.3)
                                )
                                .foregroundColor(Color("TextColor"))
                        } else {
                            KFImage(URL(string: classinfo.profileImageUrl!))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 46, height: 46)
                                .background(Color("TintColor"))
                                .clipShape(Circle())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 23)
                                        .stroke(Color.gray, lineWidth: 0.3)
                                )
                        }
                        VStack(alignment: .leading, spacing: 6) {
                            Text(classinfo.fullname!)
                                .bold()
                                .font(.system(size: 14))
                            Text(classinfo.username!)
                                .modifier(SecondaryCaptionTextStyle())
                        }
                        Spacer()
                        NavigationLink(destination: ChatView(user: classinfo)
                                        .navigationBarTitleDisplayMode(.inline),
                                       label: {
                            Image(systemName: "bubble.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16 ,height: 16)
                                .foregroundColor(Color("TextColor"))
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(Color("TextColor"), lineWidth: 0.3)
                                )
                        })
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                }
            }
        }
//        .navigationBarTitle("Member")
    }
}
