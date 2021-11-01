//
//  ProfileUserList.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/21.
//

import SwiftUI

struct ProfileUserList: View {
    @StateObject var viewModel: SearchViewModel
    @Binding var searchText: String
    var body: some View {
        VStack {
            ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { userlist in
                UserCell(user: userlist)
            }
        }
        .padding(.vertical)
    }
}
