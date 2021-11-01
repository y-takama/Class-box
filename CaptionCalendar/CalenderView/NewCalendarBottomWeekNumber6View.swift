//
//  NewCalendarBottomWeekNumber6View.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/03.
//

import SwiftUI

struct NewCalendarBottomWeekNumber6View: View {
    var year : Int
    var month : Int
    @Binding var data : Int
    var startdaynumber : Int
    var days : Int
    let column = 7
    let width = UIScreen.main.bounds.width
    let dt = Date()
    @StateObject var viewModel = CalenderContentViewModel()
//    @ObservedObject var eventsRepository = EventsRepository.shared
//    @State private var showingSheet = false
    
    var body: some View {
        let today = NewCalendarBottomWeekNumber6View.longDateFormatter.string(from: dt)
        let lastweeknumber = (days - (7 - startdaynumber)) % 7
        VStack(spacing: 0) {
            HStack(spacing: 0){
                ForEach(0..<self.column,id:\.self){ index in
                    Button(action: {
                        data = 22-startdaynumber+index
                    }, label: {
                        ZStack(alignment: .top){
                            let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",22-startdaynumber+index)
                            Rectangle()
                                .frame(width:width/7,height:80)
                                .foregroundColor(data == 22-startdaynumber+index ? Color.gray.opacity(0.1) : Color.clear)
                                .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                        , width: today == selectedData ? 1 : 0.2)
                            
                            VStack(spacing: 2) {
                                if index == 0 {
                                    Text("\(22-startdaynumber+index)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.red)
                                        .padding(.top, 4)
                                } else if index == 6 {
                                    Text("\(22-startdaynumber+index)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.blue)
                                        .padding(.top, 4)
                                } else {
                                    Text("\(22-startdaynumber+index)")
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
                                    if reminder.TimestampCalendarString == selectedData && reminder.day {
                                        CalenderReminderCell(reminder: reminder)
                                    }
                                }
                            }
                        }
                    })
                }
            }
            HStack(spacing: 0){
                ForEach(0..<self.column,id:\.self){ index in
                    Button(action: {
                        data = 29-startdaynumber+index
                    }, label: {
                        ZStack(alignment: .top){
                            let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",29-startdaynumber+index)
                            Rectangle()
                                .frame(width:width/7,height:80)
                                .foregroundColor(data == 29-startdaynumber+index ? Color.gray.opacity(0.1) : Color.clear)
                                .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                        , width: today == selectedData ? 1 : 0.2)
                            
                            VStack(spacing: 2) {
                                if index == 0 {
                                    Text("\(29-startdaynumber+index)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.red)
                                        .padding(.top, 4)
                                } else if index == 6 {
                                    Text("\(29-startdaynumber+index)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.blue)
                                        .padding(.top, 4)
                                } else {
                                    Text("\(29-startdaynumber+index)")
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
                                    if reminder.TimestampCalendarString == selectedData && reminder.day {
                                        CalenderReminderCell(reminder: reminder)
                                    }
                                }
                            }
                        }
                    })
                }
            }
            HStack(spacing: 0){
                //                if lastweeknumber != 0 {
                ForEach(0..<lastweeknumber,id:\.self){ index in
                    Button(action: {
                        data = 36-startdaynumber+index
                    }, label: {
                        ZStack(alignment: .top){
                            let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",36-startdaynumber+index)
                            Rectangle()
                                .frame(width:width/7,height:80)
                                .foregroundColor(data == 36-startdaynumber+index ? Color.gray.opacity(0.1) : Color.clear)
                                .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                        , width: today == selectedData ? 1 : 0.2)
                            
                            VStack(spacing: 2) {
                                if index == 0 {
                                    Text("\(36-startdaynumber+index)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.red)
                                        .padding(.top, 4)
                                } else if index == 6 {
                                    Text("\(36-startdaynumber+index)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.blue)
                                        .padding(.top, 4)
                                } else {
                                    Text("\(36-startdaynumber+index)")
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
                                    if reminder.TimestampCalendarString == selectedData && reminder.day {
                                        CalenderReminderCell(reminder: reminder)
                                    }
                                }
                            }
                        }
                    })
                }
                ForEach(0..<(7-lastweeknumber),id:\.self){ index in
                    Button(action: {
                        //                            self.data = index + 1
                        //                            self.month = month + 1
                    }, label: {
                        ZStack(alignment: .top){
                            Rectangle()
                                .frame(width:width/7,height:80)
                                .foregroundColor(Color.clear)
                                .border(Color("BackgroundColor"), width: 0.2)
                            
                            VStack(spacing: 2) {
                                Text("\(index + 1)")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(Color("BackgroundColor"))
                                    .padding(.top, 4)
                                
                                
                            }
                        }
                    })
                }
                //                }
                //                else {
                //                    ForEach(0..<lastweeknumber,id:\.self){ index in
                //                        Button(action: {
                //                            data = 36-startdaynumber+index
                //                        }, label: {
                //                            ZStack(alignment: .top) {
                //                                let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",36-startdaynumber+index)
                //                                Rectangle()
                //                                    .frame(width:width/7,height:80)
                //                                    .foregroundColor(data == 36-startdaynumber+index ? Color.red.opacity(0.1) : Color.clear)
                //                                    .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                //                                            , width: today == selectedData ? 1 : 0.2)
                //                                VStack(spacing: 2) {
                //                                    if index == 0 {
                //                                        Text("\(36-startdaynumber+index)")
                //                                            .font(.system(size: 12))
                //                                            .bold()
                //                                            .foregroundColor(Color.red)
                //                                            .padding(.top, 4)
                //                                    } else if index == 6 {
                //                                        Text("\(36-startdaynumber+index)")
                //                                            .font(.system(size: 12))
                //                                            .bold()
                //                                            .foregroundColor(Color.blue)
                //                                            .padding(.top, 4)
                //                                    } else {
                //                                        Text("\(36-startdaynumber+index)")
                //                                            .font(.system(size: 12))
                //                                            .bold()
                //                                            .foregroundColor(Color("TextColor"))
                //                                            .padding(.top, 4)
                //                                    }
                //                                }
                //                            }
                //                        })
                //                    }
                //                }
            }
        }
        .onAppear() {
            viewModel.fetchCalendar()
            viewModel.fetchReminder()
        }
    }
    private static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
//        formatter.timeStyle = .short
        formatter.dateFormat = "MMdd"
        return formatter
    }()
    
    private static var longDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
//        formatter.timeStyle = .short
        formatter.dateFormat = "YYYYMMdd"
        return formatter
    }()
}
