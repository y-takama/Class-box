//
//  SideMenuHeaderView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/08.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @State private var showProfileView = false
    @State private var showSettingView = false
    @State private var isShowAlert = false
    let user: User
    var body: some View {
        VStack(spacing: 0) {
            ForEach(CalendarSettingViewModel.allCases, id: \.self) { option in
                if option == .profile {
                    Button(action: { showProfileView.toggle() } ) {
                        SideMenuOptionHeaderCell(option: option)
                    }
                }
                else if option == .setting {
                    Button(action: { showSettingView.toggle() } ) {
                        SideMenuOptionHeaderCell(option: option)
                    }
                }
                else if option == .hide {
                    Button(action: { isShowAlert.toggle() }) {
                        SideMenuOptionHeaderCell(option: option)
                            .foregroundColor(.gray)
                    }.alert(isPresented: $isShowAlert) {
                        Alert(title: Text(""), message: Text("次回アップデート予定です。アップデートをお待ちください。"), dismissButton: .destructive(Text("OK")))
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showProfileView) {
            ProfileView(user: user)
        }
        .fullScreenCover(isPresented: $showSettingView) {
            SettingView()
        }
        
    }
}

//NavigationLink(
//    destination: ProfileView(user: user).frame(width: getRect().width),
//    label: {
//        SettingSheetView(option: option)
//    })
