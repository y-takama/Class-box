//
//  ConversationsView.swift
//  ConversationsView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
//import KingfisherSwiftUI

struct ConversationsView: View {
    @Binding var showChatSheet: Bool
    @State private var showingMenu: Bool = false
    @State var isShowingNewMessageView = false
    @State var showChat = false
    @State var user: User?
    var users: User
    @ObservedObject var viewModel: ConversationsViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack(alignment: .bottomTrailing) {
                    if let user = user {
                        NavigationLink(destination: LazyView(ChatView(user: user)),
                                       isActive: $showChat,
                                       label: {} )
                    }
                    VStack(spacing: 0) {
                        if viewModel.classChat.isShowClassChat! {
                            ConversationClassChatView(user: users)
                        }
                        ScrollView {
                            VStack(spacing: 1) {
                                ForEach(viewModel.recentMessages) { message in
                                    NavigationLink(
                                        destination: ChatView(user: User(message: message)),
                                        label: {
                                            ConversationCell(message: message, user: users)
                                            
                                        })
                                }
                            }.padding(.top, 10)
                        }
                    }
                    HStack {
                        Spacer()
                        HStack {
                            Button(action:
                                    { self.isShowingNewMessageView.toggle() }
                                   , label: {
                                Image(systemName: "envelope.open")
                                    .resizable()
                                    .foregroundColor(Color("TintColor"))
                                    .scaledToFit()
                                    .frame(width: 22, height: 22)
                                    .padding(15)
                            })
                        }
                        .background(Color("CaptionColor"))
                        .cornerRadius(26)
                        .padding()
                        .sheet(isPresented: $isShowingNewMessageView, content: {
                            NewMessageView(show: $isShowingNewMessageView, startChat: $showChat, user: $user, users: users)
                        })
                    }
                }
                .navigationTitle("Chat")
                .navigationBarItems(trailing: HStack(spacing: 15) {
                    ChatSettingButton
                    menuButton
                })
                .navigationBarTitleDisplayMode(.inline)
                //            .onTapGesture {
                //                UIApplication.shared.closeKeyboard()
                //            }
            }
            if viewModel.loading {
                ZStack {
                    Color("TintColor").ignoresSafeArea()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("TextColor")))
                        .scaleEffect(1)
                }
            }
        }
        .onAppear {
            viewModel.fetchRecentMessages()
        }
    }
    
    var menuButton: some View {
        Button(action: {
            showChatSheet.toggle()
        }, label: {
            Image(systemName: "text.alignright")
//                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(Color("TextColor"))
        })
    }
    
    var ChatSettingButton: some View {
        Menu {
            Button(action: {}) {
                Text("Chatの使い方を見る")
                Image(systemName: "doc")
            }
        } label: {
            Image(systemName: "ellipsis")
//                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(Color("TextColor"))
        }
    }
    
}
