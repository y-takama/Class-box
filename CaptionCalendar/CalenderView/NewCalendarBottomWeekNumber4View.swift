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
    var days : Int
    let column = 7
    let width = UIScreen.main.bounds.width
    let dt = Date()
    
    var body: some View {
//        let starts = CalendarModel().DayofWeekCalc(year: year,
//                                                   month: month,
//                                                   day: 1)
        let today = NewCalendarBottomWeekNumber4View.longDateFormatter.string(from: dt)
        let lastweeknumber = (days - (7 - startdaynumber)) % 7
        HStack(spacing: 0){
            if lastweeknumber != 0 {
                ForEach(0..<lastweeknumber,id:\.self){ index in
                    Button(action: {
                        data = 22-startdaynumber+index
                    }, label: {
                        ZStack(alignment: .top) {
                            Rectangle()
                                .frame(width:width/7,height:120)
                                .foregroundColor(Color.clear)
                                .border(Color("BackgroundColor"), width: 0.2)
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
                            }
                        }
                    })
                }
            } else {
                ForEach(0..<7,id:\.self){ index in
                    Button(action: {
                        data = 22-startdaynumber+index
                    }, label: {
                        ZStack(alignment: .top){
                            let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",22-startdaynumber+index)
                            Rectangle()
                                .frame(width:width/7,height:120)
                                .foregroundColor(Color.clear)
                                .border(Color("BackgroundColor"), width: 0.2)
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
