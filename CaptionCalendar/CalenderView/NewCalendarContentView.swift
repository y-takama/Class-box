//
//  NewCalendarContentView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/03.
//

import SwiftUI
import GoogleMobileAds

struct NewCalendarContentView: View {
    var year : Int
    var month : Int
    @Binding var data: Int
    @State var selectedday = 1
    var startdaynumber : Int
    var weeknumber : Int
    var days : Int
    var lastweeknumber : Int
    let column = 7
    let width = UIScreen.main.bounds.width
    let dt = Date()
    var showingSheet = false
    @State private var showingEditSheet = false
    @ObservedObject var viewModel = CalenderContentViewModel()
    init(year: Int, month: Int, data: Binding<Int>, week: Int, start: Int, days: Int){
//        self.selectedday = data
        self.year = year
        self.month = month
        self._data = data
        self.weeknumber = week
        self.startdaynumber = start
        self.days = days
        self.lastweeknumber = (days - (7 - start)) % 7
    }
    
    var body: some View {
        let starts = CalendarModel().DayofWeekCalc(year: year,
                                                   month: month,
                                                   day: 1)
        
        let today = NewCalendarContentView.longDateFormatter.string(from: dt)
        ScrollView(showsIndicators: false) {
            VStack {
                VStack(spacing: 0) {
                    // 1週
                    HStack(spacing: 0) {
                        if self.startdaynumber != 0{
                            ForEach(0..<self.startdaynumber,id:\.self){ index in
                                Button(action: {
                                    
                                }, label: {
                                    ZStack(alignment: .top){
                                        Rectangle()
                                            .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 120)
                                            .foregroundColor(Color.clear)
                                            .border(Color("BackgroundColor"), width: 0.2)
                                        Text("")
                                            .font(.system(size: 15))
                                            .padding(.top, 4)
                                    }
                                })
                            }
                        }
                        ForEach(0..<(self.column-self.startdaynumber),id:\.self){ index in
                            Button(action: {
                                data = 1+index
                            }, label: {
                                ZStack(alignment: .top){
                                    let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",index+1)
                                    Rectangle()
                                        .frame(width:width/7,height: weeknumber == 5 ? 96 : 80)
                                        .foregroundColor(data == 1+index ? Color.gray.opacity(0.1) : Color.clear)
                                        .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                                , width: today == selectedData ? 1 : 0.2)
                                    VStack(spacing: 2) {
                                        if index + starts == 0 {
                                            Text("\(index+1)")
                                                .font(.system(size: 12))
                                                .bold()
                                                .foregroundColor(Color.red)
                                                .padding(.top, 4)
                                        } else if index + starts == 6 {
                                            Text("\(index+1)")
                                                .font(.system(size: 12))
                                                .bold()
                                                .foregroundColor(Color.blue)
                                                .padding(.top, 4)
                                        } else {
                                            Text("\(index+1)")
                                                .font(.system(size: 12))
                                                .bold()
                                                .foregroundColor(Color("TextColor"))
                                                .padding(.top, 4)
                                        }
                                        ForEach(viewModel.calendar, id: \.self) { calendar in
                                            if calendar.TimestampCalendarStartString == selectedData {
                                                CalendarCell(calendar: calendar)
//                                                CalenderReminderCell(reminder: reminder)
                                            }
                                            if calendar.TimestampCalendarStartString < selectedData && calendar.TimestampCalendarEndString >= selectedData {
                                                CalenderAllDayCell(calendar: calendar)
                                            }
                                        }
                                        ForEach(viewModel.reminder, id: \.self) { reminder in
                                            if reminder.TimestampCalendarString == selectedData {
                                                CalenderReminderCell(reminder: reminder)
                                            }
                                        }
                                    }
                                }
                            })
                        }
                    }
//                    Divider()
                    // 2週
                    HStack(spacing: 0){
                        ForEach(0..<self.column,id:\.self){ index in
                            Button(action: {
                                data = 8-starts+index
                            }, label: {
                                ZStack(alignment: .top){
                                    let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",8-starts+index)
                                    Rectangle()
                                        
//                                        .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 120)
                                    //                                .frame(width:width/7,height:80)
                                        .foregroundColor(data == 8-starts+index ? Color.gray.opacity(0.1) : Color.clear)
                                        .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                                , width: today == selectedData ? 1 : 0.2)
                                    
                                    VStack(spacing: 2) {
                                        if index == 0 {
                                            Text("\(8-starts+index)")
                                                .font(.system(size: 12))
                                                .bold()
                                                .foregroundColor(Color.red)
                                                .padding(.top, 4)
                                            
                                        } else if index == 6 {
                                            Text("\(8-starts+index)")
                                                .font(.system(size: 12))
                                                .bold()
                                                .foregroundColor(Color.blue)
                                                .padding(.top, 4)
                                        } else {
                                            Text("\(8-starts+index)")
                                                .font(.system(size: 12))
                                                .bold()
                                                .foregroundColor(Color("TextColor"))
                                                .padding(.top, 4)
                                        }
                                        ForEach(viewModel.calendar, id: \.self) { calendar in
                                            if calendar.TimestampCalendarStartString == selectedData {
                                                CalendarCell(calendar: calendar)
//                                                CalenderReminderCell(reminder: reminder)
                                            }
                                            if calendar.TimestampCalendarStartString < selectedData && calendar.TimestampCalendarEndString >= selectedData {
                                                CalenderAllDayCell(calendar: calendar)
                                            }
                                        }
                                        ForEach(viewModel.reminder, id: \.self) { reminder in
                                            if reminder.TimestampCalendarString == selectedData {
                                                CalenderReminderCell(reminder: reminder)
                                            }
                                        }
                                    }
                                }.frame(width:width/7,height: weeknumber == 5 ? 96 : 80)
                            })
                        }
                    }
//                    Divider()
                    // 3週
                    HStack(alignment: .top, spacing: 0){
                        ForEach(0..<self.column,id:\.self){ index in
                            Button(action: {
                                data = 15-starts+index
                            }, label: {
                                ZStack(alignment: .top){
                                    let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",15-starts+index)
                                    Rectangle()
                                        .frame(width:width/7,height: weeknumber == 6 ? 80 : 96)
                                        .foregroundColor(data == 15-starts+index ? Color.gray.opacity(0.1) : Color.clear)
                                        .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                                , width: today == selectedData ? 1 : 0.2)

                                    VStack(spacing: 1) {
                                        if index == 0 {
                                            Text("\(15-starts+index)")
                                                .font(.system(size: 12))
                                                .bold()
                                                .foregroundColor(Color.red)
                                                .frame(height: 19)
                                        } else if index == 6 {
                                            Text("\(15-starts+index)")
                                                .font(.system(size: 12))
                                                .bold()
                                                .foregroundColor(Color.blue)
                                                .frame(height: 19)
                                        } else {
                                            Text("\(15-starts+index)")
                                                .font(.system(size: 12))
                                                .bold()
                                                .foregroundColor(Color("TextColor"))
                                                .frame(height: 19)
                                        }
                                        ScrollView(showsIndicators: false) {
                                            VStack(spacing: 1) {
                                                ForEach(viewModel.calendar, id: \.self) { calendar in
                                                    if calendar.TimestampCalendarStartString == selectedData {
                                                        CalendarCell(calendar: calendar)
        //                                                CalenderReminderCell(reminder: reminder)
                                                    }
                                                    if calendar.TimestampCalendarStartString < selectedData && calendar.TimestampCalendarEndString >= selectedData {
                                                        CalenderAllDayCell(calendar: calendar)
                                                    }
                                                }
                                                ForEach(viewModel.reminder, id: \.self) { reminder in
                                                    if reminder.TimestampCalendarString == selectedData {
                                                        CalenderReminderCell(reminder: reminder)
                                                    }
                                                }
                                            }
                                        }.frame(width:width/7,height: weeknumber == 6 ? 60 : 76)
                                    }
                                }
                            })
                        }
                    }
//                    Divider()
                    // 4,5,6週
                    if self.weeknumber == 4{
//                        NewCalendarBottomWeekNumber4View(year: year, month: month, data: $data, start: startdaynumber, days: days).frame(height: 120)
                    } else if self.weeknumber == 5{
                        NewCalendarBottomWeekNumber5View(year: year, month: month, data: $data, selectedday: $selectedday, start: startdaynumber, days: days).frame(height: 192)
                    }else if self.weeknumber == 6{
                        NewCalendarBottomWeekNumber6View(year: year, month: month, data: $data, selectedday: $selectedday, start: startdaynumber, days: days).frame(height: 240)
                    }
                    
                }.frame(minHeight: 480)
                HStack {
                    Text("\(self.month)月\(self.data)日")
                        .font(.system(size: 15))
                        .bold()
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                ForEach(viewModel.calendar, id: \.self) { calendar in
                    if calendar.TimestampCalendarStartString == String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",data) {
                        CalendarDetailView(calendar: calendar)
//                        CalendarCell(calendar: calendar)
                    }
                    if calendar.TimestampCalendarStartString < String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",data) && calendar.TimestampCalendarEndString >= String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",data) {
                        CalendarDetailView(calendar: calendar)
                    }
                }
                
                ForEach(viewModel.reminder, id: \.self) { reminder in
                    if reminder.TimestampCalendarString ==
                        String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",data) {
                        NavigationLink(destination: {
                            ReminderDeteilView(reminder: reminder)
                        }, label: {
                            CalenderReminderDetailCell(reminder: reminder)
                        })
                    }
                }
                AdView(adUnitID: "ca-app-pub-6537638223494633/2390446421")
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.width*5/16)
                    .padding(.top, 80)
                Spacer()
            }
        }
        .navigationTitle("\(String(self.year))年\(self.month)月")
    }
    private static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        //        formatter.timeStyle = .short
        formatter.dateFormat = "MMdd"
        return formatter
    }()
    
    private static var longDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMdd"
        return formatter
    }()
}
