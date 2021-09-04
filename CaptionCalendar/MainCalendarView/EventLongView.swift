//
//  EvenLongView.swift
//  EvenLongView
//
//  Created by 髙間洋平 on 2021/08/07.
//

import EventKit
import SwiftUI

struct EventLongView: View {
    let event: EKEvent
    let dt = Date()
    
    private static var dateFormatters: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
//        formatter.dateFormat = "MM/dd"
        return formatter
    }()
    
    private static func formatDate(forNonAllDayEvent event: EKEvent) -> String {
        return "\(EventLongView.dateFormatters.string(from: event.startDate)) - \(EventLongView.dateFormatters.string(from: event.endDate))"
    }
    
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .fill(event.color.opacity(0.4))
                .frame(width: (UIScreen.main.bounds.width)/7,
                       height: 12,
                       alignment: .center)
        }
    }
}
