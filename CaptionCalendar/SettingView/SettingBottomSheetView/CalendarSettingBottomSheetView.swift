//
//  SettingCalendaeSheetView.swift
//  SettingCalendaeSheetView
//
//  Created by 髙間洋平 on 2021/08/19.
//

import SwiftUI

struct CalendarSettingBottomSheetView: View {
    @State private var isShowAlert = false
    @State private var showSettingView = false
    @Binding var showCalendarSetting: Bool
    @Binding var showCalendarSheet: Bool
    let user: User
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(SettingViewModel.allCases, id: \.self) { option in
                if option == .setting {
                    Button(action: { showSettingView.toggle() } ) {
                        SideMenuOptionHeaderCell(option: option)
                    }
                } else if option == .calendarSetting {
                    Button(action: {
                        withAnimation() {
                            self.showCalendarSheet = false
                            self.showCalendarSetting = true
                        }
                    }) {
                        SettingSheetCell(option: option)
                    }
                } else if option == .calendarReminderHidden {
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
        .alert(isPresented: $isShowAlert) {
            Alert(title: Text(""), message: Text("次回アップデート予定です。アップデートをお待ちください。"), dismissButton: .destructive(Text("OK")))
        }
    }
}
