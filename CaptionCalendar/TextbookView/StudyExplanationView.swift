//
//  StudyExplanationView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/17.
//

import SwiftUI

struct StudyExplanationView: View {
    @ObservedObject var viewModel: StudyContentViewModel
    let cource: Textbook
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(cource.imageName!)
                .resizable()
                .frame(width: getScreenBounds().width,
                       height: getScreenBounds().width*9/16)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color("TextColor"), lineWidth: 0.2)
//                )
            Divider()
                
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text(cource.title!).font(.title).fontWeight(.heavy)
                    Text(cource.tab!).font(.headline)
                    Text(cource.headerContents!)
                }.padding(.vertical)
            }.padding(.horizontal)
        }
        
    }
}
