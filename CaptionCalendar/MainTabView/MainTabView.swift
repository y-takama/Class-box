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
    @State var showCalendarSheet = false
    @State var showTimeTableSheet = false
    @State var showChatSheet = false
    @State var selection = 0
    @State var showMenu: Bool = false
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    let user: User
    var body: some View {
        let sideBarWidth = getRect().width - 90
        ZStack {
            HStack(spacing: 0) {
                SideMenu(showMenu: $showMenu, user: user)
                if #available(iOS 15.0, *) {
                    TabView(selection: $selection) {
                        MainCalendarView(showMenu: $showMenu, showCalendarSheet: $showCalendarSheet, user: user)
                            .tabItem {
                                VStack {
                                    Image(systemName: "calendar")
                                    Text("Calendar")
                                }
                            }.tag(0)
                        
                        CalendarListView(user: user)
                            .tabItem {
                                VStack {
                                    Image(systemName: "list.bullet")
                                    Text("List")
                                }
                            }.tag(1)
                        
                        if user.userStats == "student" {
                            MainTableView(showTimeTableSheet: $showTimeTableSheet, user: user)
                                .tabItem {
                                    VStack {
                                        Image(systemName: "square.grid.3x3")
                                        Text("TimeTable")
                                    }
                                }.tag(2)
                        }
                        
                        ConversationsView(showChatSheet: $showChatSheet, users: user)
                            .tabItem {
                                VStack {
                                    Image(systemName: "message")
                                    Text("Chat")
                                }
                            }.tag(3)
                        NewsMainView()
                            .tabItem {
                                VStack {
                                    Image(systemName: "newspaper")
                                    Text("News")
                                }
                            }.tag(4)
                        
                    }
                    .frame(width: getRect().width)
                    .overlay(Rectangle()
                                .fill(
                                    Color.primary.opacity(Double((offset/sideBarWidth)/5))
                                )
                                .ignoresSafeArea(.container, edges: .vertical)
                                .onTapGesture { withAnimation { showMenu.toggle()}})
                } else {
                    TabView(selection: $selection) {
                        MainCalendarView(showMenu: $showMenu, showCalendarSheet: $showCalendarSheet, user: user)
                            .tabItem {
                                VStack {
                                    Image(systemName: "calendar")
                                    Text("Calendar")
                                }
                            }.tag(0)
                        
                        CalendarListView(user: user)
                            .tabItem {
                                VStack {
                                    Image(systemName: "list.bullet")
                                    Text("List")
                                }
                            }.tag(1)
                        
                        if user.userStats == "student" {
                            MainTableView(showTimeTableSheet: $showTimeTableSheet, user: user)
                                .tabItem {
                                    VStack {
                                        Image(systemName: "square.grid.3x3")
                                        Text("TimeTable")
                                    }
                                }.tag(2)
                        }
                        
                        ConversationsView(showChatSheet: $showChatSheet, users: user)
                            .tabItem {
                                VStack {
                                    Image(systemName: "message")
                                    Text("Chat")
                                }
                            }.tag(3)
                        NewsMainView()
                            .tabItem {
                                VStack {
                                    Image(systemName: "newspaper")
                                    Text("News")
                                }
                            }.tag(4)
                        
                    }
                    .frame(width: getRect().width)
                    .overlay( offset > 0 || showMenu == true ?
                                Rectangle()
                                .fill(
                                    Color.primary.opacity(Double((offset/sideBarWidth)/5))
                                )
                                .ignoresSafeArea(.container, edges: .vertical)
                                .onTapGesture { withAnimation { showMenu.toggle()} } : nil )
                }
                
            }
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset > 0 && selection == 0 ? offset : 0)
            .gesture(
                selection == 0 ?
                    DragGesture()
                    .updating($gestureOffset, body: { value, out, _ in
                        out = value.translation.width
                    }).onEnded(onEnd(value:))
                    : nil
            )
            .onAppear() {
                UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                UITabBar.appearance().barTintColor = UIColor(named: "TintColor")
            }
            .animation(.easeOut, value: offset == 0)
            .onChange(of: showMenu) { newValue in
                if showMenu && offset == 0 {
                    offset = sideBarWidth
                    lastStoredOffset = offset
                }
                if !showMenu && offset == sideBarWidth {
                    offset = 0
                    lastStoredOffset = 0
                }
            }
            .onChange(of: gestureOffset, perform: { newValue in
                onChange()
            })
            
            VStack {
                Spacer()
                ZStack {
                    SettingTimeTableView()
                        .offset(y: self.showTimeTableSheet ? 0 : UIScreen.main.bounds.height)
                    SettingCalendarSheetView()
                        .offset(y: self.showCalendarSheet ? 0 : UIScreen.main.bounds.height)
                    SettingChatView()
                        .offset(y: self.showChatSheet ? 0 : UIScreen.main.bounds.height)
                }
            }
            .background((self.showCalendarSheet || self.showTimeTableSheet || self.showChatSheet ? Color("TextColor").opacity(0.2) : Color.clear)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                self.showCalendarSheet = false
                                self.showTimeTableSheet = false
                                self.showChatSheet = false
            })
            .ignoresSafeArea(edges: .bottom)
            .animation(.default)
        }
    }
    func onChange(){
        let sideBarWidth = getRect().width - 90
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideBarWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    func onEnd(value: DragGesture.Value){
        let sideBarWidth = getRect().width - 90
        let translation = value.translation.width
        withAnimation {
            if translation > 0 {
                if translation > (sideBarWidth / 2) {
                    offset = sideBarWidth
                    showMenu = true
                } else {
                    if offset == sideBarWidth {
                        return
                    }
                    offset = 0
                    showMenu = false
                }
            } else {
                if -translation > (sideBarWidth / 2) {
                    offset = 0
                    showMenu = false
                } else {
                    if offset == 0 || !showMenu {
                        return
                    }
                    offset = sideBarWidth
                    showMenu = true
                }
            }
        }
        lastStoredOffset = offset
    }
}
