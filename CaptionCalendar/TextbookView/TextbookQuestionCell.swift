//
//  TextbookQuestionCell.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/13.
//

import SwiftUI

struct TextbookQuestionCell: View {
    @ObservedObject var viewModel: TextbookQuestionCellViewModel
    let info: Textbook
    var body: some View {
        HStack {
//            ZStack {
//                if viewModel.textbook.questionID! == "" {
//                    Circle()
//                        .trim(from: 0, to: 1)
//                        .stroke(Color("CaptionColor"), style: StrokeStyle(lineWidth: 4, lineCap: .round))
//                        .frame(width: 54, height: 54)
//                }
//                Text("\(info.order!)")
//                    .font(.system(size: 15, weight: .semibold))
//                    .frame(width: 36, height: 36)
//                    .padding(5)
//                    .clipShape(Circle())
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 23)
//                            .stroke(Color.gray, lineWidth: 0.3)
//                    )
//            }
//            .frame(width: 54, height: 54)
//            .padding(.trailing)
            
            Text("\(info.order!)")
                .font(.system(size: 15, weight: .semibold))
                .frame(width: 36, height: 36)
                .padding(5)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 23)
                        .stroke(Color.gray, lineWidth: 0.3)
                )
                .padding(.trailing)
            
            VStack(spacing: 8) {
                HStack {
                    Text(info.title!)
                        .font(.system(size: 15, weight: .semibold))
                    Spacer()
                }
                
                HStack {
                    Group {
                        if viewModel.textbook.useranswer1! {
                            Image(systemName: "star.fill")
                                .font(.system(size: 12))
                                .foregroundColor(Color.yellow)
                        } else if viewModel.textbook.questionID! != "" {
                            Image(systemName: "star.leadinghalf.filled")
                                .foregroundColor(Color.gray)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                        if info.answer2! != 0 {
                            if viewModel.textbook.useranswer2! {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.yellow)
                            } else if viewModel.textbook.questionID! != "" {
                                Image(systemName: "star.leadinghalf.filled")
                                    .foregroundColor(Color.gray)
                            } else {
                                Image(systemName: "star")
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }.font(.system(size: 14))
                    
                    
                    Spacer()
                    if info.choice2_1 == "" {
                        Text("全1問")
                    } else {
                        Text("全2問")
                    }
                    Text("/")
                    Text("\(info.timer!) seconds")
                }
                .foregroundColor(.primary).font(.caption)
                .padding(.top, 1)
            }
            Spacer()
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
        .foregroundColor(Color("TextColor"))
    }
}
