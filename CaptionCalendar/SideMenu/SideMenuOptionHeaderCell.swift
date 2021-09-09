//
//  SideMenuOptionHeaderCell.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/09.
//

import SwiftUI

struct SideMenuOptionHeaderCell: View {
    let option: CalendarSettingViewModel
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: option.imageName)
                .font(.system(size: 20))
            Text(option.description)
                .font(.system(size: 15))
                .bold()
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width-90,height: 45)
        .foregroundColor(Color("TextColor"))
//        .background(Color.red)
    }
}
