//
//  CalendarView.swift
//  CalendarView
//
//  Created by 髙間洋平 on 2021/08/05.
//

import SwiftUI
import EventKitUI

struct CalendarView: View {
    var year : Int
    var month : Int
    @Binding var data : Int
    var startdaynumber : Int
    var weeknumber : Int
    var days : Int
    var lastweeknumber : Int
    let column = 7
    let width = UIScreen.main.bounds.width
    let dt = Date()
    @ObservedObject var eventsRepository = EventsRepository.shared
    @State private var activeSheet: ActiveSheet = .calendarChooser
    @State private var selectedEvent: EKEvent?
    var showingSheet = false
    @State private var showingEditSheet = false
    init(year: Int, month: Int, data: Binding<Int>, week: Int, start: Int, days: Int){
        self.year = year
        self.month = month
        self._data = data
        self.weeknumber = week
        self.startdaynumber = start
        self.days = days
        self.lastweeknumber = (days - (7 - start)) % 7
    }
    
    var body: some View {
        // 1週
        let today = CalendarView.longDateFormatter.string(from: dt)
        let selecttedDay = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",self.data)
        VStack(spacing: 0) {
            VStack(spacing: 0) {
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
                                ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                    if CalendarView.longDateFormatter.string(from: event.startDate) == selectedData {
                                        EventView(event: event)
                                    }
                                    if CalendarView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                        EventLongView(event: event)
                                    }
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
                                ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                    if CalendarView.longDateFormatter.string(from: event.startDate) == selectedData {
                                        EventView(event: event)
                                    }
                                    if CalendarView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                        EventLongView(event: event)
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
                                ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                    if CalendarView.longDateFormatter.string(from: event.startDate) == selectedData {
                                        EventView(event: event)
                                    }
                                    if CalendarView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarView.longDateFormatter.string(from: event.endDate) >= selectedData {
                                        EventLongView(event: event)
                                    }
                                }
                            }
//                            .onTapGesture(count: 2){
////                                showImage = true
//                                self.data = ((7-self.startdaynumber)+1+index)+7
//                                self.showDetailDayView.toggle()
//                            }
                        }
                    })
                }
            }
            
            // 4,5,6週
            if self.weeknumber == 4{
                weeknumber4View(year: year, month: month, data: $data, start: startdaynumber, days: days).frame(height: 120)
            } else if self.weeknumber == 5{
                weeknumber5View(year: year, month: month, data: $data, start: startdaynumber, days: days).frame(height: 192)
            }else if self.weeknumber == 6{
                weeknumber6View(year: year, month: month, data: $data, start: startdaynumber, days: days).frame(height: 240)
            }
            }.frame(height: 480)
            
            HStack {
                Text(String(self.month)+"月"+String(self.data)+"日")
                    .font(.headline)
                Spacer()
            }
            .padding(.horizontal, 15)
            .padding(.top)
            
            VStack(spacing: 4) {
                ForEach(eventsRepository.events ?? [], id: \.self) { event in
                    let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",self.data)
                    if CalendarView.longDateFormatter.string(from: event.startDate) == selectedData || (CalendarView.longDateFormatter.string(from: event.startDate) < selectedData && CalendarView.longDateFormatter.string(from: event.endDate) >= selectedData) {
                        
                        CalendarRowView(event: event)
                            .padding(.horizontal, 10)
                            .onTapGesture {
    //                                    showingEditSheet = true
                                
                                self.showEditFor(event)
                            }
                            .sheet(isPresented: $showingEditSheet) {
                                EventEditView(eventStore: self.eventsRepository.eventStore, event: self.selectedEvent)
                                    .ignoresSafeArea()
                            }
                    }
                }
                Spacer()
            }.padding(.top)
            .frame(height: 160)

        }.navigationTitle("\(self.month)月 \(String(self.year))")
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
    
    func showEditFor(_ event: EKEvent) {
        self.activeSheet = .calendarEdit
        selectedEvent = event
        showingEditSheet = true
    }
    enum ActiveSheet {
        case calendarChooser
        case calendarEdit
    }
    
//    private static var dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        //        formatter.timeStyle = .short
//        formatter.dateFormat = "YYYYMMdd"
//        return formatter
//    }()
}
