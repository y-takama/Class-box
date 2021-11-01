//
//  AdminQuestionView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/19.
//

import SwiftUI

struct AdminQuestionView: View {
    @ObservedObject var viewModel: StudyContentDetailViewModel
    @State private var addQuestion = false
    @State private var showStudyView = false
    let cource: Textbook
    let user: User
    var body: some View {
        RefreshableScrollView(content: {
            VStack {
                ForEach(viewModel.contents, id: \.self) { courceinfo in
                    NavigationLink(destination: StudyContenrDetaiView(showStudyView: $showStudyView, showQuestion: $showStudyView, content: courceinfo, user: user)
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
                                Text(courceinfo.title!)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        .foregroundColor(Color("TextColor"))
                    })
                }
                Spacer()
            }.padding(.top)
            
        }, onRefresh: { control in
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                viewModel.fetchContent()
                control.endRefreshing()
            }
        })
            .navigationBarItems(trailing: addButton)
            .sheet(isPresented: $addQuestion) {
                AddQuestionView(addCource: $addQuestion, cource: cource)
            }
    }
    var addButton: some View {
        Button(action: {
            addQuestion.toggle()
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus")
                .foregroundColor(Color("TextColor"))
        })
    }
}
