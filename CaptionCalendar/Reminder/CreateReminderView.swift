//
//  CreateReminderView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI

struct CreateReminderView: View {
    @State var bacButtonAlert = false
    @State private var datePicker = false
    @State private var datePickerDate = false
    @State private var datePickerDateDetail = false
    @State private var timetablePicker = false
    @State private var colorPicker = false
    @State private var title = ""
    @State var timetable = ""
    @State var classId = ""
    @State var color = "BackgroundColor"
    @State var coloropacity: Double = 1
//    @State var timetables: [String] = []
    @State private var note = ""
    @State private var date = Date()
    @State private var remindertime = Date()
//    @State private var selection = 0
    let categoryName: String
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    let user: User
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                CustomTextField("タイトル", text: $title)
                VStack {
                    Divider()
                    HStack(spacing: 0) {
                        Button(action: {
                            datePicker.toggle()
                            datePickerDate = true
                        }, label: {
                            HStack(spacing: 9) {
                                HStack {
                                    Image(systemName: "calendar")
                                        .font(.system(size: 16))
                                        .frame(width: 20)
                                    Text("Date")
                                        .font(.system(size: 14))
                                        .bold()
                                    Spacer()
                                }.frame(width: getScreenBounds().width*2/5-40)
                                if datePickerDate {
                                    Text(date, style: .date)
                                        .font(.system(size: 14))
                                    if datePickerDateDetail {
                                        Text(date, style: .time)
                                            .font(.system(size: 14))
                                    }
                                } else {
                                }
                                Spacer()
                            }
//                            .padding(.vertical, 7)
                        })
                        if datePickerDate {
                            Button(action: {
                                datePickerDate.toggle()
                            }, label: {
                                Image(systemName: "multiply.circle")
                                    .font(.system(size: 16))
                            })
                        }
                    }.frame(height: 40)
                    
                    if user.userStats == "student" {
                        HStack(spacing: 0) {
                            Button(action: {
                                timetablePicker.toggle()
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
        //                            Text("\(selection)")
                                    Text(timetable)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("TextColor"))
                                    Spacer()
                                }
                            })
                            if timetable != "" {
                                Button(action: {
                                    self.timetable = ""
                                }, label: {
                                    Image(systemName: "multiply.circle")
                                        .font(.system(size: 16))
                                })
                            }
                        }.frame(minHeight: 40)
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
                    }.frame(height: 40)
                    
                    if colorPicker {
                        ColorChooserView(color: $color, coloropacity: $coloropacity)
                    }
                    
                    
                    
                    Divider()
                }.frame(width: getScreenBounds().width - 40)
                
                CustomTextField("Note", text: $note)
            }
        }
        
        .foregroundColor(Color("TextColor"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: backButton, trailing: saveButton)
//        .alert(isPresented: $bacButtonAlert) {
//            Alert(title: Text(""),
//                  message: Text("保存されていません。戻ってもよろしいてしょうか？"),
//                  primaryButton: .cancel(Text("Calcel")),
//                  secondaryButton: .default(Text("OK"),
//                                            action: {
//                mode.wrappedValue.dismiss()
//            }))
//        }
        .fullScreenCover(isPresented: $datePicker){
            ReminderDatePickerView(datePicker: $datePicker,
                                   datePickerDate: $datePickerDate,
                                   datePickerDateDetail: $datePickerDateDetail,
                                   date: $date)
        }
        .fullScreenCover(isPresented: $timetablePicker){
            ReminderTimetablePickerView(timetable: $timetable,
                                        classId: $classId,
                                        timetablePicker: $timetablePicker)
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
//        NavigationLink(isActive: $timetablePicker, destination: {
//            ReminderTimetablePickerView(timetable: $timetable,
//                                        classId: $classId,
//                                        timetablePicker: $timetablePicker)
//        }, label: {})
    }
    var backButton: some View {
        Button(action: {
            mode.wrappedValue.dismiss()
//            bacButtonAlert.toggle()
        }, label: {
            Image(systemName: "chevron.backward")
                .font(.system(size: 16))
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }
    var saveButton: some View {
        Button(action: {
            if title.count != 0 {
                saveReminder()
            }
            
        }, label: {
            Text("保存")
                .font(.system(size: 15))
                .foregroundColor(Color("TextColor"))
        })
    }
    func saveReminder() {
        if datePickerDate {
        } else {
            date = Date().advanced(by: TimeInterval.reminder)
        }
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("reminder").document()
        let docID = docRef.documentID
        let data = ["title": title,
                    "timestamp": date,
                    "day": datePickerDate,
                    "dayDetail": datePickerDateDetail,
                    "courseName": timetable,
                    "categoryName": categoryName,
                    "classId": classId,
                    "color": color,
                    "coloropacity": coloropacity,
                    "reminderID": docID] as [String: Any]
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
