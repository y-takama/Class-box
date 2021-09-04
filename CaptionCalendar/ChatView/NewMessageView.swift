//
//  NewMessageView.swift
//  NewMessageView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    @Binding var user: User?
    @ObservedObject var viewModel = SearchViewModel(config: .newMessage)
    
    var body: some View {
        SearchBar(text: $searchText)
            .padding()
        ScrollView {
            VStack(alignment: .leading) {
                if searchText.isEmpty {
                    
                } else {
                    ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
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
    }
}
