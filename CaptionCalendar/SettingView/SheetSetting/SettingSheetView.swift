//
//  CalendarSettingView.swift
//  CalendarSettingView
//
//  Created by 髙間洋平 on 2021/08/19.
//

import SwiftUI

struct SettingSheetView: View {
    let option: CalendarSettingViewModel
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: option.imageName)
                .font(.system(size: 20))
            Text(option.description)
                .font(.system(size: 15))
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width-40,height: 45)
        .foregroundColor(Color("TextColor"))
//        .background(Color.red)
    }
}
