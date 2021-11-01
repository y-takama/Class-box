//
//  CalendarContentDetailView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/15.
//

import SwiftUI

struct CalendarContentDetailView: View {
    @State private var showCalendar = false
    @Binding var data : Int
    @ObservedObject var viewModel = CalenderContentViewModel()
    let selectedyear: Int
    let selectedmonth: Int
    var body: some View {
        let selectedday = String(format: "%04d",selectedyear)+String(format: "%02d",selectedmonth)+String(format: "%02d",data)
        VStack {
            ForEach(viewModel.calendar, id: \.self) { calendar in
                if calendar.TimestampCalendarStartString == selectedday {
                    NavigationLink(destination: {
                        CalendarDetailView(viewModel: CalendarDetailViewModel(calendar: calendar), calendar: calendar)
                    }, label: {
                        CalendarRowCell(calendar: calendar)
                    })
                    //                        CalendarCell(calendar: calendar)
                }
                if calendar.TimestampCalendarStartString < selectedday && calendar.TimestampCalendarEndString >= selectedday {
                    NavigationLink(destination: {
                        CalendarDetailView(viewModel: CalendarDetailViewModel(calendar: calendar), calendar: calendar)
                    }, label: {
                        CalendarRowCell(calendar: calendar)
                    })
                }
            }
            
            ForEach(viewModel.reminder, id: \.self) { reminder in
                if reminder.TimestampCalendarString == selectedday {
                    NavigationLink(destination: {
                        ReminderDeteilView(viewModel: ReminderDetailViewModel(reminder: reminder), reminder: reminder)
                    }, label: {
                        CalenderReminderDetailCell(reminder: reminder)
                    })
                }
            }
            Spacer()
        }
        .frame(minHeight: 160)
        .padding(.top, 10)
        .onAppear() {
            viewModel.fetchCalendar()
            viewModel.fetchReminder()
        }
    }
}
