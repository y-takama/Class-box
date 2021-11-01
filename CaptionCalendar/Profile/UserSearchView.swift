//
//  UserSearchView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/21.
//

import SwiftUI

struct UserSearchView: View {
    @State var searchText = ""
    @StateObject var viewModel: SearchViewModel
    let user: User
    var body: some View {
        SearchBar(text: $searchText)
            .padding(.horizontal)
        ScrollView {
            VStack {
                ForEach(searchText.isEmpty ?  viewModel.filteredUniversityUsers(user.university ?? "") : viewModel.filteredUsers(searchText)) { user in
                    UserCell(user: user)
                }
            }.padding(.horizontal, 20).padding(.vertical, 10)
        }
    }
}
