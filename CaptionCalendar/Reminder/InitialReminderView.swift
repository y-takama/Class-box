//
//  InitialReminderView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/12.
//

import SwiftUI
import Firebase

struct InitialReminderView: View {
    @Binding var loading: Bool
    @Binding var showInitialReminderView: Bool
    var body: some View {
        ZStack {
            Color("TintColor")
            VStack(alignment: .center, spacing: 8) {
                ZStack {
                    Color.white
                    VStack {
                        Image(systemName: "tablecells")
                            .font(.system(size: 30))
                        Text("Reminder")
                            .font(.system(size: 11))
                    }.padding()
                        .foregroundColor(Color.black)
                }.frame(height: 85)
                Divider().padding(.top, -8)
                VStack {
                    Text("REMINDER")
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(Color("TextColor"))
                        .padding(.bottom, 8)
                        .frame(alignment: .center)
                    Text("CalendarやTimetableなどと連携することができます")
                        .font(.system(size: 12))
                        .foregroundColor(.primary)
                        .frame(alignment: .center)
                    Text("リマインダーを作成してみましょう")
                        .font(.system(size: 12))
                        .foregroundColor(.primary)
                        .frame(alignment: .center)
                }
                .padding(.vertical)
                .padding(.horizontal, 8)
                Divider()
                Button (action: {
                    makeAll()
                }, label: {
                    Text("始める")
                        .bold()
                        .font(.system(size: 16))
                        .padding(8)
                        .padding(.bottom, 5)
                })
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 0.2)
            )
            .background(Color("TextColor").opacity(0.1))
            .cornerRadius(20)
            .frame(width: getScreenBounds().width*2/3, alignment: .center)
        }
    }
    
    func makeAll() {
        self.loading = true
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("reminder_category").document()
        let docID = docRef.documentID
        let data = ["categoryName": "All",
                    "timestamp": Timestamp(date: Date()),
                    "reminderID": docID] as [String: Any]
        docRef.setData(data) { _ in
            ReminderMainViewModel.shared.fetchReminder()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showInitialReminderView = false
                self.loading = false
            }
        }
    }
}
