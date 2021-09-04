//
//  ChartView.swift
//  ChartView
//
//  Created by 髙間洋平 on 2021/08/08.
//

import EventKit
import SwiftUI

struct ChartView: View {
    let event: EKEvent
    let dt = Date()
//    @B var total: Int = 0
//    let selectedCalendars: [EKCalendar]
    
    
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
        return "\(ChartView.dateFormatters.string(from: event.startDate)) - \(ChartView.dateFormatters.string(from: event.endDate))"
    }
    
    var body: some View {
                let startDate : Date = ChartView.dateFormatterDetail.date(from: ChartView.dateFormatterDetail.string(from: event.startDate))!
                let endDate : Date = ChartView.dateFormatterDetail.date(from: ChartView.dateFormatterDetail.string(from: event.endDate))!
                let dayInterval:Int = (Calendar.current.dateComponents([.minute], from: startDate, to: endDate)).minute!
        HStack {
            HStack {
                Text(String(dayInterval))
                Text(event.calendar.title)
            }
        }
    }
//    func TotalTime(_ dayInterval: Int) -> Int {
//        total = total + dayInterval
//        
//        return total
//    }
    
}
