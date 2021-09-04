//
//  MainTabView.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import SwiftUI
import EventKit
import Combine

struct MainTabView: View {
    let user: User
    var body: some View {
        TabView {
            
//            Text(user.university!)
            
            MainCalendarView(user: user)
//            ClassboxView()
                .tabItem {
                    VStack {
                        Image(systemName: "calendar")
                        Text("Calendar")
                    }
                }
            
            CalendarListView(user: user)
//            SettingCalendarSheetView()
                .frame(alignment: .top)
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
            
            if user.userStats == "student" {
                MainTableView(user: user)
                    .tabItem {
                        VStack {
                            Image(systemName: "square.grid.3x3")
                            Text("TimeTable")
                        }
                    }
            }
            
            ConversationsView()
                .tabItem {
                    VStack {
                        Image(systemName: "message")
                        Text("Chat")
                    }
                }
            NewsView()
//            SettingView()
                .tabItem {
                    VStack {
                        Image(systemName: "newspaper")
                        Text("News")
                    }
                }
            
        }
        .onAppear() {
            UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            UITabBar.appearance().barTintColor = UIColor(named: "TintColor")
        }
        .accentColor(Color("CaptionColor"))
    }
}
