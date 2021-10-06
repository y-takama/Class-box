//
//  CalenderReminderCell.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/04.
//

import SwiftUI

struct CalenderReminderCell: View {
    let reminder: Reminder
    var body: some View {
        if reminder.courseName! == "" {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(reminder.color!).opacity(reminder.coloropacity!))
                    .cornerRadius(2)
                    .frame(width: getScreenBounds().width/7-4, height: 12)
                    .padding(.horizontal, 2)
                    
                Text(reminder.title!)
                    .font(.system(size: 11))
                    .bold()
                    .lineLimit(1)
                    .padding(.leading, 8)
                    .foregroundColor(Color("TextColor"))
            }
        } else {
            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .fill(Color(reminder.color!).opacity(reminder.coloropacity!))
                    .cornerRadius(2)
                    .frame(width: getScreenBounds().width/7-4, height: 12)
                    .padding(.horizontal, 2)
                    
                VStack(alignment: .leading, spacing: 0) {
                    let classvalues = reminder.courseName
                    let start = String(classvalues!.prefix(1))
                    Text(start)
                        .font(.system(size: 7, weight: .semibold))
                        .frame(width: 7, height: 7)
                        .padding(1.5)
                        .background(Color("TintColor"))
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
                        .padding(.bottom, -7)
                        .padding(.top, -3)
                    Text(reminder.title!)
                        .font(.system(size: 11))
                        .bold()
                        .lineLimit(1)
                        .padding(.leading, 8)
                }.foregroundColor(Color("TextColor"))
            }
        }
    }
}
