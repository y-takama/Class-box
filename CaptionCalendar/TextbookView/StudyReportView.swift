//
//  StudyReportView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/22.
//

import SwiftUI

struct StudyReportView: View {
    @State private var isShowAlert = false
    @State private var showReportView = false
    @Binding var showMenu: Bool
    let user: User
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(MenuOption.allCases, id: \.self) { option in
                if option == .report {
                    Button(action: {
                        showReportView.toggle()
                    }, label: {
                        SideMenuOptionCell(option: option)
                    })
                    NavigationLink(destination: StudyReportSendView(showReportView: $showReportView, showMenu: $showMenu, option: option, user: user), isActive: $showReportView) {}
//                    NavigationLink(isActive: $showReportView,
//                                   destination: {}) {}
                }
            }
        }
        .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.top, 20)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color("TintColor"))
        .cornerRadius(25)
        .alert(isPresented: $isShowAlert) {
            Alert(title: Text(""), message: Text("次回アップデート予定です。アップデートをお待ちください。"), dismissButton: .destructive(Text("OK")))
        }
    }
}

