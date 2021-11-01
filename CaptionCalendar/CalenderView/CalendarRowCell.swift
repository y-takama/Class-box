//
//  CalendarDetailView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/05.
//

import SwiftUI

struct CalendarRowCell: View {
    let calendar: CCalendar
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 5) {
                if calendar.dayDetail {
                    VStack(spacing: 3) {
                        Text(calendar.TimestampCalendarDetailStartString)
                            .modifier(SecondaryCaptionTextStyle())
                        Rectangle()
                            .fill(Color(calendar.color!).opacity(calendar.coloropacity!))
                            .frame(width: 6, height: 20)
                            .cornerRadius(3)
                        Text(calendar.TimestampCalendarDetailEndString)
                            .modifier(SecondaryCaptionTextStyle())
                    }.frame(width: 50)
                    
                } else {
                    ZStack {
                        Rectangle()
                            .fill(Color(calendar.color!).opacity(calendar.coloropacity!))
                            .frame(width: 6, height: 40)
                            .cornerRadius(3)
                        Rectangle()
                            .fill(Color("TintColor"))
                            .frame(width: 40, height: 12)
                        Text("終日")
                            .modifier(SecondaryCaptionTextStyle())
                    }.frame(width: 50)
                }
                Text(calendar.title!)
                    .font(.headline)
                Spacer()
            }
            Divider().padding(.horizontal)
        }
    }
}
