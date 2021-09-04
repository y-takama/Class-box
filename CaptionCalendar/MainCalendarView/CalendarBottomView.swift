//
//  CalendarBottomView.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/08/09.
//

import SwiftUI
import EventKitUI

struct CalendarBottomView: View {
    @Binding var year : Int
    @Binding var month : Int
    @Binding var day : Int
    @Binding var data : Int
    var startdaynumber : Int
    var weeknumber : Int
    var days : Int
    var middleweek : Int
    var lastweeknumber : Int
    let column = 7
//    var selectedDay = 0.2
    let width = UIScreen.main.bounds.width
    let dt = Date()
    @ObservedObject var eventsRepository = EventsRepository.shared
    @State private var selectedEvent: EKEvent?
    @State private var showingSheet = false
    init(year: Binding<Int>, month: Binding<Int>, day: Binding<Int>, data: Binding<Int>, week: Int, start: Int, days: Int){
        self._year = year
        self._month = month
        self._day = day
        self._data = data
        self.weeknumber = week
        self.startdaynumber = start
        self.days = days
        self.middleweek = (days - (7 - start)) / 7
        self.lastweeknumber = (days - (7 - start)) % 7
//        self.selectedDay = 0.2
    }
    
    var body: some View {
        // 1週
        let today = CalendarBottomView.longDateFormatter.string(from: dt)
//        let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",self.data)
        VStack(spacing: 0) {
            // 4,5,6週
            if self.weeknumber == 4 {
                HStack(spacing: 0){
                    if self.lastweeknumber != 0{
                        ForEach(0..<self.lastweeknumber,id:\.self){ index in
                            Button(action: {
                                self.data = ((7-self.startdaynumber)+1+index)+14
                            }, label: {
                                ZStack(alignment: .top){
//                                    let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+14)
                                    let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+14)
                                    Rectangle()
                                        .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
        //                                .frame(width:width/7,height:80)
                                        .foregroundColor(today == selectedData ? Color.red.opacity(0.1) : Color.clear)
                                        .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                                , width: today == selectedData ? 1 : 0.2)
                                    
                                    VStack(spacing: 2) {
                                        if index == 0 {
                                            Text("\(((7-self.startdaynumber)+1+index)+14)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.red)
                                                .padding(.top, 4)
                                        } else if index == 6 {
                                            Text("\(((7-self.startdaynumber)+1+index)+14)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.blue)
                                                .padding(.top, 4)
                                        } else {
                                            Text("\(((7-self.startdaynumber)+1+index)+14)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color("TextColor"))
                                                .padding(.top, 4)
                                        }
                                        
                                        ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) == selectedData {
                                                EventView(event: event)
                                            }
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarBottomView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                                EventLongView(event: event)
                                            }
                                        }
                                    }
                                }
                            })
                        }
                    } else {
                        ForEach(0..<7,id:\.self){ index in
                            Button(action: {
                                self.data = ((7-self.startdaynumber)+1+index)+14
                            }, label: {
                                ZStack(alignment: .top){
//                                    let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+14)
                                    let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+14)
                                    Rectangle()
                                        .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
        //                                .frame(width:width/7,height:80)
                                        .foregroundColor(today == selectedData ? Color.red.opacity(0.1) : Color.clear)
                                        .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                                , width: today == selectedData ? 1 : 0.2)
                                    
                                    VStack(spacing: 2) {
                                        if index == 0 {
                                            Text("\(((7-self.startdaynumber)+1+index)+14)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.red)
                                                .padding(.top, 4)
                                        } else if index == 6 {
                                            Text("\(((7-self.startdaynumber)+1+index)+14)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.blue)
                                                .padding(.top, 4)
                                        } else {
                                            Text("\(((7-self.startdaynumber)+1+index)+14)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color("TextColor"))
                                                .padding(.top, 4)
                                        }
                                        
                                        ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) == selectedData {
                                                EventView(event: event)
                                            }
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarBottomView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                                EventLongView(event: event)
                                            }
                                        }
                                    }
                                }
                            })
                        }
                    }
                }
            } else if self.weeknumber == 5 {
                HStack(spacing: 0){
                    ForEach(0..<self.column,id:\.self){ index in
                        Button(action: {
                            self.data = ((7-self.startdaynumber)+1+index)+14
                        }, label: {
                            ZStack(alignment: .top){
//                                let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+14)
                                let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+14)
                                Rectangle()
                                    .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
    //                                .frame(width:width/7,height:80)
//                                    .foregroundColor(today == selectedData ? Color.red.opacity(0.1) : Color.clear)
//                                    .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
//                                            , width: today == selectedData ? 1 : 0.2)
                                
                                VStack(spacing: 2) {
                                    if index == 0 {
                                        Text("\(((7-self.startdaynumber)+1+index)+14)")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color.red)
                                            .padding(.top, 4)
                                    } else if index == 6 {
                                        Text("\(((7-self.startdaynumber)+1+index)+14)")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color.blue)
                                            .padding(.top, 4)
                                    } else {
                                        Text("\(((7-self.startdaynumber)+1+index)+14)")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color("TextColor"))
                                            .padding(.top, 4)
                                    }
                                    
                                    ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                        if CalendarBottomView.longDateFormatter.string(from: event.startDate) == selectedData {
                                            EventView(event: event)
                                        }
                                        if CalendarBottomView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarBottomView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                            EventLongView(event: event)
                                        }
                                    }
                                }
                            }
                        })
                    }
                }
                HStack(spacing: 0){
                    if self.lastweeknumber != 0{
                        ForEach(0..<self.lastweeknumber,id:\.self){ index in
                            
                            Button(action: {
                                self.data = ((7-self.startdaynumber)+1+index)+21
                                
                                
                            }, label: {
                                ZStack(alignment: .top){
//                                    let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+21)
                                    let selectedData = String(format: "%04d",self.year+1)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+21)
                                    Rectangle()
                                        .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
        //                                .frame(width:width/7,height:80)
//                                        .foregroundColor(today == selectedData ? Color.red.opacity(0.1) : Color.clear)
//                                        .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
//                                                , width: today == selectedData ? 1 : 0.2)
                                    
                                    VStack(spacing: 2) {
                                        if index == 0 {
                                            Text("\(((7-self.startdaynumber)+1+index)+21)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.red)
                                                .padding(.top, 4)
                                        } else if index == 6 {
                                            Text("\(((7-self.startdaynumber)+1+index)+21)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.blue)
                                                .padding(.top, 4)
                                        } else {
                                            Text("\(((7-self.startdaynumber)+1+index)+21)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color("TextColor"))
                                                .padding(.top, 4)
                                        }
                                        
                                        ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) == selectedData {
                                                EventView(event: event)
                                            }
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarBottomView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                                EventLongView(event: event)
                                            }
                                        }
                                    }
                                }
                            })
                        }
                        ForEach(0..<(7-self.lastweeknumber),id:\.self){ index in
                            Button(action: {
                                self.data = index + 1
                                if month == 12 {
                                    self.year = year + 1
                                    self.month = month - 11
                                } else {
                                    self.month = month + 1
                                }
                            }, label: {
                                ZStack(alignment: .top){
                                    let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month+1)+String(format: "%02d",index + 1)
//                                    let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",index + 1)
                                    Rectangle()
                                        .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
        //                                .frame(width:width/7,height:80)
//                                        .foregroundColor(today == selectedData ? Color.red.opacity(0.1) : Color.clear)
//                                        .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
//                                                , width: today == selectedData ? 1 : 0.2)
                                    
                                    VStack(spacing: 2) {
                                        Text("\(index + 1)")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color("BackgroundColor"))
                                            .padding(.top, 4)
//                                        let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month+1)+String(format: "%02d",index + 1)
                                        ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) == selectedData {
                                                EventView(event: event)
                                            }
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarBottomView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                                EventLongView(event: event)
                                            }
                                        }
                                    }
                                }
                            })
                        }
                    } else {
                        ForEach(0..<7,id:\.self){ index in
                            Button(action: {
                                self.data = ((7-self.startdaynumber)+1+index)+21
                            }, label: {
                                ZStack(alignment: .top){
//                                    let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+21)
                                    let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+21)
                                    Rectangle()
                                        .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
        //                                .frame(width:width/7,height:80)
//                                        .foregroundColor(today == selectedData ? Color.red.opacity(0.1) : Color.clear)
//                                        .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
//                                                , width: today == selectedData ? 1 : 0.2)
                                    
                                    VStack(spacing: 2) {
                                        if index == 0 {
                                            Text("\(((7-self.startdaynumber)+1+index)+21)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.red)
                                                .padding(.top, 4)
                                        } else if index == 6 {
                                            Text("\(((7-self.startdaynumber)+1+index)+21)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.blue)
                                                .padding(.top, 4)
                                        } else {
                                            Text("\(((7-self.startdaynumber)+1+index)+21)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color("TextColor"))
                                                .padding(.top, 4)
                                        }
//                                        let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+21)
                                        ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) == selectedData {
                                                EventView(event: event)
                                            }
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarBottomView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                                EventLongView(event: event)
                                            }
                                        }
                                    }
                                }
                            })
                        }
                    }
                }
            }else if self.weeknumber == 6{
                HStack(spacing: 0){
                    ForEach(0..<self.column,id:\.self){ index in
                        Button(action: {
                            self.data = ((7-self.startdaynumber)+1+index)+14
                        }, label: {
                            ZStack(alignment: .top){
//                                let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+14)
                                let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+14)
                                Rectangle()
                                    .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
    //                                .frame(width:width/7,height:80)
//                                    .foregroundColor(today == selectedData ? Color.red.opacity(0.1) : Color.clear)
//                                    .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
//                                            , width: today == selectedData ? 1 : 0.2)
                                
                                VStack(spacing: 2) {
                                    if index == 0 {
                                        Text("\(((7-self.startdaynumber)+1+index)+14)")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color.red)
                                            .padding(.top, 4)
                                    } else if index == 6 {
                                        Text("\(((7-self.startdaynumber)+1+index)+14)")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color.blue)
                                            .padding(.top, 4)
                                    } else {
                                        Text("\(((7-self.startdaynumber)+1+index)+14)")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color("TextColor"))
                                            .padding(.top, 4)
                                    }
                                    
                                    ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                        if CalendarBottomView.longDateFormatter.string(from: event.startDate) == selectedData {
                                            EventView(event: event)
                                        }
                                        if CalendarBottomView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarBottomView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                            EventLongView(event: event)
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
                            self.data = ((7-self.startdaynumber)+1+index)+21
                        }, label: {
                            ZStack(alignment: .top){
//                                let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+21)
                                let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+21)
                                Rectangle()
                                    .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
    //                                .frame(width:width/7,height:80)
//                                    .foregroundColor(today == selectedData ? Color.red.opacity(0.1) : Color.clear)
//                                    .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
//                                            , width: today == selectedData ? 1 : 0.2)
                                
                                VStack(spacing: 2) {
                                    if index == 0 {
                                        Text("\(((7-self.startdaynumber)+1+index)+21)")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color.red)
                                            .padding(.top, 4)
                                    } else if index == 6 {
                                        Text("\(((7-self.startdaynumber)+1+index)+21)")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color.blue)
                                            .padding(.top, 4)
                                    } else {
                                        Text("\(((7-self.startdaynumber)+1+index)+21)")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color("TextColor"))
                                            .padding(.top, 4)
                                    }
                                    
                                    ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                        if CalendarBottomView.longDateFormatter.string(from: event.startDate) == selectedData {
                                            EventView(event: event)
                                        }
                                        if CalendarBottomView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarBottomView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                            EventLongView(event: event)
                                        }
                                    }
                                }
                            }
                        })
                    }
                }
                HStack(spacing: 0){
                    if self.lastweeknumber != 0{
                        ForEach(0..<self.lastweeknumber,id:\.self){ index in
                            Button(action: {
                                self.data = ((7-self.startdaynumber)+1+index)+28
                            }, label: {
                                ZStack(alignment: .top){
//                                    let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+28)
                                    let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+28)
                                    Rectangle()
                                        .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
        //                                .frame(width:width/7,height:80)
//                                        .foregroundColor(today == selectedData ? Color.red.opacity(0.1) : Color.clear)
//                                        .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
//                                                , width: today == selectedData ? 1 : 0.2)
                                    
                                    VStack(spacing: 2) {
                                        if index == 0 {
                                            Text("\(((7-self.startdaynumber)+1+index)+28)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.red)
                                                .padding(.top, 4)
                                        } else if index == 6 {
                                            Text("\(((7-self.startdaynumber)+1+index)+28)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.blue)
                                                .padding(.top, 4)
                                        } else {
                                            Text("\(((7-self.startdaynumber)+1+index)+28)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color("TextColor"))
                                                .padding(.top, 4)
                                        }
                                        
                                        ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) == selectedData {
                                                EventView(event: event)
                                            }
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarBottomView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                                EventLongView(event: event)
                                            }
                                        }
                                    }
                                }
                            })
                        }
                        if self.lastweeknumber != 0{
                            ForEach(0..<(7-self.lastweeknumber),id:\.self){ index in
                                Button(action: {
                                    self.data = index + 1
                                    self.month = month + 1
                                }, label: {
                                    ZStack(alignment: .top){
//                                        let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",index + 1)
                                        let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month+1)+String(format: "%02d",index + 1)
                                        Rectangle()
                                            .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
            //                                .frame(width:width/7,height:80)
//                                            .foregroundColor(today == selectedData ? Color.red.opacity(0.1) : Color.clear)
//                                            .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
//                                                    , width: today == selectedData ? 1 : 0.2)
                                        
                                        VStack(spacing: 2) {
                                            Text("\(index + 1)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color("BackgroundColor"))
                                                .padding(.top, 4)
                                            
                                            ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                                if CalendarBottomView.longDateFormatter.string(from: event.startDate) == selectedData {
                                                    EventView(event: event)
                                                }
                                                if CalendarBottomView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarBottomView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                                    EventLongView(event: event)
                                                }
                                            }
                                        }
                                    }
                                })
                            }
                        }
                    } else {
                        ForEach(0..<self.lastweeknumber,id:\.self){ index in
                            Button(action: {
                                self.data = ((7-self.startdaynumber)+1+index)+28
                            }, label: {
                                ZStack{
//                                    let todaySelect = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+28)
                                    let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+28)
                                    Rectangle()
                                        .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
        //                                .frame(width:width/7,height:80)
//                                        .foregroundColor(today == selectedData ? Color.red.opacity(0.1) : Color.clear)
//                                        .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
//                                                , width: today == selectedData ? 1 : 0.2)
                                    
                                    VStack(spacing: 2) {
                                        if index == 0 {
                                            Text("\(((7-self.startdaynumber)+1+index)+28)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.red)
                                                .padding(.top, 4)
                                        } else if index == 6 {
                                            Text("\(((7-self.startdaynumber)+1+index)+28)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.blue)
                                                .padding(.top, 4)
                                        } else {
                                            Text("\(((7-self.startdaynumber)+1+index)+28)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color("TextColor"))
                                                .padding(.top, 4)
                                        }
                                        
                                        ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) == selectedData {
                                                EventView(event: event)
                                            }
                                            if CalendarBottomView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarBottomView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                                EventLongView(event: event)
                                            }
                                        }
                                    }
                                }
                            })
                        }
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
