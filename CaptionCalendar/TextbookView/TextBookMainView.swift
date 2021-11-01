//
//  StudyMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/17.
//

import SwiftUI

struct TextBookMainView: View {
    @Binding var showStudyView: Bool
    @ObservedObject var viewModel = StudyCourseViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let user: User
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                ForEach(viewModel.textbookName, id: \.self) { courcename in
//                    NavigationLink(destination: StudyContentView(showStudyView: $showStudyView, cource: courcename, user: user), label: {
//                        VStack(alignment: .leading) {
//                            Image(courcename.imageName!)
//                                .resizable()
//                                .frame(width: getScreenBounds().width/2-20,
//                                       height: (getScreenBounds().width/2-20)*9/16,
//                                       alignment: .center)
//                                .cornerRadius(10)
//                                .clipped()
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color("TextColor"), lineWidth: 0.2)
//                                )
//                            Text(courcename.textbookName!)
//                                .font(.system(size: 15, weight: .semibold))
//                                .foregroundColor(Color("TextColor"))
//                                .padding(.horizontal, 8)
//                        }
//                        .frame(width: getScreenBounds().width/2)
//                    })
                }
            }
            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.top)
        .navigationBarItems(trailing: backButton)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Cource Name")
        
    }
    var backButton: some View {
        Button(action: {
            showStudyView.toggle()
        }, label: {
            Image(systemName: "chevron.down")
                .foregroundColor(Color("TextColor"))
        })
    }
}
