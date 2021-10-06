//
//  CalenderAllDayCell.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/05.
//

import SwiftUI

struct CalenderAllDayCell: View {
    let calendar: CCalendar
    var body: some View {
        Rectangle()
            .fill(Color(calendar.color!).opacity(calendar.coloropacity!))
            .frame(width: getScreenBounds().width/7, height: 12)
            .frame(height: 13)
//            .padding(.vertical, 1)
        
    }
}
