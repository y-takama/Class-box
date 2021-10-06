//
//  SettingChatView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/09.
//

import SwiftUI
import Firebase

struct SettingChatView: View {
    @State private var isShowAlert = false
    @State private var showSettingView = false
    @State private var isShowNextUpdate = false
    @State private var isShowClassChat = false
    @Binding var showChatSheet: Bool
    @ObservedObject var viewModel: SettingChatViewModel
    var user: User
//    init(user: User) {
//        self.user = user
//    }
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(SettingViewModel.allCases, id: \.self) { option in
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
                } else if option == .isShowClassChat && user.userStats == "student" {
                    Button(action: {
                        isShowClassChat.toggle()
                        isShowAlert.toggle()
                        
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
            if isShowNextUpdate {
                return Alert(title: Text(""), message: Text("次回アップデート予定です。アップデートをお待ちください。"), dismissButton: .destructive(Text("OK")))
                
            } else if isShowClassChat {
                return Alert(title: Text("ClassChat"),
                             message: Text("ClassChatの表示を変更しますか？"),
                             primaryButton: .cancel(Text("Calcel")),
                             secondaryButton: .default(Text("OK"),
                                                       action: {
                           COLLECTION_USERS.document(user.uid!).updateData(["isShowClassChat": user.isShowClassChat! ? false : true]) { _ in
                           }
                           viewModel.ShowClassChat(user.isCurrentUser)
                           DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                               self.showChatSheet = false
                           }
                       }))
            } else {
                return Alert(title: Text(""), message: Text("次回アップデート予定です。アップデートをお待ちください。"), dismissButton: .destructive(Text("OK")))
            }
            
        }
    }
}
