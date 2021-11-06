//
//  NewCalendarMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/03.
//

import SwiftUI
import Kingfisher

struct CalendarMainView: View {
    @State var data : Int = AppDelegate().data
    @State private var showingMenu: Bool = false
    @Binding var year : Int
    @Binding var month : Int
    @Binding var selection: Int
    @ObservedObject var usersetting = SettingModel(setting: Setting(dictionary: [:]))
    let user: User
    let dayofweek = ["日","月","火","水","木","金","土"]
    var body: some View {
        let selectedyear = selection+month > 12 ? year+1 : year
        let selectedmonth = selection+month > 12 ? selection+month-12 : selection+month
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    if usersetting.ctsetting.calendar_timetables {
                        Text("Hello")
                    }
                    TabView(selection: $selection) {
                        ForEach(0..<12) { num in
                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    ForEach(0..<7){ index in
                                        Text(dayofweek[index])
                                            .font(.system(size:10))
                                            .frame(width:getScreenBounds().width/7,height:20)
                                    }
                                }.padding(.bottom, 5)
                                NewCalendarContentView(year: self.month+num >= 13 ? self.year+1 : self.year,
                                                       month: self.month+num >= 13 ? self.month+num-12 : self.month+num,
                                                       data: $data,
                                                       weeknumber: CalendarModel().GetWeekNumber(year: self.month+num >= 13 ? self.year+1 : self.year,
                                                                                                 month: self.month+num >= 13 ? self.month+num-12 : self.month+num),
                                                       startdaynumber: CalendarModel().DayofWeekCalc(year: self.month+num >= 13 ? self.year+1 : self.year,
                                                                                                     month: self.month+num >= 13 ? self.month+num-12 : self.month+num,
                                                                                                     day: 1),
                                                       days: CalendarModel().DayNumber(year: self.month+num >= 13 ? self.year+1 : self.year,
                                                                                       month: self.month+num >= 13 ? self.month+num-12 : self.month+num))
                            }
                        }
                    }
                    .frame(height: 515)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    HStack {
                        Text("\(selectedmonth)月\(data)日")
                            .bold()
                            .font(.system(size:18))
                        Spacer()
                    }.padding(.leading)
                    
                    CalendarContentDetailView(data: $data,
                                              selectedyear: selectedyear,
                                              selectedmonth: selectedmonth)
                    
                    
                    
                    //TestAD
//                    AdView(adUnitID: "ca-app-pub-3940256099942544/2934735716")
                        AdView(adUnitID: "ca-app-pub-6537638223494633/2390446421")
                        .frame(width: UIScreen.main.bounds.width,
                               height: UIScreen.main.bounds.width*5/16)
                        .padding(.top, 80)
                    Spacer()
                }
            }
            
            NavigationLink(destination: {
                CreateNewCalenderView(user: user).navigationBarBackButtonHidden(true)
            }, label: {
                Image(systemName: "plus")
                    .font(Font.system(size: 24, weight: .semibold))
                    .foregroundColor(Color("TintColor"))
                    .frame(width: 24, height: 24)
                    .padding(14)
                    .background(Color("CaptionColor"))
                    .cornerRadius(26)
                    .padding()
                    .shadow(color: .gray, radius: 4, x: 1, y: 1)
            })
            
            
        }
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
