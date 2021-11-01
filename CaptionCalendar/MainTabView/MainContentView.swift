//
//  MainContentView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/12.
//

import SwiftUI
import Kingfisher

struct MainContentView: View {
//    @EnvironmentObject var viewModel: MainTabViewModel
    @State var showCalendarSheet = false
    @State var showTimeTableSheet = false
    @State var showChatSheet = false
    @State var showReminderSheet = false
    @State var notificationButton = false
    @State var year : Int = AppDelegate().year
    @State var month : Int = AppDelegate().month
    @State var calendarselection = 0
    @Binding var selection: Int
    @Binding var showMenu: Bool
    let user: User
    var body: some View {
        ZStack {
            NavigationView {
                TabView(selection: $selection) {
                    NewCalendarMainView(year: $year, month: $month, selection: $calendarselection, user: user)
                        .onTapGesture {
                            selection = 0
                        }
                        .tabItem {
                            if selection == 0 {
                                VStack {
                                    Image(systemName: "calendar")
                                    Text("Calendar")
                                }
                            } else {
                                VStack {
                                    Image(systemName: "note")
                                    Text("Calendar")
                                }
                            }
                        }.tag(0)
                    
//                    CalendarListView(user: user)
//                        .onTapGesture {
//                            selection = 1
//                        }
//                        .tabItem {
//                            VStack {
//                                Image(systemName: "list.bullet")
//                                Text("List")
//                            }
//                        }.tag(1)
                    
                    if user.userStats == "student" {
                        MainTableView(showTimeTableSheet: $showTimeTableSheet, user: user)
                            .onTapGesture {
                                selection = 2
                            }
                            .tabItem {
                                if selection == 2 {
                                    VStack {
                                        Image(systemName: "square.grid.3x3.fill")
                                        Text("TimeTable")
                                    }
                                } else {
                                    VStack {
                                        Image(systemName: "square.grid.3x3.topleft.filled")
                                        Text("TimeTable")
                                    }
                                }
                                
                            }.tag(2)
                    }
                    ConversationsView(showChatSheet: $showChatSheet, users: user, viewModel: ConversationsViewModel(classChat: user))
                        .onTapGesture {
                            selection = 3
                        }
                        .tabItem {
                            if selection == 3 {
                                VStack {
                                    Image(systemName: "message.and.waveform")
                                    Text("Chat")
                                }
                            } else {
                                VStack {
                                    Image(systemName: "message")
                                    Text("Chat")
                                }
                            }
                        }.tag(3)
                    ReminderMainView(showReminderSheet: $showReminderSheet, user: user)
//                    RegistrationTimetableView()
                        .onTapGesture {
                            selection = 4
                        }
                        .tabItem {
                            VStack {
                                Image(systemName: "tablecells")
                                Text("Reminder")
                            }
                        }.tag(4)
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle(tabTitle(forIndex: selection))
                .navigationBarItems(leading: selection == 0 ? sideMenuButon : nil,
                                    trailing: selection == 0 ? HStack(spacing: 10) {
                    NotificationButton
                    CalendarSettingButton
                } : nil)
                .navigationBarItems(trailing: selection == 2 ? menuButton : nil)
                .navigationBarItems(trailing: selection == 3 ? HStack(spacing: 10) {
                    FriendButton
                    chatMenuButton
                } : nil)
                
//                .navigationBarItems(trailing: selection == 4 ? menuButton : nil)
            }.navigationViewStyle(StackNavigationViewStyle())
            
            //Setting Timetable Sheet
            VStack {
                Spacer()
                ZStack(alignment: .bottom) {
                    TimeTableSettingBottomSheetView(showTimeTableSheet: $showTimeTableSheet,
                                         user: user)
                        .offset(y: self.showTimeTableSheet ? 0 : UIScreen.main.bounds.height)
                }
            }
            .background((self.showTimeTableSheet ? Color("TextColor").opacity(0.2) : Color.clear)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                withAnimation() {
                    self.showTimeTableSheet = false
                }
                                
            }).ignoresSafeArea(edges: .bottom)
            
            //Setting Calendar Sheet
            VStack {
                Spacer()
                ZStack(alignment: .bottom) {
                    CalendarSettingBottomSheetView(user: user)
                        .offset(y: self.showCalendarSheet ? 0 : UIScreen.main.bounds.height)
                }
            }
            .background((self.showCalendarSheet ? Color("TextColor").opacity(0.2) : Color.clear)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                withAnimation() {
                    self.showCalendarSheet = false
                }
            }).ignoresSafeArea(edges: .bottom)
            
            //Setting Chat Sheet
            VStack {
                Spacer()
                ZStack(alignment: .bottom) {
                    ChatSettingBottomSheetView(showChatSheet: $showChatSheet,
                                    user: user)
                        .offset(y: self.showChatSheet ? 0 : UIScreen.main.bounds.height)
                }
            }
            .background(( self.showChatSheet ? Color("TextColor").opacity(0.2) : Color.clear)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                withAnimation() {
                    self.showChatSheet = false
                }
                                
            }).ignoresSafeArea(edges: .bottom)
            
            
            VStack {
                Spacer()
                ZStack(alignment: .bottom) {
                    ReminderSettingBottomSheetView(user: user)
                        .offset(y: self.showReminderSheet ? 0 : UIScreen.main.bounds.height)
                }
            }
            .background((self.showReminderSheet ? Color("TextColor").opacity(0.2) : Color.clear)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                withAnimation() {
                    self.showReminderSheet = false
                }
            })
            .ignoresSafeArea(edges: .bottom)
        }
        .fullScreenCover(isPresented: $notificationButton) {
            NotificationMainView(notificationButton: $notificationButton, user: user)
        }
    }
    
    var sideMenuButon: some View {
        Button(action: {
            showMenu.toggle()
        }, label: {
            if user.profileImageUrl == "" {
                let username = user.fullname
                let start = String(username!.prefix(2))
                Text(start)
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 28, height: 28)
                    .padding(4)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.gray, lineWidth: 0.3)
                    )
                    .foregroundColor(Color("TextColor"))
            } else {
                KFImage(URL(string: user.profileImageUrl!))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .background(Color("TintColor"))
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.gray, lineWidth: 0.3)
                    )
            }
        })
    }
    
    var NotificationButton: some View {
        CalendarBellImage(notificationButton: $notificationButton, user: user)
    }
    
    var CalendarSettingButton: some View {
        Button(action: {
            withAnimation() {
                showCalendarSheet.toggle()
            }
        }, label: {
            Image(systemName: "text.alignright")
                .font(Font.system(size: 16, weight: .semibold))
        })
    }
    
    var menuButton: some View {
        Button(action: {
            withAnimation() {
                showTimeTableSheet.toggle()
            }
        }, label: {
            Image(systemName: "text.alignright")
                .font(Font.system(size: 16, weight: .semibold))
        })
    }
    
    var chatMenuButton: some View {
        Button(action: {
            withAnimation() {
                showChatSheet.toggle()
            }
        }, label: {
            Image(systemName: "text.alignright")
                .font(Font.system(size: 16, weight: .semibold))
        })
    }
    
    var FriendButton: some View {
        NavigationLink(destination: {
            UserMainView(user: user)
        }, label: {
            Image(systemName: "person")
                .font(Font.system(size: 16, weight: .semibold))
        })
    }
    
    class AppDelegate: UIResponder, UIApplicationDelegate {
        let year : Int = Calendar.current.component(.year, from: Date())
        let month : Int = Calendar.current.component(.month, from: Date())
        let data : Int = Calendar.current.component(.day, from: Date())
    }
    
    func tabTitle(forIndex index: Int) -> String {
        switch index {
        case 0: return "\(calendarselection+month > 12 ? year+1 : year)年\(calendarselection+month > 12 ? calendarselection+month-12 : calendarselection+month)月"
        case 1: return "CalendarList"
        case 2: return ""
        case 3: return ""
        case 4: return ""
        default: return ""
        }
    }
}
