//
//  ReminderMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI
import Firebase

struct ReminderMainView: View {
    @State private var categoryName = ""
    @State private var showMakeCategoryView = false
    @State private var showMakeCategoryButton = false
    @State private var showInitialReminderView = true
    @State var loading = false
    @State private var date = Date()
    @Binding var showReminderSheet: Bool
    @StateObject var viewModel = ReminderMainViewModel()
    let user: User
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(viewModel.reminder, id: \.self) { reminder in
                        ReminderContentView(viewModel: ReminderAllViewModel(remindeInfo: reminder), reminder: reminder, user: user)
                    }
                    if viewModel.reminder != [] {
                        VStack(spacing: 0) {
                            if showMakeCategoryButton {
                                HStack {
                                    
                                    TextField("", text: $categoryName)
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
            if viewModel.reminder == [] && showInitialReminderView {
                InitialReminderView(loading: $loading,
                                    showInitialReminderView: $showInitialReminderView)
                    .onDisappear() {
                        viewModel.fetchReminder()
                    }
            }
            if viewModel.loading {
                ZStack {
                    Color("TintColor").ignoresSafeArea(.all)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("CaptionColor")))
                        .scaleEffect(1)
                }
            }
            if loading {
                ZStack {
//                    Color.red.ignoresSafeArea(.all)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("CaptionColor")))
                        .scaleEffect(1)
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
//        .onAppear(perform: {
//            viewModel.fetchReminder()
//        })
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
        let docRef = COLLECTION_USERS.document(user.id!).collection("reminder_category").document()
        let docID = docRef.documentID
        let data = ["categoryName": categoryName,
                    "timestamp": Timestamp(date: Date()),
                    "reminderID": docID] as [String: Any]
        docRef.setData(data) { _ in
            self.categoryName = ""
            viewModel.fetchReminder()
            
        }
    }
    func makeAll() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("reminder_category").document()
        let docID = docRef.documentID
        let data = ["categoryName": "All",
                    "timestamp": date,
                    "timestamp": Timestamp(date: Date()),
                    "reminderID": docID] as [String: Any]
        docRef.setData(data) { _ in
            viewModel.fetchReminder()
        }
    }
}
