//
//  CalenderReminderDetailCell.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/04.
//

import SwiftUI

struct CalenderReminderDetailCell: View {
    let reminder: Reminder
    var body: some View {
        if reminder.courseName! == "" {
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
            .frame(width: getScreenBounds().width-30, alignment: .leading)
            .background(Color(reminder.color!).opacity(Double(reminder.coloropacity!)))
            .cornerRadius(10)
            .shadow(color: .gray, radius: 0.5, x: 0.5, y: 0.5)
        } else {
            let classvalues = reminder.courseName
            let start = String(classvalues!.prefix(1))
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text(start)
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 16, height: 16)
                        .padding(5)
                        .background(Color("TintColor"))
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
                    VStack(alignment: .leading) {
                        Text(classvalues!)
                            .font(.system(size: 13))
                            .bold()
                            .frame(alignment: .leading)
                    }
                    Spacer()
                }
                .frame(width: getScreenBounds().width-30, alignment: .leading)
                .padding(.bottom, 3)
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
            .frame(width: getScreenBounds().width-30, alignment: .leading)
            .background(Color(reminder.color!).opacity(Double(reminder.coloropacity!)))
            .cornerRadius(10)
            .shadow(color: .gray, radius: 0.5, x: 0.5, y: 0.5)
        }
    }
}
