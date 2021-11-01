//
//  SettingChatView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/09.
//

import SwiftUI
import Firebase

struct ChatSettingBottomSheetView: View {
    @State private var isShowAlert = false
    @State private var showSettingView = false
    @State private var isShowNextUpdate = false
    @State private var isShowClassChat = false
    @Binding var showChatSheet: Bool
//    @ObservedObject var viewModel: SettingChatViewModel
    var user: User
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(SettingViewModel.allCases, id: \.self) { option in
                if option == .setting {
                    Button(action: { showSettingView.toggle() } ) {
                        SideMenuOptionHeaderCell(option: option)
                    }
                } else if option == .chatSetting {
                    Button(action: {
                        isShowNextUpdate.toggle()
                        isShowAlert.toggle()
                    }) {
                        SettingSheetCell(option: option)
                    }
                } else if option == .hide {
                    Button(action: {
                        isShowNextUpdate.toggle()
                        isShowAlert.toggle()
                    }) {
                        SettingSheetCell(option: option)
                    }
                } else if option == .isShowClassChat && user.userStats == "student" && user.isShowClassChat! == false {
                    Button(action: {
                        isShowClassChatView()
                    }) {
                        SettingSheetCell(option: option)
                        
                    }
                } else if option == .isHiddenClassChat && user.userStats == "student" && user.isShowClassChat! {
                    Button(action: {
                        isShowClassChatView()
                    }) {
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
    func isShowClassChatView() {
        COLLECTION_USERS.document(user.uid!).updateData(["isShowClassChat": user.isShowClassChat! ? false : true]) { _ in
            AuthViewModel.shared.fetchUserSettingLoading()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.showChatSheet = false
        }
    }
}
