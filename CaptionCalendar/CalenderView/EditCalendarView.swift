//
//  EditCalendarView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/28.
//

import SwiftUI

struct EditCalendarView: View {
    @State private var title: String
    @State private var startDateString: String
    @State private var endDateString: String
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var dayDetail: Bool
    @State private var myself = false
    @Binding var calendar: CCalendar
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(calendar: Binding<CCalendar>) {
        self._calendar = calendar
        self._title = State(initialValue: _calendar.wrappedValue.title ?? "")
        self._startDateString = State(initialValue: _calendar.wrappedValue.date_time_startdate)
        self._endDateString = State(initialValue: _calendar.wrappedValue.date_time_enddate)
        self._dayDetail = State(initialValue: _calendar.wrappedValue.dayDetail)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    Group {
                        Text("タイトル")
                            .bold()
                            .font(.system(size: 10))
                        TextField("タイトル", text: $title)
                            .foregroundColor(Color("CaptionColor"))
                            .font(.system(size: 13, weight: .semibold)).frame(height: 30)
                        Divider()
                        
                        HStack{
                            Text("時間指定")
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                            Toggle(isOn: $dayDetail) {
                            }
                        }.padding(.top, 12)
                        
                        HStack {
                            Text("開始")
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                            if dayDetail {
                                DatePicker(
                                    "",
                                    selection: $startDate,
                                    in: Date()...
                                ).labelsHidden()
                            } else {
                                DatePicker(
                                    "",
                                    selection: $startDate,
                                    in: Date()...,
                                    displayedComponents: .date
                                ).labelsHidden()
                            }
                        }.padding(.top, 12)
                        HStack {
                            Text("終了")
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                            if dayDetail {
                                DatePicker(
                                    "",
                                    selection: $endDate,
                                    in: Date()...
                                ).labelsHidden()
                            } else {
                                DatePicker(
                                    "",
                                    selection: $endDate,
                                    in: Date()...,
                                    displayedComponents: .date
                                ).labelsHidden()
                            }
                        }.padding(.top, 12)
                        Divider().padding(.top, 12)
                    }
                    .padding(.horizontal, 20)
                    .onAppear() {
                        self.startDate = EditCalendarView.dateFormatter.date(from: startDateString) ?? Date()
                        self.endDate = EditCalendarView.dateFormatter.date(from: endDateString) ?? Date()
                    }
                }
                
            }
            AdView(adUnitID: "ca-app-pub-6537638223494633/3225095498")
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.width*5/16)
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
        .navigationTitle("編集")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: registrationButton)
    }
    var registrationButton: some View {
        Button(action: {
            EditClass()
//            editButton.toggle()
        }, label: {
            Text("保存")
                .font(Font.system(size: 16, weight: .bold))
                .foregroundColor(Color("TextColor"))
        })
    }
    
    func EditClass() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("calendar").document(calendar.calendarID!)
        let data = ["title": title,
                    "startdate": startDate,
                    "enddate": endDate,
                    "dayDetail": dayDetail] as [String : Any]
        docRef.updateData(data){ err in
            mode.wrappedValue.dismiss()
        }
    }
    
    private static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
