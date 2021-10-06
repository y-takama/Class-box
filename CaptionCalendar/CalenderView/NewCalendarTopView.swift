//
//  NewCalendarTopView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/03.
//

import SwiftUI

struct NewCalendarTopView: View {
    var year : Int
    var month : Int
    @Binding var data : Int
    var startdaynumber : Int
    var lastweeknumber : Int
    let column = 7
    let width = UIScreen.main.bounds.width
    let dt = Date()
    @ObservedObject var eventsRepository = EventsRepository.shared
    @State private var showingSheet = false
    init(year: Int, month: Int, data: Binding<Int>, start: Int, days: Int){
        self.year = year
        self.month = month
        self._data = data
        self.startdaynumber = start
        self.lastweeknumber = (days - (7 - start)) % 7
    }
    var body: some View {
        HStack(spacing: 0) {
            if self.startdaynumber != 0{
                ForEach(0..<self.startdaynumber,id:\.self){ index in
                    Button(action: {
                        
                    }, label: {
                        ZStack(alignment: .top){
                            Rectangle()
                                .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
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
                    self.data = index + 1
                }, label: {
                    ZStack(alignment: .top){
                        let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",index+1)
                        Rectangle()
                            .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
                            .foregroundColor(selecttedDay == selectedData ? Color.gray.opacity(0.1) : Color.clear)
                            .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                    , width: today == selectedData ? 1 : 0.2)
                        VStack(spacing: 2) {
                            if index + startdaynumber == 0 {
                                Text("\(index+1)")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(Color.red)
                                    .padding(.top, 4)
                            } else if index + startdaynumber == 6 {
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
                        }
                        
                    }
                })
            }
        }
        // 2週
        HStack(spacing: 0){
            ForEach(0..<self.column,id:\.self){ index in
                Button(action: {
                    self.data = (self.column-self.startdaynumber)+1+index
                }, label: {
                    ZStack(alignment: .top){
                        let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",(self.column-self.startdaynumber)+1+index)
                        Rectangle()
                            .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
                        //                                .frame(width:width/7,height:80)
                            .foregroundColor(selecttedDay == selectedData ? Color.gray.opacity(0.1) : Color.clear)
                            .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                    , width: today == selectedData ? 1 : 0.2)
                        
                        VStack(spacing: 2) {
                            if index == 0 {
                                Text("\((self.column-self.startdaynumber)+1+index)")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(Color.red)
                                    .padding(.top, 4)
                                
                            } else if index == 6 {
                                Text("\((self.column-self.startdaynumber)+1+index)")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(Color.blue)
                                    .padding(.top, 4)
                            } else {
                                Text("\((self.column-self.startdaynumber)+1+index)")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(Color("TextColor"))
                                    .padding(.top, 4)
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
        
        // 3週
        HStack(spacing: 0){
            ForEach(0..<self.column,id:\.self){ index in
                Button(action: {
                    self.data = ((7-self.startdaynumber)+1+index)+7
                }, label: {
                    ZStack(alignment: .top){
                        let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+7)
                        Rectangle()
                            .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
                            .foregroundColor(selecttedDay == selectedData ? Color.gray.opacity(0.1) : Color.clear)
                            .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                    , width: today == selectedData ? 1 : 0.2)
                        
                        VStack(spacing: 2) {
                            if index == 0 {
                                Text("\(((7-self.startdaynumber)+1+index)+7)")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(Color.red)
                                    .padding(.top, 4)
                            } else if index == 6 {
                                Text("\(((7-self.startdaynumber)+1+index)+7)")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(Color.blue)
                                    .padding(.top, 4)
                            } else {
                                Text("\(((7-self.startdaynumber)+1+index)+7)")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(Color("TextColor"))
                                    .padding(.top, 4)
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
