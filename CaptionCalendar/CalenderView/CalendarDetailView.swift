//
//  CalendarDetailView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/28.
//

import SwiftUI

struct CalendarDetailView: View {
    @State private var trashAlert = false
    @State private var colorPicker = false
    @State private var color = "TintColor"
    @State var coloropacity: Double = 1
    @ObservedObject var viewModel: CalendarDetailViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let calendar: CCalendar
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Circle()
                    .fill(Color(viewModel.calendar.color!))
                    .frame(width: 12, height: 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("TextColor"), lineWidth: 0.3)
                    )
                Text(viewModel.calendar.title!)
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 5)
            .padding(.bottom, 13)
            .frame(width: getScreenBounds().width)
            
            Color(viewModel.calendar.color!).opacity(viewModel.calendar.coloropacity!)
                .frame(width: getScreenBounds().width, height: 1)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text(viewModel.calendar.dateStyleFull)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                    if viewModel.calendar.dayDetail {
                        Group {
                            Text(viewModel.calendar.TimestampCalendarDetailStartString) +
                            Text(" - ") +
                            Text(viewModel.calendar.TimestampCalendarDetailEndString)
                        }
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                    } else {
                        Text("終日")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    
                    
                }
                .frame(width: getScreenBounds().width - 40, alignment: .leading)
                .padding(.vertical, 13)
                
            }
            Divider()
            VStack {
                HStack {
                    NavigationLink(destination: {
                        EditCalendarView(calendar: $viewModel.calendar)
//                        ClassEditView(classes: $viewModel.classInfo)
                    }, label: {
                        Text("予定の編集")
                            .bold()
                            .font(.system(size: 14))
                            .frame(width: getScreenBounds().width/2 - 30, height: 32)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("TextColor"), lineWidth: 0.3)
                            )
                    })
                    Spacer()
                    Button(action: {
                        withAnimation() {
                            colorPicker.toggle()
                        }
                    }, label: {
                        Text("カラーの変更")
                            .bold()
                            .font(.system(size: 14))
                            .frame(width: getScreenBounds().width/2 - 30, height: 32)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("TextColor"), lineWidth: 0.3)
                            )
                    })
                }
                .padding(.vertical, 10).padding(.horizontal, 20)
                .foregroundColor(Color("TextColor"))
                
                if colorPicker {
                    VStack(spacing: 15) {
                        Divider()
                        Button(action: {
                            color = "TintColor"
                            coloropacity = 1
                            registrationColor()
                        }, label: {
                            Text("クリア")
                                .foregroundColor(Color("TextColor"))
                                .bold()
                                .font(.system(size: 15))
                                .frame(width: getScreenBounds().width - 40,
                                       height: (getScreenBounds().width-40)/12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 2)
                                        .stroke(Color("TextColor"), lineWidth: 0.3)
                                ).padding(.top)
                        })
                        HStack(spacing: 0) {
                            ForEach(0..<12){ num in
                                Button(action: {
                                    color = "Color\(num)"
                                    coloropacity = 1
                                    registrationColor()
                                }, label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color("Color\(num)"))
                                            .frame(width: (getScreenBounds().width-40)/12-2, height: (getScreenBounds().width-40)/12-2)
                                            .padding(1)
                                        if color == "Color\(num)" {
                                            Image(systemName: "square")
                                                .resizable()
                                                .frame(width: (getScreenBounds().width-40)/12, height: (getScreenBounds().width-40)/12)
                                                .foregroundColor(Color.gray)
                                        }
                                    }
                                })
                            }
                        }
                    }.padding(.bottom, 25)
                }
                
            }
        }
        .onAppear {
            viewModel.fetchCalendar()
        }
        .onTapGesture(perform: {
            withAnimation() {
                colorPicker = false
            }
        })
        .navigationBarItems(trailing: trashButton)
        .navigationBarTitle("")
        .alert(isPresented: $trashAlert) {
            Alert(title: Text("消去"),
                  message: Text("この予定を消去してもよろしいでしょうか？"),
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
                .font(Font.system(size: 15, weight: .semibold))
        })
    }
    func DeleteReminder() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("calendar").document(calendar.calendarID!)
        docRef.delete() { _ in
            mode.wrappedValue.dismiss()
        }
    }
    func registrationColor() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("calendar").document(calendar.calendarID!)
        let data = ["color": color,
                    "coloropacity": coloropacity] as [String: Any]
        docRef.updateData(data) { _ in
            viewModel.fetchCalendar()
        }
    }
}
