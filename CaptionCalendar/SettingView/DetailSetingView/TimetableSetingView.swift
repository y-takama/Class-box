//
//  TimetableSetingView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/20.
//

import SwiftUI
struct TimetableSetingView: View {
    let user: User
    @State private var showingAlert = false
    @State private var isShowAlert = false
    @State private var isShowChangeUserStatusAlert = false
    @State private var isShowPrivacyPolicy = false
    @State private var isShowTermsOfService = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(SettingViewModel.allCases, id: \.self) { option in
                        if option == .profile {
//                            NavigationLink(
//                                destination: ProfileView(),
//                                label: {
//                                    SettingSheetView(option: option)
//                                })
                        } else if option == .tab {
                            Button(action: { isShowAlert.toggle() }) {
                                SettingSheetCell(option: option)
                            }
                            
                        } else if option == .announce {
                            Button(action: { isShowAlert.toggle() }) {
                                SettingSheetCell(option: option)
                            }
                        } else if option == .security {
                            Button(action: { isShowAlert.toggle() }) {
                                SettingSheetCell(option: option)
                            }
                        } else if option == .privacyPolicy {
                            Button(action: { isShowPrivacyPolicy.toggle() }) {
                                SettingSheetCell(option: option)
                            }
                            .fullScreenCover(isPresented: $isShowPrivacyPolicy) {
                                safari(urlString: "https://www.caption-service.com")
                            }
                        } else if option == .termsOfService {
                            Button(action: { isShowTermsOfService.toggle() }) {
                                SettingSheetCell(option: option)
                            }
                            .fullScreenCover(isPresented: $isShowTermsOfService) {
                                safari(urlString: "https://caption-service.com/terms.html")
                            }
                        } else if option == .userstatus {
                            if user.userStats != "student" {
                                Button(action: { isShowChangeUserStatusAlert.toggle() }) {
                                    SettingSheetCell(option: option)
                                }
                            }
                        }
                    }
                    Divider()
                }
                .alert(isPresented: $isShowChangeUserStatusAlert) {
                    Alert(title: Text("ログアウト"),
                          message: Text("ログアウトしてもよろしいてすか？"),
                          primaryButton: .cancel(Text("Calcel")),
                          secondaryButton: .default(Text("OK"),
                                                    action: {
                                                        AuthViewModel.shared.signOut()
                                                    }))
                }
                .frame(width: UIScreen.main.bounds.width-40,
                       alignment: .top)
                
            }
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text(""), message: Text("次回アップデート予定です。アップデートをお待ちください。"), dismissButton: .destructive(Text("OK")))
            }
            
            .navigationBarItems(trailing: backButton)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    var backButton: some View {
        Button(action: {
            mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "multiply.circle.fill")
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }
}
