//
//  SideMenuTabView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/08.
//

import SwiftUI

struct SideMenuTabView: View {
    @State private var showNotificationView = false
    @State private var showWorkPlaceView = false
    @State private var showRemindarView = false
    var body: some View {
        VStack(spacing: 0) {
            ForEach(SideMenuOption.allCases, id: \.self) { option in
                if option == .calendar {
                    Button(action: { showNotificationView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
                else if option == .calendarList {
                    Button(action: { showNotificationView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
                else if option == .timeTable {
                    Button(action: { showNotificationView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
                else if option == .chat {
                    Button(action: { showNotificationView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
                else if option == .news {
                    Button(action: { showNotificationView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
                else if option == .notification {
                    Button(action: { showNotificationView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
                else if option == .workPlace {
                    Button(action: { showWorkPlaceView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
                else if option == .reminder {
                    Button(action: { showRemindarView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
            }
            .animation(.default)
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
    }
}

struct SideMenuTabView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuTabView()
    }
}
