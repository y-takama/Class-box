//
//  TimePicker.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/04.
//

import SwiftUI

struct TimePicker: View {
    @Binding var datePickerDateDetail : Bool
//    @Binding var datePickerDateDetail: Bool
    @Binding var startdate: Date
    var body: some View {
        VStack {
            if datePickerDateDetail {
                DatePicker(
                    "Date",
                    selection: $startdate
                )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
            } else {
                DatePicker(
                    "Date",
                    selection: $startdate,
                    displayedComponents: .date
                )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
            }
            Toggle(isOn: $datePickerDateDetail) {
                        Text("Include Time")
            }.padding(.horizontal, 7)
            Spacer()
        }
        .padding(.horizontal)
        .frame(height: 400)
    }
}
