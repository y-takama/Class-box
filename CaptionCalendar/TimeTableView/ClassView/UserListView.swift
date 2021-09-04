//
//  UserListView.swift
//  UserListView
//
//  Created by 髙間洋平 on 2021/08/26.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: ClassDetailViewModel
    @State private var isShowAlert = false
    let user: User
    var body: some View {
        ScrollView {
            HStack(spacing: 20) {
                if viewModel.classmember.count != 1 {
                    NavigationLink(destination:
                        ClassUserNote()
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
                                .stroke(Color("TextColor"), lineWidth: 0.5)
                        )
                    })
                } else {
                    Button(action: {
                        isShowAlert.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "bubble.left.and.bubble.right")
                            Text("オープンチャット")
                                .font(.system(size: 15, weight: .semibold))
                        }
                        .foregroundColor(Color("TextColor"))
                        .frame(width: 180, height: 46)
                        .overlay(
                            RoundedRectangle(cornerRadius: 23)
                                .stroke(Color("TextColor"), lineWidth: 0.5)
                        )
                        
                    }).alert(isPresented: $isShowAlert) {
                        Alert(title: Text(""),
                              message: Text("オープンチャットは二人以上で利用することができます"),
                              dismissButton: .default(Text("OK")))
                    }
                }
            }
            .padding(15)
            ForEach(viewModel.classmember) { classinfo in
                if classinfo.fullname! == user.fullname {
                    HStack(spacing: 15) {
                        if classinfo.profileImageUrl == "" {
                            ZStack {
                                Circle()
                                    .frame(width: 50 ,height: 50)
                                    .foregroundColor(Color(.systemGray3))
                                
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30 ,height: 30)
                                    .foregroundColor(Color(.systemGray5))
                            }
                        } else {
                            ZStack {
                                Circle()
                                    .frame(width: 50 ,height: 50)
                                    .foregroundColor(Color(.systemGray3))
                                
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30 ,height: 30)
                                    .foregroundColor(Color(.systemGray5))
                            }
                        }
                        VStack(alignment: .leading, spacing: 6) {
                            Text(classinfo.fullname!)
                                .bold()
                                .font(.system(size: 15))
                            Text(classinfo.uid!)
                                .modifier(SecondaryCaptionTextStyle())
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                } else {
                    HStack(spacing: 15) {
                        if classinfo.profileImageUrl == "" {
                            ZStack {
                                Circle()
                                    .frame(width: 50 ,height: 50)
                                    .foregroundColor(Color(.systemGray3))
                                
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30 ,height: 30)
                                    .foregroundColor(Color(.systemGray5))
                            }
                        } else {
                            ZStack {
                                Circle()
                                    .frame(width: 50 ,height: 50)
                                    .foregroundColor(Color(.systemGray3))
                                
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30 ,height: 30)
                                    .foregroundColor(Color(.systemGray5))
                            }
                        }
                        VStack(alignment: .leading, spacing: 6) {
                            Text(classinfo.fullname!)
                                .bold()
                                .font(.system(size: 15))
                            Text(classinfo.uid!)
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
