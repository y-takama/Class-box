//
//  TimetableTextbookView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/12.
//

import SwiftUI

struct TimetableTextbookView: View {
    @State var showTextbookView = false
    @StateObject var viewModel = StudyCourseViewModel()
    let user: User
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.textbookName, id: \.self) { info in
                    NavigationLink(destination: StudyContentMainView(info: info, viewModel: StudyContentViewModel(content: info), user: user), label: {
                        VStack(alignment: .leading) {
                            Image(info.imageName!)
                                .resizable()
                                .frame(width: getScreenBounds().width/3,
                                       height: (getScreenBounds().width/3)*9/16,
                                       alignment: .center)
                                .cornerRadius(10)
                                .clipped()
                                .shadow(color: .gray.opacity(0.5), radius: 3, x: 0.5, y: 0.5)
                                .padding(9)
                                .padding(.leading)
                        }
                    })
                }
            }
        }
        .frame(height: (getScreenBounds().width/3)*9/16 + 18)
    }
}
