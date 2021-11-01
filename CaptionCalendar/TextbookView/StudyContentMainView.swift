//
//  StudyContentMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/18.
//

import SwiftUI

struct StudyContentMainView: View {
    //    @State var showQuestion = false
    @State var info: Textbook
    @State var currentTab = "1"
    @Namespace var animation
    @State private var showTextbook = false
    @StateObject var viewModel: StudyContentViewModel
    let user: User
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { proxytop in
                    HStack(spacing: 30) {
                        ForEach(viewModel.tabItems, id: \.self) { tab in
                            VStack(spacing: 7) {
                                Text(tab.tab!)
                                    .bold()
                                    .font(.system(size: 14))
                                    .foregroundColor(currentTab.replacingOccurrences(of: " SCROLL", with: "") == "\(tab.order!)" ? Color("TextColor") : .gray)
                                if currentTab.replacingOccurrences(of: " SCROLL", with: "") == "\(tab.order!)" {
                                    Capsule()
                                        .fill(Color("TextColor"))
                                        .matchedGeometryEffect(id: "TAB", in: animation)
                                        .frame(height: 1.5)
                                        .padding(.horizontal, -15)
                                } else {
                                    Capsule()
                                        .fill(.clear)
                                        .frame(height: 1)
                                        .padding(.horizontal, -10)
                                }
                            }.onTapGesture {
                                withAnimation() {
                                    currentTab = "\(tab.order!) TAP"
                                    proxytop.scrollTo(currentTab.replacingOccurrences(of: " TAP", with: ""), anchor: .topTrailing)
                                }
                            }
//                            Button(action: {
//
//                            }, label: {
//
//                            })
                        }
                    }.padding(.horizontal, 38)
                        .onChange(of: currentTab) { _ in
                            proxytop.scrollTo(currentTab.replacingOccurrences(of: " SCROLL", with: ""), anchor: .topTrailing)
        //                    if currentTab.contains(" SCROLL") {
        //                        withAnimation() {
        //
        //                        }
        //                    }
                        }
                }
            }
            .overlay(
                Divider().padding(.horizontal, -15)
                ,alignment: .bottom
            )
            
            ScrollView(.vertical, showsIndicators: false) {
                ScrollViewReader { proxy in
                    VStack {
                        ForEach(viewModel.tabItems, id: \.self) { tab in
                            VStack(spacing: 8) {
                                HStack {
                                    Text(tab.tab!)
//                                        .bold()
                                    Spacer()
                                }.padding(.horizontal, 15).padding(.top, 20)
                                ForEach(viewModel.contentName, id: \.self) { cources in
                                    if tab.tab! == cources.tab! {
                                        Button(action: {
                                            self.info = cources
                                            self.showTextbook = true
                                        }, label: {
                                            TextbookCourseCell(viewModel: TextbookCourseCellViewModel(textbook: cources), info: cources)
                                        })
                                        NavigationLink(destination: StudyContentQuestionView(info: info, showTextbook: $showTextbook, user: user), isActive: $showTextbook) {}
                                    }
                                }
                            }
                            .modifier(OffsetModifier(tab: tab, currentTab: $currentTab))
                            .id("\(tab.order!)")
                        }
                    }
                    .padding(.top, 10)
                    .onChange(of: currentTab) { newValue in
                        if currentTab.contains(" TAP") {
                            withAnimation() {
                                proxy.scrollTo(currentTab.replacingOccurrences(of: " TAP", with: ""), anchor: .topTrailing)
                            }
                        }
                    }
                }
                AdView(adUnitID: "ca-app-pub-6537638223494633/2619009695")
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.width*5/16)
                    .padding(.top, 400)
            }.coordinateSpace(name: "SCROLL")
        }
        .navigationTitle("")
    }
}


