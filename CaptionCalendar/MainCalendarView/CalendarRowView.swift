//
//  CalendarRowView.swift
//  CalendarRowView
//
//  Created by 髙間洋平 on 2021/08/05.
//

import EventKit
import SwiftUI

struct CalendarRowView: View {
    let event: EKEvent
    let dt = Date()
    
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
        return "\(CalendarRowView.dateFormatters.string(from: event.startDate)) - \(CalendarRowView.dateFormatters.string(from: event.endDate))"
    }
    
    var body: some View {
                let startDate : Date = CalendarRowView.dateFormatterDetail.date(from: CalendarRowView.dateFormatterDetail.string(from: event.startDate))!
                let endDate : Date = CalendarRowView.dateFormatterDetail.date(from: CalendarRowView.dateFormatterDetail.string(from: event.endDate))!
                let dayInterval:Int = (Calendar.current.dateComponents([.hour], from: startDate, to: endDate)).hour!
        
        HStack {
            VStack(spacing: 0) {
//                Text(event.calendar.title)
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
                    Text("\(CalendarRowView.dateFormatters.string(from: event.startDate))")
                        .modifier(SecondaryCaptionTextStyle())
                    Rectangle()
                        .fill(event.color)
                        .frame(width: 6, height: CGFloat(4*dayInterval))
                        .cornerRadius(3)
                        .padding(.vertical, 2)
                    Text("\(CalendarRowView.dateFormatters.string(from: event.endDate))")
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
        }
        Divider()
            .padding(.leading, 40)
    }
}
