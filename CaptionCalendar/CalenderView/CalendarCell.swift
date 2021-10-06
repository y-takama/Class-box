//
//  CalendarCell.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/04.
//

import SwiftUI

struct CalendarCell: View {
    let calendar: CCalendar
    var body: some View {
        ZStack(alignment: .leading) {
            if calendar.dayDetail {
                Rectangle()
                    .fill(Color(calendar.color!).opacity(calendar.coloropacity!))
                    .cornerRadius(2)
                    .frame(width: getScreenBounds().width/7-4, height: 12)
                    .padding(.horizontal, 2)
            } else {
                Rectangle()
                    .fill(Color(calendar.color!).opacity(calendar.coloropacity!))
                    .frame(width: getScreenBounds().width/7, height: 12)
            }
            Text(calendar.title!)
                .font(.system(size: 11))
                .bold()
                .lineLimit(1)
                .padding(.leading, 8)
                .foregroundColor(Color("TextColor"))
        }
        .frame(height: 13)
//        .padding(.vertical, 1)
    }
}
