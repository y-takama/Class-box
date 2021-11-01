//
//  CreateNewCalenderView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/04.
//

import SwiftUI

import SwiftUI

struct CreateNewCalenderView: View {
    @State var bacButtonAlert = false
    @State private var datePicker = false
    @State private var enddatePicker = false
    @State private var datePickerDate = false
    @State private var datePickerDateDetail = false
    @State private var colorPicker = false
    @State private var title = ""
    @State var timetable = ""
    @State var classId = ""
    @State var color = "BackgroundColor"
    @State var coloropacity: Double = 1
    @State private var note = ""
    @State private var startdate = Date()
    @State private var enddate = Date()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    let user: User
    var body: some View {
        ScrollView(showsIndicators: false) {
            CustomTextField("タイトル", text: $title)
            VStack {
                Divider()
                HStack {
                    Image(systemName: "calendar")
                        .font(.system(size: 16))
                        .frame(width: 20)
                    Text("Date")
                        .bold()
                        .font(.system(size: 14))
                        
                    Spacer()
                    Button(action: {
                        datePickerDateDetail.toggle()
                    }, label: {
                        Text(datePickerDateDetail ? "全日" : "時間指定")
                            .bold()
                            .foregroundColor(Color("TextColor"))
                            .font(.system(size: 14))
                    })
                }.frame(height: 25)
                
                HStack(spacing: 0) {
                    Spacer()
                    if datePickerDateDetail {
                        DatePicker(
                            "",
                            selection: $startdate
                        ).labelsHidden()
                    } else {
                        DatePicker(
                            "",
                            selection: $startdate,
                            displayedComponents: .date
                        ).labelsHidden()
                    }
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 17))
                        .foregroundColor(Color("TextColor"))
                    Spacer()
                    
                    if datePickerDateDetail {
                        DatePicker(
                            "",
                            selection: $enddate
                        ).labelsHidden()
                    } else {
                        DatePicker(
                            "",
                            selection: $enddate,
                            displayedComponents: .date
                        ).labelsHidden()
                    }
                    
                    Spacer()
                }.frame(height: 40)
                
                if enddatePicker {
                    VStack {
                        if datePickerDateDetail {
                            DatePicker(
                                "Date",
                                selection: $enddate
                            )
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .labelsHidden()
                        } else {
                            DatePicker(
                                "Date",
                                selection: $enddate,
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
                if user.userStats! == "student" {
                    HStack(spacing: 0) {
                        NavigationLink(destination: {
                            ReminderTimetablePickerView(timetable: $timetable,
                                                        classId: $classId)
                        }, label: {
                            HStack(spacing: 9) {
                                HStack {
                                    Image(systemName: "square.grid.3x3")
                                        .font(.system(size: 16))
                                        .frame(width: 20)
                                    Text("Timetable")
                                        .font(.system(size: 14))
                                        .bold()
                                    Spacer()
                                }.frame(width: getScreenBounds().width*2/5-40)
                                Text(timetable)
                                    .bold()
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("TextColor"))
                                Spacer()
                            }
                        })
                        if timetable == "" {
                            Image(systemName: "chevron.right")
                                .font(Font.system(size: 13, weight: .semibold))
                        } else {
                            Button(action: {
                                self.timetable = ""
                            }, label: {
                                Image(systemName: "multiply.circle")
                                    .font(.system(size: 16))
                            })
                        }
                    }.frame(minHeight: 45)
                }
                
                
                HStack(spacing: 0) {
                    Button(action: {
                        colorPicker.toggle()
                    }, label: {
                        HStack(spacing: 9) {
                            HStack {
                                Image(systemName: "paintbrush")
                                    .font(.system(size: 16))
                                    .frame(width: 20)
                                Text("Color")
                                    .font(.system(size: 14))
                                    .bold()
                                Spacer()
                            }.frame(width: getScreenBounds().width*2/5-40)
                            
                            Image(systemName: "rectangle.fill")
                                .resizable()
                                .frame(width: 50, height: 30)
                                .foregroundColor(Color(color))
                                .opacity(Double(coloropacity))
                            Spacer()
                        }
                    })
                    if color != "BackgroundColor" {
                        Button(action: {
                            color = "BackgroundColor"
                            colorPicker = false
                            coloropacity = 1
                        }, label: {
                            Image(systemName: "multiply.circle")
                                .font(.system(size: 16))
                        })
                    }
                }.frame(height: 45)
                if colorPicker {
                    ColorChooserView(color: $color, coloropacity: $coloropacity)
                }
                Divider()
            }.frame(width: getScreenBounds().width - 40)
            
            CustomTextField("Note", text: $note)
        }
        .foregroundColor(Color("TextColor"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: backButton, trailing: saveButton)
        .navigationTitle("")
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
    }
    var backButton: some View {
        Button(action: {
            mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.backward")
                .font(.system(size: 16))
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }
    var saveButton: some View {
        
        Button(action: {
            let startTime = CreateNewCalenderView.longDateFormatter.string(from: startdate)
            let endTime = CreateNewCalenderView.longDateFormatter.string(from: enddate)
            if title.count != 0 && startTime <= endTime {
                saveReminder()
            }
        }, label: {
            let startTime = CreateNewCalenderView.longDateFormatter.string(from: startdate)
            let endTime = CreateNewCalenderView.longDateFormatter.string(from: enddate)
            Text("保存")
                .bold()
                .font(.system(size: 15))
                .foregroundColor(title.count == 0 && startTime <= endTime ? .gray.opacity(0.5) : Color("TextColor"))
        })
    }
    func saveReminder() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("calendar").document()
        let docID = docRef.documentID
        let data = ["title": title,
                    "startdate": startdate,
                    "enddate": enddate,
                    "day": datePickerDate,
                    "dayDetail": datePickerDateDetail,
                    "courseName": timetable,
                    "classId": classId,
                    "color": color,
                    "coloropacity": coloropacity,
                    "calendarID": docID] as [String: Any]
        docRef.setData(data) { _ in
        }
        mode.wrappedValue.dismiss()
    }
    private static var longDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMdd"
        return formatter
    }()
}
