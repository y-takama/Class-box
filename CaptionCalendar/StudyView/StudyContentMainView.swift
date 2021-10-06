//
//  StudyContentMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/18.
//

import SwiftUI

struct StudyContentMainView: View {
    @State var showMainView = false
    @Binding var showStudyView: Bool
    @Binding var showButton: Bool
    @ObservedObject var viewModel: StudyContentViewModel
    let cource: Study
    let user: User
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.contentName, id: \.self) { cources in
                    NavigationLink(destination: StudyContentQuestionView(showStudyView: $showStudyView, viewModel: StudyContentDetailViewModel(detail: cources), cource: cources, user: user).navigationBarTitleDisplayMode(.inline), label: {
                        HStack {
                            Text(cources.header!)
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
                        .padding(.vertical, 3)
                    })
                    NavigationLink(destination: StudyMainView(showStudyView: $showStudyView, user: user).navigationBarBackButtonHidden(true), isActive: $showMainView) {}
                    //                    NavigationLink(destination: StudyContentMainView(viewModel: StudyContentViewModel(content: cources), cource: cources, user: user).navigationBarBackButtonHidden(true), isActive: $showMainView) {}
                    //                    Spacer()
                }
            }.padding(.top, 10)
            
        }.navigationBarItems(trailing: showButton ? mainMenuButton : nil)
        
        
    }
    var mainMenuButton: some View {
        Button(action: {
            showMainView.toggle()
        }, label: {
            Image(systemName: "square.grid.2x2")
        })
    }
}

