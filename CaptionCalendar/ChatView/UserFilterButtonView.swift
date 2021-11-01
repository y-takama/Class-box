//
//  ClassChatFilterButtonView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/21.
//

import SwiftUI


enum UserFilterOptions: Int, CaseIterable {
    case follow
    case follower
    case bloak
    
    
    var title: String {
        switch self {
        case .follow: return "フォロー"
        case .follower: return "フォロワー"
        case .bloak: return "ブロック"
        }
    }
}

struct UserFilterButtonView: View {
    @Binding var selectedOption: UserFilterOptions
    
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(UserFilterOptions.allCases.count)
    
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(UserFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 5
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .bottom) {
                ForEach(UserFilterOptions.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                            .foregroundColor(selectedOption == option ? Color("TextColor") : .gray.opacity(0.7))
                            .font(.system(size: 13))
                            .bold()
                            .frame(width: underlineWidth - 8, alignment: .center)
                    })
                }
            }.frame(height: 30)
            
            Rectangle()
                .frame(width: underlineWidth - 10, height: 1, alignment: .center)
                .cornerRadius(0.5)
                .padding(.leading, padding)
        }.frame(width: getScreenBounds().width)
    }
}
