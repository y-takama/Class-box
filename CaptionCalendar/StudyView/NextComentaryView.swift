//
//  NextComentaryView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/20.
//

import SwiftUI

struct NextComentaryView: View {
    @State private var isShowingNext = false
    @State private var isShowingNextPart = false
    @State private var isShowingReportView = false
    @Binding var answer1: Int
    @Binding var answer2: Int
    @Binding var showStudyView: Bool
    @ObservedObject var viewModel: StudyNextContentView
    let content: Study
    let user: User
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 20) {
                        Text("問1").frame(width: 30)
                        if viewModel.detail.answer1! - 1 == answer1 {
                            Text("正解").bold()
                        } else {
                            Text("不正解").bold()
                        }
                        Spacer()
                    }
                    if answer2 != 10 {
                        HStack(spacing: 20) {
                            Text("問2").frame(width: 30)
                            if viewModel.detail.answer2! - 1 == answer2 {
                                Text("正解").bold()
                            } else {
                                Text("不正解").bold()
                            }
                            Spacer()
                        }
                    }
                    Divider()
                    Text("解説")
                }.padding()
                
            }
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("後で確認する")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color("TextColor"))
                        .frame(width: getScreenBounds().width/3, height: 50)
                        .background(Color("TintColor"))
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("TextColor"), lineWidth: 0.5)
                        )
                        .padding(.horizontal)
                })
                Spacer()
                if viewModel.detail.nextID! == "" {
                    Button(action: {
                        isShowingNextPart.toggle()
                    }, label: {
                        Text("次の章へ")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color("TintColor"))
                            .frame(width: getScreenBounds().width/3, height: 50)
                            .background(Color("TextColor"))
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                            .padding(.horizontal)
                    })
                } else {
                    Button(action: {
                        isShowingNext.toggle()
                    }, label: {
                        Text("次へ")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color("TintColor"))
                            .frame(width: getScreenBounds().width/3, height: 50)
                            .background(Color("TextColor"))
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                            .padding(.horizontal)
                    })
                }
                Spacer()
            }.padding()
            VStack {
                Spacer()
                ZStack {
                    StudyReportView(showMenu: $isShowingReportView, user: user)
                        .offset(y: self.isShowingReportView ? 0 : UIScreen.main.bounds.height)
                }
            }
            .background((self.isShowingReportView  ? Color("TextColor").opacity(0.2) : Color.clear)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                self.isShowingReportView = false
            })
            .ignoresSafeArea(edges: .bottom)
            .animation(.default)
        }.navigationBarItems(trailing: reportButton)
        NavigationLink(destination: NextQuestionView(showStudyView: $showStudyView, viewModel: StudyNextContentView(detail: content), content: content, user: user).navigationBarBackButtonHidden(true), isActive: $isShowingNext) {
        }
        NavigationLink(destination: StudyContentMainView(showStudyView: $showStudyView, showButton: $isShowingNextPart, viewModel: StudyContentViewModel(content: content), cource: content, user: user).navigationBarBackButtonHidden(true), isActive: $isShowingNextPart) {
        }
    }
    var reportButton: some View {
        Button(action: {
            isShowingReportView.toggle()
        }, label: {
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(Color("TextColor"))
        })
    }
}
