//
//  SideMenuOptionGrayCell.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/11.
//

import SwiftUI

struct SideMenuOptionGrayCell: View {
    let option: MenuOption
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
        .foregroundColor(Color.gray)
    }
}
