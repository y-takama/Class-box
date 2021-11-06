//
//  SettingModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/11/05.
//

import SwiftUI

class SettingModel: ObservableObject {
    @Published var ctsetting: Setting
    @Published var crsetting: Setting
    @Published var ts6setting: Setting
    
    init(setting: Setting) {
        self.ctsetting = setting
        self.crsetting = setting
        self.ts6setting = setting
        fetchCalendarTimetablesSetting()
        fetchCalendarReminderSetting()
        fetchTimetableShow6thPeriodSetting()
    }
    
    
    func fetchCalendarTimetablesSetting() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("setting").document("calendar_timetables")
        docRef.getDocument { snapshot, _ in
            let classinfo = snapshot.map({ Setting(dictionary: $0.data() ?? [:])})
            self.ctsetting = classinfo!
        }
    }
    func fetchCalendarReminderSetting() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("setting").document("calendar_reminder")
        docRef.getDocument { snapshot, _ in
            let classinfo = snapshot.map({ Setting(dictionary: $0.data() ?? [:])})
            self.crsetting = classinfo!
        }
    }
    func fetchTimetableShow6thPeriodSetting() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("setting").document("timatable_show_6thperiod")
        docRef.getDocument { snapshot, _ in
            let classinfo = snapshot.map({ Setting(dictionary: $0.data() ?? [:])})
            self.crsetting = classinfo!
        }
    }
}
