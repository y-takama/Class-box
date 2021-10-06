//
//  ReminderDeteilView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI

struct ReminderDeteilView: View {
    @State private var trashAlert = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let reminder: Reminder
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Color(reminder.color!).opacity(reminder.coloropacity!)
                        .frame(width: getScreenBounds().width)
                    VStack(alignment: .leading) {
                        if reminder.courseName == "" {
                        } else {
                            HStack {
                                let classvalues = reminder.courseName
                                let start = String(classvalues!.prefix(1))
                                Text(start)
                                    .font(.system(size: 18, weight: .semibold))
                                    .frame(width: 26, height: 26)
                                    .padding(7)
                                    .background(Color("TintColor"))
                                    .clipShape(Circle())
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gray, lineWidth: 0.2)
                                    )
                                VStack(alignment: .leading) {
                                    Text(classvalues!)
                                        .bold()
                                        .font(.system(size: 15))
                                        .frame(alignment: .leading)
                                }
                                Spacer()
                            }
                        }
                        Text(reminder.title!)
                            .bold()
                            .font(.system(size: 15))
                    }.padding()
                }
                
                
            }.padding(.horizontal, 20)
        }
        .navigationBarItems(trailing: trashButton)
        .alert(isPresented: $trashAlert) {
            Alert(title: Text("消去"),
                  message: Text("このReminderを消去してもよろしいでしょうか？"),
                  primaryButton: .cancel(Text("Cancel")),
                  secondaryButton: .default(Text("OK"), action: {
                DeleteReminder()
            }))
        }
    }
    var trashButton: some View {
        Button(action: {
            trashAlert.toggle()
        }, label: {
            Image(systemName: "trash")
                .font(.system(size: 16))
                .foregroundColor(Color("TextColor"))
        })
    }
    func DeleteReminder() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("reminder").document(reminder.reminderID!)
        docRef.delete() { _ in
            mode.wrappedValue.dismiss()
        }
    }
}
