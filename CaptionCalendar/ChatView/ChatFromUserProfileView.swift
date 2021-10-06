//
//  ChatFromUserProfileView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/27.
//

import SwiftUI
import Kingfisher

struct ChatFromUserProfileView: View {
    let user: User
    @State var alertBloakUser = false
    @State var profileImageButton = false
    @State var profileBackImageButton = false
    @ObservedObject var viewModel: MessageViewModel
    var body: some View {
        ZStack {
            ScrollView {
                ZStack(alignment: .bottomLeading) {
                    if viewModel.messageUser.backImageUrl == "" {
                        Image("image1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: getScreenBounds().width,
                                   height: 140)
                            .clipped()
                    } else {
                        KFImage(URL(string: viewModel.messageUser.backImageUrl!))
                            .resizable()
                            .scaledToFill()
                            .frame(width: getScreenBounds().width,
                                   height: 140)
                            .clipped()
                    }
                    
                    if #available(iOS 15.0, *) {
                        LinearGradient(colors: [
                            .clear,
                            .white.opacity(0.1),
                            .white.opacity(0.2)
                        ], startPoint: .top, endPoint: .bottom)
                            .frame(width: getScreenBounds().width,
                                   height: 140)
                    }
                    
                    HStack(spacing: 20) {
                        if viewModel.messageUser.profileImageUrl == "" {
                            let username = viewModel.messageUser.fullname
                            let start = String(username!.prefix(2))
                            Text(start)
                                .font(.system(size: 24, weight: .semibold))
                                .frame(width: 50, height: 50)
                                .padding(5)
                                .background(Color("TintColor").opacity(0.8))
                                .clipShape(Circle())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.gray, lineWidth: 0.3)
                                )
                                .foregroundColor(Color("TextColor"))
                                .padding(.leading, 20)
                        } else {
                            Button (action: {
                                profileImageButton.toggle()
                            }, label: {
                                KFImage(URL(string: viewModel.messageUser.profileImageUrl!))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .background(Color("TintColor"))
                                    .clipShape(Circle())
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 60)
                                            .stroke(Color.gray, lineWidth: 0.3)
                                    )
                                    .padding(.leading, 20)
                            })
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 5) {
                            if viewModel.messageUser.fullname == "" {
                                Text("名前は設定されていません")
                            } else {
                                Text(viewModel.messageUser.fullname!)
                                    .bold()
                                    .foregroundColor(Color.black)
                            }
                            Text(viewModel.messageUser.username!)
                                .foregroundColor(Color.black)
                                .modifier(SecondaryCaptionTextStyle())
                        }.frame(height: 55)
                        Spacer()
                    }.padding(.bottom, 10)
                }
            }
            
            if profileImageButton {
                ZStack {
                    Color("TextColor").opacity(0.2).ignoresSafeArea()
                        .onTapGesture(perform: {
                            profileImageButton.toggle()
                        })
                    KFImage(URL(string: viewModel.messageUser.profileImageUrl!))
                        .resizable()
                        .scaledToFill()
                        .frame(width: getScreenBounds().width-60,
                               height: getScreenBounds().width-60)
                        .cornerRadius(10)
                        .clipped()
                }
            }
            if profileBackImageButton {
                ZStack {
                    Color("TextColor").opacity(0.2).ignoresSafeArea()
                        .onTapGesture(perform: {
                            profileImageButton.toggle()
                        })
                    KFImage(URL(string: viewModel.messageUser.profileImageUrl!))
                        .resizable()
                        .scaledToFill()
                        .frame(width: getScreenBounds().width-60,
                               height: getScreenBounds().width-60)
                        .cornerRadius(10)
                        .clipped()
                }
            }
        }
        .navigationBarTitle(viewModel.messageUser.fullname!)
        .navigationBarItems(trailing: menuButton)
        .alert(isPresented: $alertBloakUser) {
            Alert(title: Text("ブロック"),
                  message: Text("ブロックしてもよろしいですか？"),
                  primaryButton: .cancel(Text("Cancel")),
                  secondaryButton: .destructive(Text("ブロック"),
                                                action: userBlock)
            )
        }
        
    }
    var menuButton: some View {
        Menu {
            Button(action: {
                alertBloakUser.toggle()
            }) {
                Text("ブロックする")
                Image(systemName: "person.crop.circle.badge.xmark")
            }
        } label: {
            Image(systemName: "ellipsis")
                .font(Font.system(size: 16, weight: .bold))
                .foregroundColor(Color("TextColor"))
        }
    }
    func userBlock() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("BloakList").document(viewModel.messageUser.uid!)
        let data = ["uid": viewModel.messageUser.uid!,
                    "fullname": viewModel.messageUser.fullname!] as [String: Any]
        docRef.setData(data) { _ in
            
        }
    }
}
