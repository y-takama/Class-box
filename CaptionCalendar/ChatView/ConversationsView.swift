//
//  ConversationsView.swift
//  ConversationsView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
//import KingfisherSwiftUI

struct ConversationsView: View {
    @State private var showingSetting: Bool = false
    @State private var showingMenu: Bool = false
    @State var isShowingNewMessageView = false
    @State var showChat = false
    @State var user: User?
//    let users: User
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
            .navigationBarItems(leading: menuButton)
            .navigationBarItems(trailing: ChatSettingButton)
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
            showingMenu.toggle()
        }, label: {
            Image(systemName: "text.alignleft")
                .foregroundColor(Color("TextColor"))
        }).sheet(isPresented: $showingMenu) {
            SettingTimeTableView(user: user!)
        }
//            .halfSheet(showSheet: $showingMenu) {
//                SettingTimeTableView(user: )
//            }
    }
    
    var ChatSettingButton: some View {
        Menu {
            Button(action: {}) {
                Text("カレンダーを追加")
                Image(systemName: "calendar.badge.plus")
            }
            
            Button(action: {}) {
                Text("予定を追加")
                Image(systemName: "plus")
            }
            Button(action: {}) {
                Text("学年歴を追加")
                Image(systemName: "calendar.badge.exclamationmark")
            }
            Button(action: {}) {
                Text("就活カレンダーを追加")
                Image(systemName: "calendar.badge.exclamationmark")
            }
            Button(action: {}) {
                Text("TimeTableの使い方を見る")
                Image(systemName: "doc")
            }
        } label: {
            Image(systemName: "ellipsis")
                .foregroundColor(Color("TextColor"))
        }
    }
    
}
