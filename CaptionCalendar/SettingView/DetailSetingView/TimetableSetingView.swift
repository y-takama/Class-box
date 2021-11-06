//
//  TimetableSetingView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/20.
//

import SwiftUI

struct TimetableSetingView: View {
    @Binding var showTimetableSetting: Bool
    @ObservedObject var setting = SettingModel(setting: Setting(dictionary: [:]))
    let user: User
    
    var body: some View {
        VStack(spacing: 15) {
            Rectangle()
                .fill(.gray)
                .frame(width: 80, height: 6)
                .cornerRadius(3)
                .clipped()
            
            HStack(spacing: 16) {
                Image(systemName: "square.grid.3x3.topleft.filled")
                    .font(.system(size: 18))
                    .frame(width: 25, alignment: .leading)
                Text("6限を表示する")
                    .font(.system(size: 15))
                    .bold()
                    .frame(width: getScreenBounds().width - 170, alignment: .leading)
                Toggle("", isOn: $setting.ctsetting.timatable_show_6thperiod)
                    .onChange(of: setting.ctsetting.timatable_show_6thperiod) { _ in
                        if showTimetableSetting {
                            changetimetable()
                        }
                    }
                .frame(alignment: .trailing)
            }
            .frame(width: getScreenBounds().width-50)
            .padding(.top, 20)
            
            HStack(spacing: 16) {
                Image(systemName: "person")
                    .font(.system(size: 18))
                    .frame(width: 25)
                Text("Reminderを表示する")
                    .font(.system(size: 15))
                    .bold()
                    .frame(width: getScreenBounds().width - 170, alignment: .leading)
                Toggle(isOn: $setting.crsetting.calendar_reminder) {
                }.frame(alignment: .trailing)
            }.frame(width: getScreenBounds().width-50)
        }
        .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.top, 20)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color("TintColor"))
        .cornerRadius(25)
//        .onAppear() {
//            setting.fetchCalendarTimetablesSetting()
//        }
    }
    func changetimetable() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        COLLECTION_USERS.document(user.uid!).collection("setting").document("timatable_show_6thperiod").setData(["timatable_show_6thperiod": setting.ctsetting.timatable_show_6thperiod]) { _ in
//            setting.fetchCalendarTimetablesSetting()
            print("ggggggggggg")
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            self.showTimeTableSheet = false
//        }
    }
}
