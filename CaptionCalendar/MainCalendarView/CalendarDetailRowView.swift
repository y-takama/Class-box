//
//  CalendarDetailRowView.swift
//  CalendarDetailRowView
//
//  Created by 髙間洋平 on 2021/08/10.
//

import EventKit
import SwiftUI

struct CalendarDetailRowView: View {
    let event: EKEvent
    let dt = Date()
    
    private static var relativeDateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        return formatter
    }()
    
    private static var dateFormatterDetail: DateFormatter = {
        let formatter = DateFormatter()
//        formatter.timeStyle = .short
        formatter.dateFormat = "MM/dd/HH/mm"
        return formatter
    }()
    
    private static var dateFormatters: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
//        formatter.dateFormat = "MM/dd"
        return formatter
    }()
    
    private static func formatDate(forNonAllDayEvent event: EKEvent) -> String {
        return "\(CalendarDetailRowView.dateFormatters.string(from: event.startDate)) - \(CalendarDetailRowView.dateFormatters.string(from: event.endDate))"
    }
    
    var body: some View {
                let startDate : Date = CalendarDetailRowView.dateFormatterDetail.date(from: CalendarDetailRowView.dateFormatterDetail.string(from: event.startDate))!
                let endDate : Date = CalendarDetailRowView.dateFormatterDetail.date(from: CalendarDetailRowView.dateFormatterDetail.string(from: event.endDate))!
                let dayInterval:Int = (Calendar.current.dateComponents([.hour], from: startDate, to: endDate)).hour!
        
        HStack {
            VStack(spacing: 0) {
                if event.isAllDay {
                    ZStack {
                        Rectangle()
                            .fill(event.color)
                            .frame(width: 6, height: 30)
                            .cornerRadius(3)
                        Rectangle()
                            .fill(Color("TintColor"))
                            .frame(width: 40, height: 12, alignment: .center)
                        Text("終日").modifier(SecondaryCaptionTextStyle())
                    }
                } else {
                    Text("\(CalendarDetailRowView.dateFormatters.string(from: event.startDate))")
                        .modifier(SecondaryCaptionTextStyle())
                    Rectangle()
                        .fill(event.color)
                        .frame(width: 6, height: CGFloat(14*dayInterval))
                        .cornerRadius(3)
                        .padding(.vertical, 2)
                    Text("\(CalendarDetailRowView.dateFormatters.string(from: event.endDate))")
                        .modifier(SecondaryCaptionTextStyle())
                }
            }.frame(width: 40, alignment: .center)
            
            VStack {
                HStack {
                    Text(event.title)
                        .font(.headline)
                    Spacer()
                    
                    if event.url != nil {
                        HStack {
                            Button(action: {
                                UIApplication.shared.open(event.url!)
                            }, label: {
                                Image(systemName: "globe")
                                    .font(.headline)
                                    .padding(.trailing, 20)
                            })
                        }
                    }
                }
                HStack {
                    if event.notes != nil {
                        Text(event.notes!).modifier(SecondaryCaptionTextStyle())
                    }
                    Spacer()
                }.padding(.leading, 40)
                
            }
        }.padding(.bottom, 5)
    }
}
