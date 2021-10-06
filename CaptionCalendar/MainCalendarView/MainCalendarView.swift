//
//  MainCalendarView.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import SwiftUI
import UIKit
import EventKitUI
import GoogleMobileAds
import Kingfisher

struct MainCalendarView: View {
    @Binding var showMenu: Bool
    @Binding var showCalendarSheet: Bool
    enum ActiveSheet {
        case calendarChooser
        case calendarEdit
    }
    @State var year : Int = AppDelegate().year
    @State var month : Int = AppDelegate().month
    @State var data : Int = AppDelegate().data
    @State private var showingSheet = false
    @State private var showingEditSheet = false
    @State private var showingMenu: Bool = false
    @State private var selectedEvent: EKEvent?
    @State private var activeSheet: ActiveSheet = .calendarChooser
    @State var selection: Int = 4
    @ObservedObject var eventsRepository = EventsRepository.shared
    let width = UIScreen.main.bounds.width
    let user: User
    let dayofweek = ["日","月","火","水","木","金","土"]
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    HStack(spacing: 0) {
                        ForEach(0..<self.dayofweek.count){ index in
                            ZStack(alignment: .bottom) {
                                Rectangle()
                                    .frame(width:width/7,height:20)
                                    .foregroundColor(Color.clear)
                                Text(dayofweek[index])
                                    .font(.system(size:10))
                            }
                        }
                        
                    }.frame(height: 20)
                    Divider()
                    TabView {
                        CalendarView(year: year,
                                     month: month, data: $data,
                                     week: CalendarModel().GetWeekNumber(year: self.year,
                                                                         month: self.month),
                                     start: CalendarModel().DayofWeekCalc(year: self.year,
                                                                          month: self.month,
                                                                          day: 1),
                                     days: CalendarModel().DayNumber(year: self.year, month: self.month))
                        
                        ForEach(1..<10) { num in
                            //                            var tag = num+4
                            CalendarView(year: self.month+num >= 13 ? self.year+1 : self.year,
                                         month: self.month+num >= 13 ? self.month+num-12 : self.month+num,
                                         data: $data,
                                         week: CalendarModel().GetWeekNumber(year: self.month+num >= 13 ? self.year+1 : self.year,
                                                                             month: self.month+num >= 13 ? self.month+num-12 : self.month+num),
                                         start: CalendarModel().DayofWeekCalc(year: self.month+num >= 13 ? self.year+1 : self.year,
                                                                              month: self.month+num >= 13 ? self.month+num-12 : self.month+num,
                                                                              day: 1),
                                         days: CalendarModel().DayNumber(year: self.month+num >= 13 ? self.year+1 : self.year,
                                                                         month: self.month+num >= 13 ? self.month+num-12 : self.month+num))
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(minHeight: 670)
                    .padding(.top, -8)
                    .padding(.bottom, 10)
                    
                    if eventsRepository.events?.isEmpty ?? true {
                        Text("No events available for this calendar selection")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    
//                    AdView()
//                        .frame(width: UIScreen.main.bounds.width,
//                               height: UIScreen.main.bounds.width*5/16)
//                        .padding(.top, 80)
                }
                
                VStack {
                    Button(action:{
                        self.selectedEvent = nil
                        self.activeSheet = .calendarEdit
                        self.showingEditSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color("TintColor"))
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .padding(15)
                    })
                    .background(Color("CaptionColor"))
                    .cornerRadius(26)
                    .padding()
                    .sheet(isPresented: $showingEditSheet, content: {
                        EventEditView(eventStore: self.eventsRepository.eventStore, event: self.selectedEvent)
                            .ignoresSafeArea()
                    })
                }
                
            }
            .navigationBarItems(leading: sideMenuButon, trailing:
                                    HStack(spacing: 15) {
                                        CalendarSettingButton
                                        menuButton
                                    }
            )
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $showingSheet) {
            CalendarChooser(calendars: self.$eventsRepository.selectedCalendars, eventStore: self.eventsRepository.eventStore)
                .ignoresSafeArea()
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
                    .font(.system(size: 15, weight: .semibold))
                    .frame(width: 28, height: 28)
                    .padding(5)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 19)
                            .stroke(Color.gray, lineWidth: 0.3)
                    )
                    .foregroundColor(Color("TextColor"))
            } else {
                KFImage(URL(string: user.profileImageUrl!))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 38, height: 38)
                    .background(Color("TintColor"))
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 19)
                            .stroke(Color.gray, lineWidth: 0.3)
                    )
            }
            
        })
    }
    var CalendarSettingButton: some View {
        Menu {
            Button(action:{
                self.activeSheet = .calendarChooser
                self.showingSheet.toggle()
            }, label: {
                Text("カレンダーを追加")
                Image(systemName: "calendar.badge.plus")
            })
            
            
            Button(action: {
                self.selectedEvent = nil
                self.activeSheet = .calendarEdit
                self.showingEditSheet.toggle()
            }) {
                Text("予定を追加")
                Image(systemName: "plus")
            }
            Button(action: {}) {
                Text("カレンダーを登録する")
                Image(systemName: "calendar.badge.exclamationmark")
            }
            Button(action: {}) {
                Text("Calendarの使い方を見る")
                Image(systemName: "doc")
            }
        } label: {
            Image(systemName: "ellipsis")
//                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(Color("TextColor"))
        }
    }
    
    var menuButton: some View {
        Button(action: {
            showCalendarSheet.toggle()
        }, label: {
            Image(systemName: "text.alignright")
//                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(Color("TextColor"))
        })
//        .sheet(isPresented: $showingMenu) {
//            SettingCalendarSheetView()
//        }
//            .halfSheet(showSheet: $showingMenu) {
//                SettingCalendarSheetView(user: user)
//            }
    }
    
    func showEditFor(_ event: EKEvent) {
        activeSheet = .calendarEdit
        //        selectedEvent = event
        showingEditSheet = true
    }
    
    class AppDelegate: UIResponder, UIApplicationDelegate {
        // 現在の日付から年のみを取得
        let year : Int = Calendar.current.component(.year, from: Date())// 月のみを取得
        let month : Int = Calendar.current.component(.month, from: Date())
        let data : Int = Calendar.current.component(.day, from: Date())
    }
    
    private static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        //        formatter.timeStyle = .short
        formatter.dateFormat = "YYYYMMdd"
        return formatter
    }()
    
    private static var dateFormatterMonth: DateFormatter = {
        let formatter = DateFormatter()
        //        formatter.timeStyle = .short
        formatter.dateFormat = "YYYYMM"
        return formatter
    }()
    
    private static var dateFormatterDetail: DateFormatter = {
        let formatter = DateFormatter()
        //        formatter.timeStyle = .short
        formatter.dateFormat = "MM/dd/HH/mm"
        return formatter
    }()
}
