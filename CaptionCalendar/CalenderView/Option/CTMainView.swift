//
//  CTMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/11/05.
//

import SwiftUI

struct CTMainView: View {
    @StateObject private var viewModel = TimeTableClassViewModel()
    let user: User
    let dayofweek = ["日","月","火","水","木","金","土"]
    var body: some View {
        VStack(spacing: 3) {
            ForEach(0..<6) { num in
                HStack(spacing: 0) {
                    ForEach(0..<7){ index in
                        VStack(spacing: 3) {
                            ZStack {
                                Rectangle()
                                    .fill(.clear)
                                    .frame(width: getScreenBounds().width/7-3, height: 18)
                                ForEach(viewModel.timetable, id: \.self) { classes in
                                    let timetablecell = dayofweek[index] + "\(num+1)"
                                    if classes.timetables!.contains(timetablecell) {
                                        NavigationLink(destination: SelectedClassDetailView(viewModel: ClassDetailViewModel(classId: classes, timetable: timetablecell),classes: classes,user: user) , label: {
                                            Text(classes.courseName)
                                                .bold()
                                                .font(.system(size:12))
                                                .lineLimit(2)
                                                .padding(2)
                                                .frame(width: getScreenBounds().width/7-3, height: 18)
                                                .background(Color(classes.color!))
                                                .cornerRadius(2)
                                                .clipped()
                                        })
                                    }
                                    
                                }
                            }
                        }.frame(width:getScreenBounds().width/7, alignment: .center)
                    }
                }
            }
        }.padding(.top, 6)
            .onAppear() {
                self.viewModel.fetchTimeTable()
            }
    }
}
