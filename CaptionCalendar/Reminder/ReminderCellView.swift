//
//  ReminderCellView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI

struct ReminderCellView: View {
    let reminder: Reminder
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                Text("Date")
                    .font(.system(size: 12, weight: .semibold))
                    .frame(width: 30)
                if reminder.day {
                    if reminder.dayDetail {
                        Text(reminder.TimestampDetailString)
                    } else {
                        Text(reminder.TimestampString)
                    }
                }
            }
            HStack {
                Text("Title")
                    .font(.system(size: 12, weight: .semibold))
                    .frame(width: 30)
                Text(reminder.title!)
            }
        }
        .padding(10)
        .foregroundColor(Color("TextColor"))
        .frame(width: getScreenBounds().width*3/5-20, alignment: .leading)
        .background(Color(reminder.color!).opacity(Double(reminder.coloropacity!)))
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color("TextColor"), lineWidth: 0.1)
        )
        .shadow(color: .gray, radius: 0.5, x: 0.5, y: 0.5)
    }
}
