//
//  AdminStudyView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/17.
//

import SwiftUI

struct AdminStudyView: View {
    @ObservedObject var viewModel: StudyContentViewModel
    @State private var addCource = false
    let cource: Textbook
    let user: User
    var body: some View {
        RefreshableScrollView(content: {
            VStack(spacing: 8) {
                ForEach(viewModel.contentName, id: \.self) { cources in
                    NavigationLink(destination: AdminQuestionView(viewModel: StudyContentDetailViewModel(detail: cources), cource: cources, user: user).navigationBarTitleDisplayMode(.inline), label: {
                        HStack {
                            Text(cources.tab!)
                                .font(.system(size: 15, weight: .semibold))
                                .frame(width: 36, height: 36)
                                .padding(5)
                                .clipShape(Circle())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 23)
                                        .stroke(Color.gray, lineWidth: 0.3)
                                )
                                .foregroundColor(Color("TextColor"))
                            
                            Text(cources.title!)
                                .foregroundColor(Color("TextColor"))
                            Spacer()
                        }
                        .padding(.horizontal)
                    })
                    
                }
            }.padding(.top)
            Spacer()
        }, onRefresh: { control in
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                viewModel.fetchContent()
                control.endRefreshing()
            }
        })
//        ScrollView {
//            VStack {
//                ForEach(viewModel.contentName, id: \.self) { cources in
//                    NavigationLink(destination: StudyContentQuestionView(viewModel: StudyContentDetailViewModel(detail: cources), cource: cources).navigationBarTitleDisplayMode(.inline), label: {
//                        HStack {
//                            Text(cources.header!)
//                                .font(.system(size: 15, weight: .semibold))
//                                .frame(width: 36, height: 36)
//                                .padding(5)
//                                .clipShape(Circle())
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 23)
//                                        .stroke(Color.gray, lineWidth: 0.3)
//                                )
//                                .foregroundColor(Color("TextColor"))
//
//                            Text(cources.title!)
//                                .foregroundColor(Color("TextColor"))
//                            Spacer()
//                        }
//                        .padding(.horizontal)
//                    })
//                    Spacer()
//                }
//            }.padding(.top)
//
//        }
        .navigationBarItems(trailing: addButton)
        .sheet(isPresented: $addCource) {
            AddCourceView(addCource: $addCource, cource: cource)
        }
    }
    var addButton: some View {
        Button(action: {
            addCource.toggle()
        }, label: {
            Image(systemName: "plus.rectangle.on.folder")
                .foregroundColor(Color("TextColor"))
        })
    }
}
