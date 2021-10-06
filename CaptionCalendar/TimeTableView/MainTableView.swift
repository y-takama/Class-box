//
//  MainTableView.swift
//  MainTableView
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI

struct MainTableView: View {
    @Binding var showTimeTableSheet: Bool
    let width = UIScreen.main.bounds.width
    let user: User
    @State private var showingSetting: Bool = false
    @State private var showingMenu: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 3) {
                    TimeTableView(user: user)
                }
            }
            .navigationTitle("TimeTable")
            .navigationBarItems(trailing: HStack(spacing: 15) {
//                CalendarSettingButton
                menuButton
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
//    var CalendarSettingButton: some View {
//        Menu {
////            Button(action: {}) {
////                Text("カレンダーを追加")
////                Image(systemName: "calendar.badge.plus")
////            }
////            Button(action: {}) {
////                Text("予定を追加")
////                Image(systemName: "plus")
////            }
////            Button(action: {}) {
////                Text("学年歴を追加")
////                Image(systemName: "calendar.badge.exclamationmark")
////            }
////            Button(action: {}) {
////                Text("就活カレンダーを追加")
////                Image(systemName: "calendar.badge.exclamationmark")
////            }
//            Button(action: {}) {
//                Text("TimeTableの使い方を見る")
//                Image(systemName: "doc")
//            }
//        } label: {
//            Image(systemName: "ellipsis")
////                .font(Font.system(size: 18, weight: .bold))
//                .foregroundColor(Color("TextColor"))
//        }
//    }
    
    var menuButton: some View {
        Button(action: {
            showTimeTableSheet.toggle()
        }, label: {
            Image(systemName: "text.alignright")
//                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(Color("TextColor"))
        })
    }
}
