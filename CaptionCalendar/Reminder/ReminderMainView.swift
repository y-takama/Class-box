//
//  ReminderMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI

struct ReminderMainView: View {
    @State private var categoryName = ""
    @State private var showMakeCategoryView = false
    @State private var showMakeCategoryButton = false
    @State private var date = Date()
    @Binding var showReminderSheet: Bool
    @ObservedObject var viewModel = ReminderMainViewModel()
    let user: User
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(viewModel.reminder, id: \.self) { reminder in
                            if reminder.categoryName! == "All" {
                                ReminderContentView(viewModel: ReminderAllViewModel(remindeInfo: reminder), reminder: reminder, user: user)
                            } else {
                                ReminderContentView(viewModel: ReminderAllViewModel(remindeInfo: reminder), reminder: reminder, user: user)
                            }
                        }
                        if viewModel.reminder != [] {
                            VStack(spacing: 0) {
                                if showMakeCategoryButton {
                                    HStack {
                                        TextField("", text: $categoryName)
//                                            .padding(2)
                                            .background(Color("TextColor").opacity(0.1))
                                            .cornerRadius(5)
                                            .font(.system(size: 14))
                                            .padding(.leading, 10)
                                        Button(action: {
                                            if categoryName.count != 0 {
                                                makeCategory()
                                                showMakeCategoryButton = false
                                            }
                                        }, label: {
                                            Image(systemName: "plus")
                                                .font(.system(size: 14))
                                                .foregroundColor(categoryName.count != 0 ? Color("TextColor") : Color.gray)
                                        })
                                    }
                                    .frame(width: getScreenBounds().width*3/5 - 40,
                                           height: 35)
                                } else {
                                    HStack {
                                        Button(action: {
                                            showMakeCategoryButton = true
                                        }, label: {
                                            Image(systemName: "plus")
                                                .font(.system(size: 14))
                                                .padding(.leading)
                                        })
                                        Spacer()
                                    }
                                    .foregroundColor(Color.gray)
                                    .frame(width: getScreenBounds().width*3/5 - 40,
                                           height: 35)
                                }
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                }
                if viewModel.reminder == [] {
                    Button(action: {
                        makeAll()
                    }, label: {
                        Text("はじめる")
                    })
                }
                if viewModel.loading {
                    ZStack {
                        Color("TintColor").ignoresSafeArea(.all)
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("CaptionColor")))
                            .scaleEffect(1)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Reminder").navigationBarItems(trailing: HStack(spacing: 15) {
                CalendarSettingButton
                menuButton
            })
            
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
    }
    var CalendarSettingButton: some View {
        Menu {
            Button(action: {}) {
                Text("Reminderの使い方を見る")
                Image(systemName: "doc")
            }
        } label: {
            Image(systemName: "ellipsis")
                .foregroundColor(Color("TextColor"))
        }
    }
    
    var menuButton: some View {
        Button(action: {
            showReminderSheet.toggle()
        }, label: {
            Image(systemName: "text.alignright")
                .foregroundColor(Color("TextColor"))
        })
    }
    func makeCategory() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("reminderCategory").document()
        let docID = docRef.documentID
        let data = ["categoryName": categoryName,
                    "reminderID": docID] as [String: Any]
        docRef.setData(data) { _ in
            self.categoryName = ""
            viewModel.fetchReminder()
            
        }
    }
    func makeAll() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("reminderCategory").document()
        let docID = docRef.documentID
        let data = ["categoryName": "All",
                    "timestamp": date,
                    "reminderID": docID] as [String: Any]
        docRef.setData(data) { _ in
            viewModel.fetchReminder()
        }
    }
}
