//
//  SettingTimeTableView.swift
//  SettingTimeTableView
//
//  Created by 髙間洋平 on 2021/08/19.
//

import SwiftUI

struct TimeTableSettingBottomSheetView: View {
    @State private var isShowAlert = false
    @State private var showSettingView = false
    @Binding var showTimetableSetting: Bool
    @Binding var showTimeTableSheet: Bool
    let user: User
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(SettingViewModel.allCases, id: \.self) { option in
                if option == .setting {
                    Button(action: { showSettingView.toggle() } ) {
                        SideMenuOptionHeaderCell(option: option)
                    }
                } else if option == .timetableSetting {
                    Button(action: {
                        withAnimation() {
                            self.showTimeTableSheet = false
                            self.showTimetableSetting = true
                        }
                    }) {
                        SettingSheetCell(option: option)
                    }
                } else if option == .isShowTextbook && user.isShowTextbook! == false {
                    Button(action: { isShowTextbook() }) {
                        SettingSheetCell(option: option)
                    }
                } else if option == .isHiddenTextbook && user.isShowTextbook! {
                    Button(action: { isShowTextbook() }) {
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
    func isShowTextbook() {
        COLLECTION_USERS.document(user.uid!).updateData(["isShowTextbook": user.isShowTextbook! ? false : true]) { _ in
            AuthViewModel.shared.fetchUserSettingLoading()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.showTimeTableSheet = false
        }
    }
}
