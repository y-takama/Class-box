//
//  MainTableView.swift
//  MainTableView
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI

struct MainTableView: View {
    let width = UIScreen.main.bounds.width
    let user: User
    @State private var showingSetting: Bool = false
    @State private var showingMenu: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                TimeTableView(user: user)
                AdView()
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.width*5/16)
                    .padding(.top, 80)
            }
            .navigationTitle("TimeTable")
            .navigationBarItems(leading: menuButton, trailing: CalendarSettingButton)
//            .navigationBarItems(trailing: CalendarSettingButton)
//            .navigationBarItems(leading: menuButton)
        }
    }
    
    var CalendarSettingButton: some View {
        Menu {
//            Button(action: {}) {
//                Text("カレンダーを追加")
//                Image(systemName: "calendar.badge.plus")
//            }
//            Button(action: {}) {
//                Text("予定を追加")
//                Image(systemName: "plus")
//            }
//            Button(action: {}) {
//                Text("学年歴を追加")
//                Image(systemName: "calendar.badge.exclamationmark")
//            }
//            Button(action: {}) {
//                Text("就活カレンダーを追加")
//                Image(systemName: "calendar.badge.exclamationmark")
//            }
            Button(action: {}) {
                Text("TimeTableの使い方を見る")
                Image(systemName: "doc")
            }
        } label: {
            Image(systemName: "ellipsis")
                .foregroundColor(Color("TextColor"))
        }
    }
    
    var menuButton: some View {
        Button(action: {
            showingMenu.toggle()
        }, label: {
            Image(systemName: "text.alignleft")
                .foregroundColor(Color("TextColor"))
        }).sheet(isPresented: $showingMenu) {
            SettingTimeTableView(user: user)
        }
//            .halfSheet(showSheet: $showingMenu) {
//                SettingTimeTableView(user: user)
//            }
    }
}

//extension View {
//    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping ()->SheetView)->some View {
//        
//        return self
//            .background(
//                HalfSheetHelper(sheetView: sheetView(), showingSetting: showSheet)
//                )
//    }
//}
