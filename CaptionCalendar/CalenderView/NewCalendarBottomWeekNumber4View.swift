//
//  NewCalendarBottomView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/03.
//

import SwiftUI

struct NewCalendarBottomWeekNumber4View: View {
    var year : Int
    var month : Int
    @Binding var data : Int
    var startdaynumber : Int
    var lastweeknumber : Int
    let width = UIScreen.main.bounds.width
    let dt = Date()
//    @ObservedObject var eventsRepository = EventsRepository.shared
    @State private var showingSheet = false
    init(year: Int, month: Int, data: Binding<Int>, start: Int, days: Int){
        self.year = year
        self.month = month
        self._data = data
        self.startdaynumber = start
        self.lastweeknumber = (days - (7 - start)) % 7
    }
    var body: some View {
        let starts = CalendarModel().DayofWeekCalc(year: year,
                                                   month: month,
                                                   day: 1)
        let today = NewCalendarBottomWeekNumber4View.longDateFormatter.string(from: dt)
//        let selecttedDay = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",self.data)
        HStack(spacing: 0){
            if self.lastweeknumber != 0 {
                ForEach(0..<self.lastweeknumber,id:\.self){ index in
                    Button(action: {
                        data = 22-starts+index
                    }, label: {
                        ZStack(alignment: .top) {
                            Rectangle()
                                .frame(width:width/7,height:120)
//                                .foregroundColor(data == 22-starts+index ? Color.gray.opacity(0.1) : Color.clear)
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
            } else {
                ForEach(0..<7,id:\.self){ index in
                    Button(action: {
                        data = 22-starts+index
                    }, label: {
                        ZStack(alignment: .top){
                            let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",22-starts+index)
                            Rectangle()
                                .frame(width:width/7,height:120)
//                                .foregroundColor(data == 22-starts+index ? Color.gray.opacity(0.1) : Color.clear)
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
