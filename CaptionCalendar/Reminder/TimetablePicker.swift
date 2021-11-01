//
//  TimetablePicker.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI

struct TimetablePicker: View {
    @Binding var timetable: String
    @Binding var timetablePicker: Bool
    @StateObject var viewModel = TimeTableClassViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Divider()
            Button(action: {
                timetablePicker.toggle()
            }, label: {
                HStack {
                    Spacer()
                    Text("cancel")
                        .padding(.trailing, 20)
                        .padding(.top, 5)
                }
            })
            Picker(selection: $timetable, label: Text("")) {
                ForEach(viewModel.timetable, id: \.self) { classes in
                    Text(classes.courseName)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: getScreenBounds().width - 40)
            .labelsHidden()
        }
    }
}
