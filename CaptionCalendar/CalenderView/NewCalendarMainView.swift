//
//  NewCalendarMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/03.
//

import SwiftUI
import Kingfisher

struct NewCalendarMainView: View {
    @Binding var showMenu: Bool
    @Binding var showCalendarSheet: Bool
    @State var year : Int = AppDelegate().year
    @State var month : Int = AppDelegate().month
    @State var data : Int = AppDelegate().data
    @State private var showingMenu: Bool = false
    @State private var notificationButton: Bool = false
    let user: User
    let dayofweek = ["日","月","火","水","木","金","土"]
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0..<self.dayofweek.count){ index in
                            ZStack(alignment: .bottom) {
                                Rectangle()
                                    .frame(width:getScreenBounds().width/7,height:20)
                                    .foregroundColor(Color.clear)
                                Text(dayofweek[index])
                                    .font(.system(size:10))
                            }
                        }
                        
                    }.padding(.bottom, 5)
                    TabView {
                        NewCalendarContentView(year: year,
                                               month: month, data: $data,
                                               week: CalendarModel().GetWeekNumber(year: self.year,
                                                                                   month: self.month),
                                               start: CalendarModel().DayofWeekCalc(year: self.year,
                                                                                    month: self.month,
                                                                                    day: 1),
                                               days: CalendarModel().DayNumber(year: self.year, month: self.month))
                        
                        ForEach(1..<12) { num in
                            NewCalendarContentView(year: self.month+num >= 13 ? self.year+1 : self.year,
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
                }
                NavigationLink(destination: {
                    CreateNewCalenderView(user: user).navigationBarBackButtonHidden(true)
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(Color("TintColor"))
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .padding(15)
                        .background(Color("CaptionColor"))
                        .cornerRadius(26)
                        .padding()
                })
            }
            .navigationBarItems(leading: sideMenuButon, trailing:
                                    HStack(spacing: 10) {
                NotificationButton
                CalendarSettingButton
            }).navigationBarTitleDisplayMode(.inline)
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
        }).fullScreenCover(isPresented: $notificationButton) {
            NotificationMainView(notificationButton: $notificationButton)
        }
    }
    var NotificationButton: some View {
        Button(action: {
            notificationButton.toggle()
        }, label: {
            Image(systemName: "bell")
            //                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(Color("TextColor"))
        })
    }
    
    var CalendarSettingButton: some View {
        Button(action: {
            showCalendarSheet.toggle()
        }, label: {
            Image(systemName: "text.alignright")
            //                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(Color("TextColor"))
        })
    }
    
    
    class AppDelegate: UIResponder, UIApplicationDelegate {
        let year : Int = Calendar.current.component(.year, from: Date())
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
