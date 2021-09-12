//
//  SideMenuButtomView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/08.
//

import SwiftUI

struct SideMenuButtomView: View {
    @State private var showHelpView = false
    @State private var showInquiryView = false
    @State private var showReportView = false
    let user: User
    var body: some View {
        ForEach(SideMenuOption.allCases, id: \.self) { option in
            if option == .help {
                Button(action: { showHelpView.toggle() } ) {
                    SideMenuOptionCell(option: option)
                }
            }
            else if option == .inquiry {
                Button(action: { showInquiryView.toggle() } ) {
                    SideMenuOptionCell(option: option)
                }
            }
            else if option == .report {
                Button(action: { showReportView.toggle() } ) {
                    SideMenuOptionCell(option: option)
                }
            }
        }
        .fullScreenCover(isPresented: $showHelpView) {
            HelpView()
        }
        .fullScreenCover(isPresented: $showInquiryView) {
            InquiryView()
        }
        .fullScreenCover(isPresented: $showReportView) {
            ReportView(showReportView: $showReportView, user: user)
        }

    }
}
