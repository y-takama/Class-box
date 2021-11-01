//
//  UserActionButton.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/21.
//

import SwiftUI

struct UserActionButton: View {
    @ObservedObject var viewModel: UserListViewModel
    var body: some View {
        Button(action: {
            withAnimation() {
                viewModel.user.isFollowed ? viewModel.unfollow() : viewModel.follow()
            }
        }, label: {
            Text(viewModel.user.isFollowed ? "フォロー中" : "フォロー")
                .font(Font.system(size: 13, weight: .semibold))
                .frame(width: 64, height: 14)
                .padding(8)
                .padding(.horizontal, 5)
                .foregroundColor(viewModel.user.isFollowed ? Color("TextColor") : Color("TintColor"))
                .background(viewModel.user.isFollowed ? Color("TintColor") : Color("CaptionColor"))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("TextColor"), lineWidth: 0.3)
                )
                .cornerRadius(15)
            
        })
    }
}
