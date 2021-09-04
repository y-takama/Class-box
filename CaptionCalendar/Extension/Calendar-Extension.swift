//
//  Calendar-Extension.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import SwiftUI
import EventKit

extension EKCalendar: Identifiable {
    public var id: String {
        return self.calendarIdentifier
    }
    
    public var color: Color {
        return Color(UIColor(cgColor: self.cgColor))
    }
    
    public var formattedText: Text {
        return Text("•\u{00a0}")
            .font(.headline)
            .foregroundColor(self.color)
        + Text("\(self.title)")
    }
}
