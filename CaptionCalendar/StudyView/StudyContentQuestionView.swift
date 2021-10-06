//
//  StudyContentQuestionView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/18.
//

import SwiftUI

struct StudyContentQuestionView: View {
    @Binding var showStudyView: Bool
    @ObservedObject var viewModel: StudyContentDetailViewModel
    let cource: Study
    let user: User
    var body: some View {
        VStack {
            ForEach(viewModel.contents, id: \.self) { courceinfo in
                NavigationLink(destination: StudyContenrDetaiView(showStudyView: $showStudyView, content: courceinfo, user: user)
                                .navigationBarTitleDisplayMode(.inline), label: {
                    HStack {
                        Text("\(courceinfo.order!)")
                            .font(.system(size: 15, weight: .semibold))
                            .frame(width: 36, height: 36)
                            .padding(5)
                            .clipShape(Circle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 23)
                                    .stroke(Color.gray, lineWidth: 0.3)
                            )
                            .padding(.trailing)
                        VStack {
                            HStack {
                                Text(courceinfo.title!)
                                    .font(.system(size: 15, weight: .semibold))
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                if courceinfo.choice2_1 == "" {
                                    Text("全1問")
                                } else {
                                    Text("全2問")
                                }
                                Text("/")
                                Text("\(courceinfo.timer!) seconds")
                            }.foregroundColor(.primary).font(.caption)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .foregroundColor(Color("TextColor"))
                })
//                Spacer()
            }
            Spacer()
        }.padding(.top, 10)
        
    }
}
