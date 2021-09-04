//
//  SelectedCalendarsList.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import EventKit
import SwiftUI

struct SelectedCalendarsList: View {
    let selectedCalendars: [EKCalendar]
    
    var joinedText: Text {
        var text = Text("")
        
        for calendar in selectedCalendars {
            text = text + calendar.formattedText + Text(" ")
        }
        return text
    }
    
    var body: some View {
        joinedText.foregroundColor(.secondary)
    }
}

