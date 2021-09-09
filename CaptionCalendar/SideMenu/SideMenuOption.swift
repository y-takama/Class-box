//
//  SideMenuOption.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/08.
//

import Foundation

enum SideMenuOption: Int, CaseIterable {
    case calendar
    case calendarList
    
    case timeTable
    case chat
    case news
    case notification
    case help
    case inquiry
    case report
    case reminder
    case workPlace
    
    
    var description: String {
        switch self {
        case .calendar: return "Calemdar"
        case .calendarList: return "CalendarList"
        case .reminder: return "Remindar"
        case .timeTable: return "TimeTable"
        case .chat: return "Chat"
        case .news: return "News"
        case .notification: return "Notification"
        case .help: return "ヘルプ"
        case .inquiry: return "お知らせ"
        case .report: return "問題を報告する"
        case .workPlace: return "WorkPlace"
        }
    }
    
    var imageName: String {
        switch self {
        case .calendar: return "calendar"
        case .calendarList: return "list.bullet"
        case .reminder: return "list.bullet.indent"
        case .timeTable: return "square.grid.3x3"
        case .chat: return "message"
        case .news: return "newspaper"
        case .notification: return "bell"
        case .help: return "flag"
        case .inquiry: return "megaphone"
        case .report: return "arrow.up.doc"
        case .workPlace: return "mosaic"
        }
    }
}
