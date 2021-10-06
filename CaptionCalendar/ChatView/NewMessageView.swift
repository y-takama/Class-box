//
//  NewMessageView.swift
//  NewMessageView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
import SwiftyJSON
import Kingfisher

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    @Binding var user: User?
    let users: User
    @ObservedObject var viewModel = SearchViewModel(config: .newMessage)
    
    var body: some View {
        SearchBar(text: $searchText)
            .padding(.top)
            .padding(.horizontal)
        ScrollView {
            HStack {
                Text("知り合いかも")
                    .font(.system(size: 12, weight: .semibold))
                    .padding(.top, 5)
                Spacer()
            }.padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(viewModel.filteredUniversityUsers(users.university!)) { user in
                        
                        Button(action: {
                            self.show.toggle()
                            self.startChat.toggle()
                            self.user = user
                        }, label: {
                            VStack(spacing: 8) {
                                if user.profileImageUrl == "" {
                                    let username = user.fullname
                                    let start = String(username!.prefix(2))
                                    Text(start)
                                        .font(.system(size: 15, weight: .semibold))
                                        .frame(width: 40, height: 40)
                                        .padding(5)
                                        .clipShape(Circle())
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(Color.gray, lineWidth: 0.3)
                                        )
                                        .foregroundColor(Color("TextColor"))
                                        .padding(.top, 1)
                                } else {
                                    KFImage(URL(string: user.profileImageUrl!))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .background(Color("TintColor"))
                                        .clipShape(Circle())
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(Color.gray, lineWidth: 0.3)
                                        )
                                        .padding(.top, 1)
                                }
                                Text(user.fullname!)
                                    .font(.system(size: 10))
                                    .frame(height: 12)
                                    .foregroundColor(Color("CaptionColor"))
                            }
                            .frame(width: 58, height: 75)
                        })
                    }
                }.padding(.leading)
            }
            Divider()
            VStack(alignment: .leading) {
                if searchText.isEmpty {
                    VStack {
                        Spacer()
                        Text("名前、IDで検索することができます")
                            .font(.system(size: 10))
                            .foregroundColor(.primary)
                    }.frame(height: getScreenBounds().height/3)
                    
                } else {
                    ForEach(viewModel.filteredUsers(searchText)) { user in
                        HStack { Spacer() }
                        Button(action: {
                            self.show.toggle()
                            self.startChat.toggle()
                            self.user = user
                        }, label: {
                            UserCell(user: user)
                        })
                    }
                }
                
            }
            .padding(.leading)
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
    }
}
