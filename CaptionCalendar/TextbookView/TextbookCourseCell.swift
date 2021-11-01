//
//  TextbookCourseCell.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/13.
//

import SwiftUI

struct TextbookCourseCell: View {
    @StateObject var viewModel: TextbookCourseCellViewModel
    let info: Textbook
    var body: some View {
        HStack {
            Text("\(info.order!)")
                .font(.system(size: 13))
                .frame(width: 36, height: 36)
            VStack {
                HStack {
                    Text(info.title!)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color("TextColor"))
                    Spacer()
                }.frame(height: 18)
                if info.question_count! == 0 {
                    Text("準備中")
                        .font(.system(size: 12))
                        .foregroundColor(.gray).opacity(0.5)
                } else {
                    ZStack {
                        HStack {
                            ForEach(0..<info.question_count! ) { i in
                                Image(systemName: "circle")
                                    .foregroundColor(Color.gray).opacity(0.5)
                                    .font(.system(size: 13))
                            }
                            Spacer()
                        }.frame(height: 14)
                        HStack {
                            ForEach(viewModel.course) { cources in
                                Image(systemName: "checkmark.circle")
                                    .font(.system(size: 13))
                            }
                            Spacer()
                        }.frame(height: 14)
                    }
                }
                
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        
    }
}
