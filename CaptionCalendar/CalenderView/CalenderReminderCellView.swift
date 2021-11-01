//
//  CalenderReminderCellView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/04.
//

import SwiftUI

struct CalenderReminderCellView: View {
    let selectedData: String
    @StateObject var viewModel = CalenderContentViewModel()
    var body: some View {
        ForEach(viewModel.reminder, id: \.self) { reminder in
            if reminder.TimestampCalendarString == selectedData {
                CalenderReminderCell(reminder: reminder)
            }
        }
    }
}
