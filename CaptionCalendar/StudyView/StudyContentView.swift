//
//  StudyContentView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/17.
//

import SwiftUI

struct StudyContentView: View {
    @Binding var showStudyView: Bool
    @State var showButton = false
    let cource: Study
    let user: User
    var body: some View {
        ZStack(alignment: .topLeading) {
            TabView {
                StudyContentMainView(showStudyView: $showStudyView, showButton: $showButton, viewModel: StudyContentViewModel(content: cource), cource: cource, user: user)
                    
                StudyExplanationView(viewModel: StudyContentViewModel(content: cource), cource: cource)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }
        
    }
}

