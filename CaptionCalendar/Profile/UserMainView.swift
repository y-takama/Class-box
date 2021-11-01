//
//  UserMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/21.
//

import SwiftUI

struct UserMainView: View {
    @State var searchText = ""
    @State private var setting = false
    @State private var search = false
    @State private var selectedFilter: UserFilterOptions = .follow
    let user: User
    var body: some View {
        VStack(spacing: 0) {
            UserFilterButtonView(selectedOption: $selectedFilter)
            SearchBar(text: $searchText)
                .padding(.top)
                .padding(.horizontal)
            ScrollView {
                if selectedFilter == .follow {
                    ProfileUserList(viewModel: SearchViewModel(config: .following(user.uid!)), searchText: $searchText)
                } else if selectedFilter == .follower {
                    ProfileUserList(viewModel: SearchViewModel(config: .followers(user.uid!)), searchText: $searchText)
                } else {
                    
                }
                
            }
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
        .navigationTitle("")
        .navigationBarItems(trailing: HStack(spacing: 10) {
//            settingButton
            searchButton
        })
    }
    var settingButton: some View {
        NavigationLink(destination: {
            UserSearchView(viewModel: SearchViewModel(config: .search), user: user)
        }, label: {
            Image(systemName: "gearshape")
                .font(Font.system(size: 16, weight: .semibold))
        })
    }
    var searchButton: some View {
        NavigationLink(destination: {
            UserSearchView(viewModel: SearchViewModel(config: .search), user: user)
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
        }, label: {
            Image(systemName: "magnifyingglass")
                .font(Font.system(size: 16, weight: .semibold))
        })
    }
}
