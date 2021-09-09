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
            ReportView()
        }

    }
}

struct SideMenuButtomView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuButtomView()
    }
}
