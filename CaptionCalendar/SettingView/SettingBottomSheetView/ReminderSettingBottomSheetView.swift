//
//  SettingReminderView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/03.
//

import SwiftUI

struct ReminderSettingBottomSheetView: View {
    @State private var isShowAlert = false
    @State private var showSettingView = false
    @State private var showSettingCategory = false
    let user: User
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(SettingViewModel.allCases, id: \.self) { option in
                if option == .setting {
                    Button(action: { showSettingView.toggle() } ) {
                        SideMenuOptionHeaderCell(option: option)
                    }
                } else if option == .reminderSetting {
                    Button(action: { isShowAlert.toggle() }) {
                        SettingSheetCell(option: option)
                    }
                } else if option == .reminderCategory {
                    Button(action: { showSettingCategory.toggle() }) {
                        SettingSheetCell(option: option)
                    }
                } else if option == .reminderList {
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
            SettingView(user: user)
        }
        .fullScreenCover(isPresented: $showSettingCategory) {
            ReminderCategoryView(showSettingCategory: $showSettingCategory)
        }
        .alert(isPresented: $isShowAlert) {
            Alert(title: Text(""), message: Text("次回アップデート予定です。アップデートをお待ちください。"), dismissButton: .destructive(Text("OK")))
        }

    }
}
