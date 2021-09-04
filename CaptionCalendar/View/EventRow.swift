//
//  EventRow.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import EventKit
import SwiftUI

struct EventRow: View {
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
    
    private static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
//        formatter.timeStyle = .short
        formatter.dateFormat = "MM/dd"
        return formatter
    }()
    
    private static var dateFormatters: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
//        formatter.dateFormat = "MM/dd"
        return formatter
    }()
    
    private static func formatDate(forNonAllDayEvent event: EKEvent) -> String {
        return "\(EventRow.dateFormatters.string(from: event.startDate)) - \(EventRow.dateFormatters.string(from: event.endDate))"
    }
    
    var body: some View {
        HStack {
            Circle()
                .fill(event.color)
                .frame(width: 10, height: 10, alignment: .center)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(EventRow.dateFormatter.string(from: event.startDate))
                        .modifier(SecondaryCaptionTextStyle())
                    
                    Text(EventRow.dateFormatterDetail.string(from: dt) > EventRow.dateFormatterDetail.string(from: event.startDate) ? "" : EventRow.relativeDateFormatter.localizedString(for: event.startDate, relativeTo: Date()).uppercased())
                        .modifier(SecondaryCaptionTextStyle())
                }
                .padding(.bottom, 2)
                Text(event.title)
                    .font(.headline)
            }
            
            Spacer()
            
            VStack {
                Spacer()
                Text(event.isAllDay ? "終日" : EventRow.formatDate(forNonAllDayEvent: event))
                    .modifier(SecondaryCaptionTextStyle())
            }
        }
//        .padding(.vertical, 5)
    }
}
