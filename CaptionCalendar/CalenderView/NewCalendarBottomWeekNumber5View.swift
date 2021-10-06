//
//  NewCalendarBottomWeekNumber5View.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/03.
//

import SwiftUI

struct NewCalendarBottomWeekNumber5View: View {
    var year : Int
    var month : Int
    @Binding var data : Int
    @Binding var  selectedday: Int
    var startdaynumber : Int
    var days : Int
    var lastweeknumber : Int
    let column = 7
    let width = UIScreen.main.bounds.width
    let dt = Date()
//    @ObservedObject var eventsRepository = EventsRepository.shared
    @State private var showingSheet = false
    init(year: Int, month: Int, data: Binding<Int>, selectedday: Binding<Int>, start: Int, days: Int){
        self.year = year
        self.month = month
        self._data = data
        self._selectedday = selectedday
        self.startdaynumber = start
        self.days = days
        self.lastweeknumber = (days - (7 - start)) % 7
    }
    var body: some View {
        let starts = CalendarModel().DayofWeekCalc(year: year,month: month,day: 1)
        let today = NewCalendarBottomWeekNumber5View.longDateFormatter.string(from: dt)
        let selecttedDay = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",self.data)
        VStack(spacing: 0) {
            HStack(spacing: 0){
                ForEach(0..<self.column,id:\.self){ index in
                    let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+14)
                    Button(action: {
                        selectedday = 22-starts+index
                    }, label: {
                        ZStack(alignment: .top){
                            Rectangle()
                                .frame(width:width/7,height:96)
                                .foregroundColor(selectedday == 22-starts+index ? Color.gray.opacity(0.1) : Color.clear)
                                .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                        , width: today == selectedData ? 1 : 0.2)
                            
                            VStack(spacing: 2) {
                                if index == 0 {
                                    Text("\(22-starts+index)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.red)
                                        .padding(.top, 4)
                                } else if index == 6 {
                                    Text("\(22-starts+index)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.blue)
                                        .padding(.top, 4)
                                } else {
                                    Text("\(22-starts+index)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color("TextColor"))
                                        .padding(.top, 4)
                                }
                            }
                        }
                    })
                }
            }
            
            if self.lastweeknumber == 0 {
                HStack(spacing: 0){
                    ForEach(0..<7,id:\.self){ index in
                        Button(action: {
                            selectedday = 29-starts+index
                        }, label: {
                            ZStack(alignment: .top){
                                Rectangle()
                                    .frame(width:width/7,height:96)
                                    .foregroundColor(Color.clear)
                                    .border(Color("BackgroundColor"), width: 0.2)
                                
                                VStack(spacing: 2) {
                                    if index == 0 {
                                        Text("\(29-starts+index)")
                                            .font(.system(size: 12))
                                            .bold()
                                            .foregroundColor(Color.red)
                                            .padding(.top, 4)
                                    } else if index == 6 {
                                        Text("\(29-starts+index)")
                                            .font(.system(size: 12))
                                            .bold()
                                            .foregroundColor(Color.blue)
                                            .padding(.top, 4)
                                    } else {
                                        Text("\(29-starts+index)")
                                            .font(.system(size: 12))
                                            .bold()
                                            .foregroundColor(Color("TextColor"))
                                            .padding(.top, 4)
                                    }
                                }
                            }
                        })
                    }
                }
            } else {
                HStack(spacing: 0){
                    ForEach(0..<self.lastweeknumber,id:\.self){ index in
                        Button(action: {
                            selectedday = 29-starts+index
                        }, label: {
                            ZStack(alignment: .top){
                                Rectangle()
                                    .frame(width:width/7,height:96)
                                    .foregroundColor(selectedday == 29-starts+index ? Color.gray.opacity(0.1) : Color.clear)
                                    .border(Color("BackgroundColor")
                                            , width: 0.2)
                                
                                VStack(spacing: 2) {
                                    if index == 0 {
                                        Text("\(((7-self.startdaynumber)+1+index)+21)")
                                            .font(.system(size: 12))
                                            .bold()
                                            .foregroundColor(Color.red)
                                            .padding(.top, 4)
                                    } else if index == 6 {
                                        Text("\(((7-self.startdaynumber)+1+index)+21)")
                                            .font(.system(size: 12))
                                            .bold()
                                            .foregroundColor(Color.blue)
                                            .padding(.top, 4)
                                    } else {
                                        Text("\(((7-self.startdaynumber)+1+index)+21)")
                                            .font(.system(size: 12))
                                            .bold()
                                            .foregroundColor(Color("TextColor"))
                                            .padding(.top, 4)
                                    }
                                }
                            }
                        })
                    }
                    ForEach(0..<(7-self.lastweeknumber),id:\.self){ index in
                        Button(action: {
                            //                        self.data = index + 1
                            //                        if month == 12 {
                            //                            year = year + 1
                            //                            month = month - 11
                            //                        } else {
                            //                            self.month = month + 1
                            //                        }
                        }, label: {
                            ZStack(alignment: .top){
                                Rectangle()
                                    .frame(width:width/7,height:96)
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
                }
            }
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
