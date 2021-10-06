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
    @Binding var timetablePicker: Bool
    @ObservedObject var viewModel = TimeTableClassViewModel()
//    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.timetable, id: \.self) { classes in
                    Button(action: {
                        self.timetable = classes.courseName
                        self.classId = classes.classId
                        timetablePicker.toggle()
                    }, label: {
                        ClassCell(classes: classes)
                    })
                }
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: backButton)
        }
        
    }
    var backButton: some View {
        Button(action: {
            timetablePicker.toggle()
        }, label: {
            Image(systemName: "chevron.backward")
                .font(.system(size: 16))
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }
}
