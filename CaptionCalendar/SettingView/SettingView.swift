//
//  SettingView.swift
//  SettingView
//
//  Created by 髙間洋平 on 2021/08/17.
//

import SwiftUI
struct SettingView: View {
    @State private var showingAlert = false
    @State private var isShowAlert = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(CalendarSettingViewModel.allCases, id: \.self) { option in
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
                            Button(action: { isShowAlert.toggle() }) {
                                SettingSheetCell(option: option)
                            }
                        } else if option == .termsOfService {
                            Button(action: { isShowAlert.toggle() }) {
                                SettingSheetCell(option: option)
                            }
                        }
                    }
                    Divider()
                }
                .alert(isPresented: $isShowAlert) {
                    Alert(title: Text(""), message: Text("次回アップデート予定です。アップデートをお待ちください。"), dismissButton: .destructive(Text("OK")))
                }
                .frame(width: UIScreen.main.bounds.width-40,
                       alignment: .top)
                
            }
            .navigationBarItems(trailing: backButton)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    var backButton: some View {
        Button(action: {
            mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.down")
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }
}
