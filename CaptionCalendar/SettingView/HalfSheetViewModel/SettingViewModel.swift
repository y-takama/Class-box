//
//  CalendarSettingViewModel.swift
//  CalendarSettingViewModel
//
//  Created by 髙間洋平 on 2021/08/19.
//

import Foundation

enum SettingViewModel: Int, CaseIterable {
    case profile
    case setting
    case calendarSetting
    case calendarReminderHidden
    case timetableSetting
    case chatSetting
    case reminderSetting
    case reminderCategory
    case reminderList
    case tab
    case one
    case two
    case three
    case four
    case five
    case announce
    case security
    case logout
    case privacyPolicy
    case termsOfService
    case userstatus
    case isShowClassChat
    case isHiddenClassChat
    case isShowTextbook
    case isHiddenTextbook
    case hide
//    case report
    
    
    var description: String {
        switch self {
        case .profile: return "プロフィール"
        case .setting: return "設定"
        case .calendarSetting: return "Calendarの設定"
        case .calendarReminderHidden: return "reminderを非表示"
        case .timetableSetting: return "TimeTableの設定"
        case .chatSetting: return "Chatの設定"
        case .reminderSetting: return "Reminderの設定"
        case .reminderCategory: return "Category"
        case .reminderList: return "List"
        case .tab: return " タブの設定"
        case .hide: return "タブを隠す"
        case .announce: return "お知らせ"
        case .security: return "セキュリティ"
        case .logout: return "ログアウト"
        case .privacyPolicy: return "プライバシーポリシー"
        case .termsOfService: return "利用規約"
        case .one: return "tab1の設定"
        case .two: return "tab2の設定"
        case .three: return "tab3の設定"
        case .four: return "tab4の設定"
        case .five: return "tab5の設定"
        case .userstatus: return "Plan の変更"
        case .isShowClassChat: return "ClassChatを表示する"
        case .isHiddenClassChat: return "ClassChatを非表示にする"
        case .isShowTextbook: return "Textbookを表示する"
        case .isHiddenTextbook: return "Textbookを非表示にする"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person.crop.circle"
        case .setting: return "gear"
        case .calendarSetting: return "gearshape"
        case .calendarReminderHidden: return "tablecells"
        case .timetableSetting: return "gearshape"
        case .chatSetting: return "gearshape"
        case .reminderSetting: return "gearshape"
        case .reminderCategory: return "rectangle.portrait.topthird.inset.filled"
        case .reminderList: return "rectangle.portrait.lefthalf.inset.filled"
        case .tab: return "apps.iphone"
        case .hide: return "chevron.down"
        case .announce: return "bell"
        case .security: return "shield.checkerboard"
        case .logout: return "arrow.left.square"
        case .privacyPolicy: return "scroll"
        case .termsOfService: return "scroll"
        case .one: return "1.circle"
        case .two: return "2.circle"
        case .three: return "3.circle"
        case .four: return "4.circle"
        case .five: return "5.circle"
        case .userstatus: return "exclamationmark.circle"
        case .isShowClassChat: return "bubble.left.and.bubble.right"
        case .isHiddenClassChat: return "bubble.left.and.exclamationmark.bubble.right"
        case .isShowTextbook: return "book"
        case .isHiddenTextbook: return "book.closed"
        }
    }
}
