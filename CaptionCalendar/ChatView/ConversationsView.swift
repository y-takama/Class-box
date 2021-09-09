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
    let users: User
//    @State private var showingMenu = false
    @ObservedObject var viewModel = ConversationsViewModel()
    
    //    @State private var showingMenu = false
    //    @EnvironmentObject var viewModels: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                if let user = user {
                    NavigationLink(destination: LazyView(ChatView(user: user)),
                                   isActive: $showChat,
                                   label: {} )
                }
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.recentMessages) { message in
                            NavigationLink(
                                destination: ChatView(user: User(message: message)),
                                label: {
                                    ConversationCell(message: message)
                                        
                                })
                        }
                    }
                }
                .padding(.horizontal, 7)
                .padding(.top, -7)
                
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
                        NewMessageView(show: $isShowingNewMessageView, startChat: $showChat, user: $user)
                    })
                }
            }
            .navigationTitle("Chat")
            .navigationBarItems(trailing: HStack(spacing: 20) {
                ChatSettingButton
                menuButton
            })
            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarItems(leading: menuButton)
//            .navigationBarItems(trailing: ChatSettingButton)
        }
        .onAppear {
            viewModel.fetchRecentMessages()
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
//        .onAppear(perform: {
//            self.showingMenu = false
//        })
    }
    
    var menuButton: some View {
        Button(action: {
            showChatSheet.toggle()
        }, label: {
            Image(systemName: "text.alignright")
                .font(Font.system(size: 18, weight: .bold))
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
                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(Color("TextColor"))
        }
    }
    
}
