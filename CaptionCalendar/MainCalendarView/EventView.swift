//
//  EventView.swift
//  EventView
//
//  Created by 髙間洋平 on 2021/08/06.
//

import EventKit
import SwiftUI

struct EventView: View {
    let event: EKEvent
    let dt = Date()
    
    private static var dateFormatters: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
//        formatter.dateFormat = "MM/dd"
        return formatter
    }()
    
    private static func formatDate(forNonAllDayEvent event: EKEvent) -> String {
        return "\(EventView.dateFormatters.string(from: event.startDate)) - \(EventView.dateFormatters.string(from: event.endDate))"
    }
    
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .fill(event.color.opacity(0.4))
                .frame(width: event.isAllDay ? (UIScreen.main.bounds.width)/7:(UIScreen.main.bounds.width-28)/7,
                       height: 12,
                       alignment: .center)
                .cornerRadius(event.isAllDay ? 0 : 3)
                .padding(.leading, event.isAllDay ? 0 : 2)
            Text(event.title)
                .font(.system(size: 11))
                .bold()
                .frame(height: 8)
                .padding(.leading, 4)
                .foregroundColor(Color("TextColor"))
        }
    }
}
