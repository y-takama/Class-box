//
//  ReportBottomView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/09.
//

import SwiftUI

struct ReportBottomView: View {
    @Binding var showReportView: Bool
    let user: User
    var body: some View {
        VStack(spacing: 0) {
            ForEach(SideMenuOption.allCases, id: \.self) { option in
                if option == .classbox {
                    NavigationLink(
                        destination: ReportSendView(showReportView: $showReportView, option: option, user: user),
                        label: {
                            SideMenuOptionCell(option: option)
                        })
                }
                else if option == .userreport {
                    NavigationLink(
                        destination: ReportSendView(showReportView: $showReportView, option: option, user: user),
                        label: {
                            SideMenuOptionCell(option: option)
                        })
                }
                else if option == .other {
                    NavigationLink(
                        destination: ReportSendView(showReportView: $showReportView, option: option, user: user),
                        label: {
                            SideMenuOptionCell(option: option)
                        })
                }
            }
        }
    }
}
