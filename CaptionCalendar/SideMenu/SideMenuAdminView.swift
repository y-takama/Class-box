//
//  SideMenuAdminView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/12.
//

import SwiftUI

struct SideMenuAdminView: View {
    @State private var showAdminView = false
    let user: User
    var body: some View {
        VStack(spacing: 0) {
            ForEach(MenuOption.allCases, id: \.self) { option in
                if option == .admin {
                    Button(action: { showAdminView.toggle() } ) {
                        SideMenuOptionCell(option: option)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showAdminView) {
            AdminMainView(user: user)
        }
        
    }
}
