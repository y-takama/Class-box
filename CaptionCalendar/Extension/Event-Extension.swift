//
//  Event-Extension.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import EventKit
import SwiftUI

extension EKEvent {
    // This did not work properly and caused wrong event to be used in ForEach
//    public var id: String {
//        return eventIdentifier
//    }
    
    var color: Color {
        return Color(UIColor(cgColor: self.calendar.cgColor))
    }
}
