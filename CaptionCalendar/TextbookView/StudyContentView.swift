//
//  StudyContentView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/17.
//

import SwiftUI

struct StudyContentView: View {
    
    @State var cource: Textbook
    let user: User
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TabView {
                StudyContentMainView(info: cource,
                                     viewModel: StudyContentViewModel(content: cource),
                                     user: user)
                    
                StudyExplanationView(viewModel: StudyContentViewModel(content: cource), cource: cource)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }
    }
}

