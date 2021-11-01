//
//  MainTabViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/12.
//

import SwiftUI
import Firebase

class MainTabViewModel: ObservableObject {
    
    func tabTitle(forIndex index: Int) -> String {
        switch index {
        case 0: return "Calendar"
        case 1: return "CalendarList"
        case 2: return "Timetable"
        case 3: return "Chat"
        case 4: return "Reminder"
        default: return ""
        }
    }
}
