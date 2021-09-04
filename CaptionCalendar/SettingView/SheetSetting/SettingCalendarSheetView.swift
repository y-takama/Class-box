//
//  SettingCalendaeSheetView.swift
//  SettingCalendaeSheetView
//
//  Created by 髙間洋平 on 2021/08/19.
//

import SwiftUI



struct SettingCalendarSheetView: View {
//    @State var user: User?
//    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var viewModels = AuthViewModel()
    let user: User
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(CalendarSettingViewModel.allCases, id: \.self) { option in
                        if option == .profile {
                            NavigationLink(
                                destination: ProfileView(user: user),
                                label: {
                                    SettingSheetView(option: option)
                                })
                        } else if option == .setting {
                            NavigationLink(
                                destination: SettingView(),
                                label: {
                                    SettingSheetView(option: option)
                                })
                        } else if option == .calendarSetting {
                            NavigationLink(
                                destination: SettingCalendar(),
                                label: {
                                    SettingSheetView(option: option)
                                })
                        } else if option == .hide {
                            Button(action: { AuthViewModel.shared.signOut() }) {
                                SettingSheetView(option: option)
                            }
                        }
                    }
                    
                }
                .padding(.top, 40)
                .frame(width: UIScreen.main.bounds.width-40,
                       alignment: .top)
                .navigationBarHidden(true)
                Spacer()
            }
            
        }
    }
}
