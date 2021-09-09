//
//  ReportHeaderView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/09.
//

import SwiftUI

struct ReportHeaderView: View {
    var body: some View {
        VStack(spacing: 0) {
            ForEach(SideMenuOption.allCases, id: \.self) { option in
                if option == .calendar {
                    NavigationLink(
                        destination: SettingView(),
                        label: {
                            SideMenuOptionCell(option: option)
                        })
                }
                else if option == .calendarList {
                    NavigationLink(
                        destination: SettingView(),
                        label: {
                            SideMenuOptionCell(option: option)
                        })
                }
                else if option == .timeTable {
                    NavigationLink(
                        destination: SettingView(),
                        label: {
                            SideMenuOptionCell(option: option)
                        })
                }
                else if option == .chat {
                    NavigationLink(
                        destination: SettingView(),
                        label: {
                            SideMenuOptionCell(option: option)
                        })
                }
                else if option == .news {
                    NavigationLink(
                        destination: SettingView(),
                        label: {
                            SideMenuOptionCell(option: option)
                        })
                }
                else if option == .notification {
                    Button(action: {  } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
                else if option == .workPlace {
                    Button(action: {  } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
                else if option == .reminder {
                    Button(action: {  } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
            }
        }
    }
}

struct ReportHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ReportHeaderView()
    }
}
