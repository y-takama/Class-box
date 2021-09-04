//
//  SettingView.swift
//  SettingView
//
//  Created by 髙間洋平 on 2021/08/17.
//

import SwiftUI
struct SettingView: View {
    @State private var showingAlert = false
//    @EnvironmentObject var viewModel: AuthViewModel
//    @ObservedObject var viewModels = AuthViewModel()
//    @State var user: User?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(CalendarSettingViewModel.allCases, id: \.self) { option in
                        if option == .profile {
//                            NavigationLink(
//                                destination: ProfileView(),
//                                label: {
//                                    SettingSheetView(option: option)
//                                })
                        } else if option == .tab {
                            NavigationLink(
                                destination: SettingView(),
                                label: {
                                    SettingSheetView(option: option)
                                })
                        } else if option == .announce {
                            NavigationLink(
                                destination: SettingView(),
                                label: {
                                    SettingSheetView(option: option)
                                })
                        } else if option == .security {
                            NavigationLink(
                                destination: SettingView(),
                                label: {
                                    SettingSheetView(option: option)
                                })
                        } else if option == .privacyPolicy {
                            NavigationLink(
                                destination: SettingView(),
                                label: {
                                    SettingSheetView(option: option)
                                })
                        } else if option == .termsOfService {
                            NavigationLink(
                                destination: SettingView(),
                                label: {
                                    SettingSheetView(option: option)
                                })
                        } else if option == .logout {
                            Button(action: { AuthViewModel.shared.signOut() }) {
                                SettingSheetView(option: option)
                            }
                        }
                    }
                    Divider()
                }
                .frame(width: UIScreen.main.bounds.width-40,
                       alignment: .top)
                
            }
            .padding(.top, 40)
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color("TintColor"))
                    .frame(width:UIScreen.main.bounds.width, height: 40)
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20))
                        .foregroundColor(Color("TextColor"))
                        .padding(.leading, 25)
                })
            }
        }.navigationBarHidden(true)
    }
}
