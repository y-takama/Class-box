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
        VStack(alignment: .leading, spacing: 8) {
            if reminder.courseName! == "" && reminder.day {
                HStack(spacing: 5) {
                    Circle()
                        .fill(Color(reminder.color!))
                        .frame(width: 14, height: 14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color("TextColor"), lineWidth: 0.3)
                        )
                        .padding(.horizontal, 18)
                    
                    Text(reminder.title!)
                        .font(.headline)
                }
                Divider().padding(.horizontal).padding(.top, 10)
                
            } else if reminder.day  {
                HStack {
                    let classvalues = reminder.courseName
                    let start = String(classvalues!.prefix(2))
                    Text(start)
                        .font(.system(size: 7, weight: .semibold))
                        .frame(width: 14, height: 14)
                        .padding(2)
                        .background(Color(reminder.color!))
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 9)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
                        .padding(.leading, 16)
                    Text(reminder.courseName!)
                        .font(.system(size: 11))
                    Spacer()
                }
                Text(reminder.title!)
                    .font(.headline)
                    .padding(.leading, 55)
                Divider().padding(.horizontal).padding(.top, 10)
            }
            
        }
    }
}
