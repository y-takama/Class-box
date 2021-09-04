//
//  weeknumber4View.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/08/09.
//

import SwiftUI

struct weeknumber4View: View {
    var year : Int
    var month : Int
    @Binding var data : Int
    var startdaynumber : Int
    var lastweeknumber : Int
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
        let today = weeknumber4View.longDateFormatter.string(from: dt)
        let selecttedDay = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",self.data)
        HStack(spacing: 0){
            if self.lastweeknumber != 0{
                ForEach(0..<self.lastweeknumber,id:\.self){ index in
                    Button(action: {
                        self.data = ((7-self.startdaynumber)+1+index)+14
                    }, label: {
                        ZStack(alignment: .top) {
                            let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+14)
                            
                            Rectangle()
//                                .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
                                .frame(width:width/7,height:120)
//                                .foregroundColor(selecttedDay == selectedData ? Color.gray.opacity(0.1) : Color.clear)
//                                .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
//                                        , width: today == selectedData ? 1 : 0.2)
                            
                            VStack(spacing: 2) {
                                if index == 0 {
                                    Text("\(((7-self.startdaynumber)+1+index)+14)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.red)
                                        .padding(.top, 4)
                                } else if index == 6 {
                                    Text("\(((7-self.startdaynumber)+1+index)+14)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.blue)
                                        .padding(.top, 4)
                                } else {
                                    Text("\(((7-self.startdaynumber)+1+index)+14)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color("TextColor"))
                                        .padding(.top, 4)
                                }
                                
                                ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                    if weeknumber4View.longDateFormatter.string(from: event.startDate) == selectedData {
                                        EventView(event: event)
                                    }
                                    if weeknumber4View.longDateFormatter.string(from: event.startDate) < selectedData && weeknumber4View.longDateFormatter.string(from: event.endDate) >= selectedData {
                                        EventLongView(event: event)
                                    }
                                }
                            }
//                            .onTapGesture(count: 2){
////                                showImage = true
//                                self.data = ((7-self.startdaynumber)+1+index)+14
//                                self.showDetailDayView.toggle()
//                            }
                        }
                    })
                }
            } else {
                ForEach(0..<7,id:\.self){ index in
                    Button(action: {
                        self.data = ((7-self.startdaynumber)+1+index)+14
                    }, label: {
                        ZStack(alignment: .top){
                            let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",((7-self.startdaynumber)+1+index)+14)
                            Rectangle()
//                                .frame(idealWidth: width/7, minHeight: 80, idealHeight: 80, maxHeight: 200)
                                .frame(width:width/7,height:120)
                                .foregroundColor(selecttedDay == selectedData ? Color.gray.opacity(0.1) : Color.clear)
                                .border(today == selectedData ? Color.red.opacity(0.5) : Color("BackgroundColor")
                                        , width: today == selectedData ? 1 : 0.2)
                            
                            VStack(spacing: 2) {
                                if index == 0 {
                                    Text("\(((7-self.startdaynumber)+1+index)+14)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.red)
                                        .padding(.top, 4)
                                } else if index == 6 {
                                    Text("\(((7-self.startdaynumber)+1+index)+14)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.blue)
                                        .padding(.top, 4)
                                } else {
                                    Text("\(((7-self.startdaynumber)+1+index)+14)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color("TextColor"))
                                        .padding(.top, 4)
                                }
                                
                                ForEach(eventsRepository.events ?? [], id: \.self) { event in
                                    if weeknumber4View.longDateFormatter.string(from: event.startDate) == selectedData {
                                        EventView(event: event)
                                    }
                                    if weeknumber4View.longDateFormatter.string(from: event.startDate) < selectedData && weeknumber4View.longDateFormatter.string(from: event.endDate) >= selectedData {
                                        EventLongView(event: event)
                                    }
                                }
                            }
//                            .onTapGesture(count: 2){
////                                showImage = true
//                                self.data = ((7-self.startdaynumber)+1+index)+14
//                                self.showDetailDayView.toggle()
//                            }
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


