//
//  CalendarSettingView.swift
//  CalendarSettingView
//
//  Created by 髙間洋平 on 2021/08/19.
//

import SwiftUI

struct SettingSheetCell: View {
    let option: SettingViewModel
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: option.imageName)
                .font(.system(size: 18))
                .frame(width: 25)
            Text(option.description)
                .font(.system(size: 15))
                .bold()
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width-50,height: 45)
    }
}

