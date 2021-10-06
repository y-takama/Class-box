//
//  ReminderContentView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI

struct ReminderContentView: View {
    @ObservedObject var viewModel: ReminderAllViewModel
    let reminder: Reminder
    let user: User
    var body: some View {
        VStack {
            HStack {
                Text(reminder.categoryName!)
                    .font(.system(size: 15))
                    .bold()
                    .foregroundColor(.primary)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "text.justify")
                        .font(.system(size: 14))
                })
                
            }.padding(.horizontal, 10)
            
            ScrollView {
                VStack {
                    ForEach(viewModel.reminder, id: \.self) { reminderinfo in
                        if reminderinfo.categoryName == reminder.categoryName {
                            NavigationLink(destination: {
                                ReminderDeteilView(reminder: reminderinfo)
                            }, label: {
                                if reminderinfo.courseName == "" {
                                    ReminderCellView(reminder: reminderinfo)
                                } else {
                                    ReminderTimetableView(reminder: reminderinfo)
                                }
                            })
                        }
                    }
                    
                    NavigationLink(destination: {
                        CreateReminderView(categoryName: reminder.categoryName!, user: user)
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        HStack {
                            Image(systemName: "plus")
                                .font(.system(size: 13))
                            Text("追加")
                                .font(.system(size: 12))
                        }
                        .foregroundColor(Color("TextColor"))
                        .frame(width: getScreenBounds().width*3/5 - 20, height: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("TextColor"), lineWidth: 0.3)
                        ).padding(.top)
                        
                    })
                    Spacer()
                }
                .padding(.top, 1)
                .frame(width: getScreenBounds().width*3/5)
            }
        }
        .onAppear(perform: {
            viewModel.fetchReminder()
        })
    }
}
