//
//  EditReminderView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/28.
//

import SwiftUI

struct EditReminderView: View {
    @State private var title: String
    @State private var DateString: String
    @State private var date = Date()
    @State private var dayDetail: Bool
    @State private var myself = false
    @Binding var reminder: Reminder
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(reminder: Binding<Reminder>) {
        self._reminder = reminder
        self._title = State(initialValue: _reminder.wrappedValue.title ?? "")
        self._DateString = State(initialValue: _reminder.wrappedValue.date_time_date)
        self._dayDetail = State(initialValue: _reminder.wrappedValue.dayDetail)
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
                            Text("Date")
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                            if dayDetail {
                                DatePicker(
                                    "",
                                    selection: $date,
                                    in: Date()...
                                ).labelsHidden()
                            } else {
                                DatePicker(
                                    "",
                                    selection: $date,
                                    in: Date()...,
                                    displayedComponents: .date
                                ).labelsHidden()
                            }
                        }.padding(.top, 12)
                        Divider().padding(.top, 12)
                    }
                    .padding(.horizontal, 20)
                    .onAppear() {
                        self.date = EditReminderView.dateFormatter.date(from: DateString) ?? Date()
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
            EditReminder()
        }, label: {
            Text("保存")
                .font(Font.system(size: 16, weight: .bold))
                .foregroundColor(Color("TextColor"))
        })
    }
    
    func EditReminder() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("reminder").document(reminder.reminderID!)
        let data = ["title": title,
                    "timestamp": date,
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

