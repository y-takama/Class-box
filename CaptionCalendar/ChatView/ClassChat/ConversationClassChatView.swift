//
//  ConversationClassChatView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/29.
//

import SwiftUI

struct ConversationClassChatView: View {
    let user: User
    @ObservedObject var viewModel = ConversationClassViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {
                    HStack {
                        ForEach(viewModel.timetable, id: \.self) { classes in
                            NavigationLink(destination:
                                            ClassChatView(user: user, classinfo: classes)
                                           //                                    UnfinishedView()
                                           , label: {
                                let classvalues = classes.courseName
                                let start = String(classvalues.prefix(2))
                                //                            ForEach(viewModel.classchat, id: \.self) { classchat in
                                //                                ZStack {
                                //
                                //                                }
                                //                            }
                                VStack(spacing: 3) {
                                    Text(start)
                                        .font(.system(size: 15, weight: .semibold))
                                        .frame(width: 42, height: 42)
                                        .padding(5)
                                        .clipShape(Circle())
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(Color.gray, lineWidth: 0.3)
                                        )
                                        .foregroundColor(Color("TextColor"))
                                        .padding(.top, 5)
                                    Text(classvalues)
                                        .font(.system(size: 9))
                                        .lineLimit(2)
                                    Spacer()
                                }.frame(width: 58)
                            })
                        }
                    }.padding(.leading)
                    if viewModel.loading {
                        ZStack {
                            Color("TintColor").frame(width: getScreenBounds().width,
                                                     height: 90)
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color("TextColor")))
                                .scaleEffect(1)
                        }
                    }
                }
            }.frame(width: getScreenBounds().width, height: 95)
            Divider()
        }
    }
}
