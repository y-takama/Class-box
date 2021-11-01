//
//  MainTableView.swift
//  MainTableView
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI

struct MainTableView: View {
    @Binding var showTimeTableSheet: Bool
    @State private var showingNotification = true
    @ObservedObject var viewModel = MainTableViewModel()
    var user: User
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 3) {
                    if user.isShowTextbook! {
                        TimetableTextbookView(user: user)
                            .frame(height: (getScreenBounds().width/3)*9/16 + 10,
                                   alignment: .center)
                    }
                    TimeTableView(user: user)
                }
            }
            if user.usedTmetable! {
                
            } else {
                VStack {
                    ForEach(viewModel.timetable, id: \.self) { university in
                        if university.university! == user.university! {
                            Text("").onAppear(perform: {
                                showingNotification = false
                            })
                        }
                    }
                }
            }
            InitialTimetableView(showingNotification: $showingNotification,
                                 user: user)
        }
        .navigationBarItems(trailing: HStack(spacing: 15) {
            menuButton
        })
    }
    var menuButton: some View {
        Button(action: {
            showTimeTableSheet.toggle()
        }, label: {
            Image(systemName: "text.alignright")
                .foregroundColor(Color("TextColor"))
        })
    }
    
}
