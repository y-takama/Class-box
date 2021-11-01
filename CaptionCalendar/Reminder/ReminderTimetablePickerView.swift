//
//  ReminderTimetablePickerView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI

struct ReminderTimetablePickerView: View {
    @Binding var timetable: String
    @Binding var classId: String
    @StateObject var viewModel = TimeTableClassViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ScrollView {
            ForEach(viewModel.timetable, id: \.self) { classes in
                Button(action: {
                    self.timetable = classes.courseName
                    self.classId = classes.classId
                    mode.wrappedValue.dismiss()
                }, label: {
                    ClassCell(classes: classes)
                })
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
