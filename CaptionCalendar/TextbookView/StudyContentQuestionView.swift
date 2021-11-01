//
//  StudyContentQuestionView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/18.
//

import SwiftUI

struct StudyContentQuestionView: View {
    @State var info: Textbook
    @State private var showQuestion = false
    @Binding var showTextbook: Bool
    @ObservedObject var viewModel: StudyContentDetailViewModel
    let user: User
    
    init(info: Textbook, showTextbook: Binding<Bool>, user: User) {
        self.info = info
        self._showTextbook = showTextbook
        self.user = user
        viewModel = StudyContentDetailViewModel(detail: info)
    }
    
    var body: some View {
        VStack {
            ForEach(viewModel.contents, id: \.self) { courceinfo in
                NavigationLink(destination: StudyContenrDetaiView(showStudyView: $showTextbook, showQuestion: $showQuestion, content: info, user: user).navigationBarTitleDisplayMode(.inline), isActive: $showQuestion){
                    Button(action: {
//                    self.showTextbook = false
                    self.info = courceinfo
                    showQuestion = true
                }, label: {
                    TextbookQuestionCell(viewModel: TextbookQuestionCellViewModel(textbook: courceinfo), info: courceinfo)
                })}.isDetailLink(false)
            }
            Spacer()
        }
        .onAppear(perform: {
            viewModel.fetchContent()
        })
        .navigationTitle("")
        .padding(.top, 10)
        .navigationBarItems(trailing: chartButton)
    }
    
    var chartButton: some View {
        Button(action: {
//            withAnimation() {
//                showTimeTableSheet.toggle()
//            }
        }, label: {
            Image(systemName: "chart.xyaxis.line")
                .font(Font.system(size: 16, weight: .semibold))
        })
    }
}
