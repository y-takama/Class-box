//
//  ReminderDatePickerView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI

struct ReminderDatePickerView: View {
    @Binding var datePicker: Bool
    @Binding var datePickerDate: Bool
    @Binding var datePickerDateDetail: Bool
    @Binding var date: Date
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if datePickerDateDetail {
                        DatePicker(
                            "Date",
                            selection: $date
                        )
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .labelsHidden()
                    } else {
                        DatePicker(
                            "Date",
                            selection: $date,
                            displayedComponents: .date
                        )
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .labelsHidden()
                    }
                    Spacer()
                }.frame(height: getScreenBounds().width)
                
                Divider()
                Toggle(isOn: $datePickerDateDetail) {
                            Text("Include Time")
                }.padding(.horizontal, 7)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: backButton)
            .frame(width: getScreenBounds().width - 40)
            .padding(.top)
        }
        
        
    }
    var backButton: some View {
        Button(action: {
            datePicker.toggle()
//            bacButtonAlert.toggle()
//            mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.backward")
                .font(.system(size: 16))
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }
//    var saveButton: some View {
//        Button(action: {
//
//        }, label: {
//            Text("完了")
//                .font(.system(size: 15))
//                .foregroundColor(Color("TextColor"))
//        })
//    }
}
