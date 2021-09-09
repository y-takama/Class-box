//
//  SideMenuOptionCell.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/08.
//

import SwiftUI

struct SideMenuOptionCell: View {
    let option: SideMenuOption
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: option.imageName)
                .font(.system(size: 20))
                .frame(width: 24)
            Text(option.description)
                .font(.system(size: 15))
                .bold()
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width-90,height: 45)
        .foregroundColor(option.description == "Notification" || option.description == "Remindar" || option.description == "WorkPlace" ? Color.gray : Color("TextColor"))
//        .background(Color.red)
    }
}
