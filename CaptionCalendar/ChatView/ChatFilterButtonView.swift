//
//  ChatFilterButtonView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/21.
//

import SwiftUI

enum ChatFilterOptions: Int, CaseIterable {
    case main
    case request
//    case likes
    
    var title: String {
        switch self {
        case .main: return "メイン"
        case .request: return "リクエスト"
//        case .likes: return "Likes"
        }
    }
}

struct ChatFilterButtonView: View {
    @Binding var selectedOption: ChatFilterOptions
    @ObservedObject var viewModel = RequestViewModel()
    
    
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(ChatFilterOptions.allCases.count)
    
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(ChatFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 5
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .bottom) {
                ForEach(ChatFilterOptions.allCases, id: \.self) { option in
                    Button(action: {
                        withAnimation(.easeInOut) {
                            self.selectedOption = option
                        }
                    }, label: {
                        ZStack {
                            Text(option.title)
                                .foregroundColor(selectedOption == option ? Color("TextColor") : .gray.opacity(0.7))
                                .font(.system(size: 13))
                                .bold()
                                
                            if viewModel.conts.count != 0 && option.title == "リクエスト" {
                                Text("\(viewModel.conts.count)")
                                    .bold()
                                    .font(.system(size: 11))
                                    .frame(width: 16, height: 16, alignment: .center)
                                    .foregroundColor(Color("TintColor"))
                                    .padding(1)
                                    .background(Color.red)
                                    .cornerRadius(9)
                                    .frame(width: underlineWidth/2 + 30, alignment: .trailing)
                            }
                        }.frame(width: underlineWidth - 8, height: 20)
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
