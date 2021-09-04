//
//  SelectedOptionViewModel.swift
//  SelectedOptionViewModel
//
//  Created by 髙間洋平 on 2021/08/20.
//

import Foundation

enum SelectedOptionViewModel: Int, CaseIterable {
    case calendar
    case calendarList
    case reminder
    case timeTable
    case chat
    
    
    var description: String {
        switch self {
        case .calendar: return "CALENDAR"
        case .calendarList: return "CALENDAR LIST"
        case .reminder: return "REMINDAR"
        case .timeTable: return "TIMETABLE"
        case .chat: return "CHAT"
        }
    }
    
    var imageName: String {
        switch self {
        case .calendar: return "calendar"
        case .calendarList: return "list.bullet"
        case .reminder: return "list.bullet.indent"
        case .timeTable: return "square.grid.3x3"
        case .chat: return "message"
        }
    }
}
