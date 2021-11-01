//
//  SideMenuTabView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/08.
//

import SwiftUI

struct SideMenuTabView: View {
    let user: User
    @State private var showNotificationView = false
    @State private var showStudyView = false
    @State private var showWorkPlaceView = false
    @State private var showRemindarView = false
    @State private var emailUpdate = false
    @State private var emailUpdateView = false
    var body: some View {
        VStack(spacing: 0) {
            ForEach(MenuOption.allCases, id: \.self) { option in
                if option == .calendar {
                    Button(action: { showNotificationView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
                if option == .calendarList {
                    Button(action: { showNotificationView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
                if option == .timeTable {
                    if user.userStats == "standard" {
                        Button(action: { emailUpdate.toggle() } ) {
                            SideMenuOptionGrayCell(option: option)
                        }
                    } else {
                        Button(action: { showNotificationView.toggle() } ) {
                            SideMenuOptionCell(option: option)
                        }
                    }
                }
                if option == .chat {
                    Button(action: { showNotificationView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
//                if option == .news {
//                    Button(action: { showNotificationView.toggle() } ) {
//                        SideMenuOptionCell(option: option)
//                    }
//                }
//                else if option == .study {
//
//                    Button(action: { showStudyView.toggle() } ) {
//                        SideMenuOptionCell(option: option)
//                    }
//                }
//                if option == .notification {
//                    Button(action: { showNotificationView.toggle() } ) {
//                        SideMenuOptionCell(option: option)
//                    }
//                }
//                if option == .workPlace {
//                    Button(action: { showWorkPlaceView.toggle() } ) {
//                        SideMenuOptionCell(option: option)
//                    }
//                }
                if option == .reminder {
                    Button(action: { showRemindarView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
            }
//            .animation(.default)
        }
        .alert(isPresented: $emailUpdate) {
            Alert(title: Text("学生アカウントにアップデートする"),
                  message: Text("学生アカウントにアップデートすることで利用することができます"),
                  primaryButton: .cancel(Text("Calcel")),
                  secondaryButton: .default(Text("OK"),
                                            action: {
                emailUpdateView.toggle()
                                            }))
        }
        .fullScreenCover(isPresented: $showNotificationView) {
            UnfinishedView()
        }
        .fullScreenCover(isPresented: $showWorkPlaceView) {
            UnfinishedView()
        }
        .fullScreenCover(isPresented: $showRemindarView) {
            UnfinishedView()
        }
//        .fullScreenCover(isPresented: $showStudyView) {
//            NavigationView {
//                TextBookMainView(showStudyView: $showStudyView, user: user)
//            }.accentColor(Color("CaptionColor"))
//
//        }
        .fullScreenCover(isPresented: $emailUpdateView) {
            AuthEmailUpdateSelectedLocationView(emailUpdateView: $emailUpdateView)
        }
    }
}
