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
    @State private var userinfomation = false
    @State var classuser: User
    let user: User
    let classinfo: TimeTable
    var body: some View {
        VStack {
            ScrollView {
                VStack {
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
                                        .font(.system(size: 10))
                                        .modifier(SecondaryCaptionTextStyle())
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        } else {
                            HStack(spacing: 15) {
                                Button(action: {
                                    self.classuser = classinfo
                                    withAnimation() {
                                        userinfomation.toggle()
                                    }
                                }, label: {
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
                                })
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(classinfo.fullname!)
                                        .bold()
                                        .font(.system(size: 14))
                                    Text(classinfo.username!)
                                        .font(.system(size: 10))
                                        .modifier(SecondaryCaptionTextStyle())
                                }
                                Spacer()
                                UserActionButton(viewModel: UserListViewModel(user: classinfo))
                                NavigationLink(destination: ChatView(user: classinfo)
                                                .navigationBarTitleDisplayMode(.inline),
                                               label: {
                                    Image(systemName: "bubble.left")
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
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        }
                    }
                }.padding(.top, 10)
            }
            if userinfomation {
                Divider()
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        if classuser.profileImageUrl == "" {
                            let username = classuser.fullname
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
                            KFImage(URL(string: classuser.profileImageUrl!))
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
                        Spacer()
                    }
                    Text(classuser.fullname!)
                        .bold()
                        .font(.system(size: 14))
                    Text(classuser.username!)
                        
                        .modifier(SecondaryCaptionTextStyle())
                }
                .frame(width: getScreenBounds().width - 40)
                .padding(.top, 10)
            }
        }
        .navigationTitle("")
        .navigationBarItems(trailing: classChat)
    }
    var classChat: some View {
        NavigationLink(destination:
                        ClassChatView(user: user, classinfo: classinfo)
        , label: {
            Image(systemName: "bubble.left.and.bubble.right")
                .font(Font.system(size: 16, weight: .semibold))
        })
    }
}
