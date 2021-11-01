//
//  ConversationsView.swift
//  ConversationsView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
import Firebase
//import KingfisherSwiftUI

struct ConversationsView: View {
    @Binding var showChatSheet: Bool
    @State private var showingMenu: Bool = false
    @State var isShowingNewMessageView = false
    @State var showChat = false
    @State private var selectedFilter: ChatFilterOptions = .main
    @State var user: User?
    var users: User
    @StateObject var viewModel: ConversationsViewModel
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomTrailing) {
                if let user = user {
                    NavigationLink(destination: LazyView(ChatView(user: user)),
                                   isActive: $showChat,
                                   label: {} )
                }
                VStack(spacing: 0) {
                    if users.isShowClassChat! {
                        ConversationClassChatView(user: users)
                    }
                    
                    ChatFilterButtonView(selectedOption: $selectedFilter)
                        .padding(.top, 10)
                    ZStack {
                        ScrollView {
                            VStack(spacing: 1) {
                                if selectedFilter == .main {
                                    ForEach(viewModel.recentMessages) { message in
                                        NavigationLink(
                                            destination: ChatView(user: User(message: message)),
                                            label: {
                                                ConversationCell(message: message, user: users)
                                                    .redacted(reason: viewModel.loading ? .placeholder: [])
                                            })
                                    }
                                } else {
                                    RequestView()
                                }
                            }.padding(.top, 10)
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
                }
                HStack {
                    Spacer()
                    HStack {
                        Button(action:
                                { self.isShowingNewMessageView.toggle() }
                               , label: {
                            Image(systemName: "envelope.open")
                                .font(Font.system(size: 24, weight: .semibold))
                                .foregroundColor(Color("TintColor"))
                                .frame(width: 24, height: 24)
                                .padding(14)
                                .background(Color("CaptionColor"))
                                .cornerRadius(26)
                                .padding()
                                .shadow(color: .gray, radius: 4, x: 1, y: 1)
                        })
                    }
                    .sheet(isPresented: $isShowingNewMessageView, content: {
                        NewMessageView(show: $isShowingNewMessageView, startChat: $showChat, user: $user, users: users)
                    })
                }
            }
        }.onAppear {
            viewModel.fetchRecentMessages()
        }
    }
}
extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        print(dataDict)
    }
}
