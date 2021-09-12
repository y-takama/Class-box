//
//  SettingTimeTableView.swift
//  SettingTimeTableView
//
//  Created by 髙間洋平 on 2021/08/19.
//

import SwiftUI

struct SettingTimeTableView: View {
    @State private var isShowAlert = false
    @State private var showSettingView = false
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(CalendarSettingViewModel.allCases, id: \.self) { option in
                if option == .profile {
                    //                            NavigationLink(
                    //                                destination: ProfileView(user: user),
                    //                                label: {
                    //                                    SettingSheetView(option: option)
                    //                                })
                } else if option == .setting {
                    Button(action: { showSettingView.toggle() } ) {
                        SideMenuOptionHeaderCell(option: option)
                    }
                } else if option == .timetableSetting {
                    Button(action: { isShowAlert.toggle() }) {
                        SettingSheetCell(option: option)
                    }
                } else if option == .hide {
                    Button(action: { isShowAlert.toggle() }) {
                        SettingSheetCell(option: option)
                    }
                    
                }
            }
        }
        .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.top, 20)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color("TintColor"))
        .cornerRadius(25)
        .fullScreenCover(isPresented: $showSettingView) {
            SettingView()
        }
        .alert(isPresented: $isShowAlert) {
            Alert(title: Text(""), message: Text("次回アップデート予定です。アップデートをお待ちください。"), dismissButton: .destructive(Text("OK")))
        }
    }
}
