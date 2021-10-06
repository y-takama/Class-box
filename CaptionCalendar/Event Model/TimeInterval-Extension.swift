//
//  TimeInterval-Extension.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import Foundation

extension TimeInterval {
    static func weeks(_ weeks: Double) -> TimeInterval {
        return weeks * TimeInterval.week
    }
    
    static func twoweeks(_ weeks: Double) -> TimeInterval {
        return weeks * TimeInterval.twoweek
    }
    
    static var week: TimeInterval {
        return 7 * 24 * 60 * 60
    }
    
    static var twoweek: TimeInterval {
        return 7 * 24 * 60 * 60 * 30
    }
    
    static var reminder: TimeInterval {
        return 7 * 24 * 60 * 60 * 300
    }
}
