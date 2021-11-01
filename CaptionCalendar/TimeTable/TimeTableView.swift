//
//  TimeTableView.swift
//  TimeTableView
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI

struct TimeTableView: View {
    @State var isCreatingNewTimeTable = false
    @State var isShowingClass = false
//    @State var timetable = TimeTable(dictionary: [:])
    @State var dayOfWeek = "月"
    @State var timePeriod = "1"
    @StateObject private var viewModel = TimeTableClassViewModel()
    let user: User
    let dayofweek = ["月","火","水","木","金"]
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            VStack(spacing: 6) {
                HStack(spacing: 6) {
                    ForEach(0..<self.dayofweek.count){ index in
                        ZStack(alignment: .bottom) {
                            Rectangle()
                                .frame(width:width/6,height:25)
                                .foregroundColor(Color.clear)
                            Text(dayofweek[index])
                                .font(.system(size:10))
                        }
                    }
                    Spacer()
                }
                .padding(.leading, 32)
                
                ForEach(0..<6) { num in
                    HStack(spacing: 6) {
//                        let j = 0
                        Text("\(num+1)")
                            .frame(width: 20)
                            .padding(.leading, 6)
                        ForEach(0..<self.dayofweek.count){ index in
                            ZStack {
                                Button(action: {
                                    isCreatingNewTimeTable.toggle()
                                    dayOfWeek = dayofweek[index]
                                    timePeriod = "\(num+1)"
                                }, label: {
                                    ZStack {
                                        Rectangle()
                                            .frame(width:width/6,height:80)
                                            .foregroundColor(Color.clear)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color("TextColor").opacity(0.2), lineWidth: 0.5)
                                            )
                                            .shadow(color: .gray.opacity(0.4), radius: 2, x: 0.5, y: 0.5)
                                        VStack {
                                            Text("\(dayofweek[index])\(num+1)")
                                                .foregroundColor(Color("TextColor"))
                                                .opacity(0.2)
                                        }
                                    }
                                })
                                ForEach(viewModel.timetable, id: \.self) { classes in
                                    let timetablecell = dayofweek[index] + "\(num+1)"
                                    if classes.timetables!.contains(timetablecell) {
                                        NavigationLink(destination: SelectedClassDetailView(viewModel: ClassDetailViewModel(classId: classes, timetable: timetablecell),classes: classes,user: user) , label: {
                                            ZStack {
                                                Rectangle()
                                                    .frame(width:width/6,height:80)
                                                    .foregroundColor(Color(classes.color!))
                                                    .cornerRadius(5)
                                                
                                                VStack(spacing: 0) {
                                                    Spacer()
                                                    Text(classes.courseName)
                                                        .bold()
                                                        .font(.system(size: 13))
                                                        .frame(width: width/6-5,
                                                               height: 45)
                                                        .shadow(color: Color("TintColor").opacity(0.5), radius: 2, x: 0.5, y: 0.5)
                                                    
                                                    Text(classes.roomLocation!)
                                                        .bold()
                                                        .font(.system(size: 11))
                                                        .frame(width: width/6-5,
                                                               height: 30)
                                                        .padding(.bottom, 5)
                                                        .shadow(color: Color("TintColor").opacity(0.5), radius: 2, x: 0.5, y: 0.5)
                                                    
                                                }.frame(height: 80)
                                                .foregroundColor(Color("TextColor"))}
                                            
                                        })
                                    } else {
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
            if viewModel.loading {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("TintColor").opacity(0.01))
//                    if viewModel.showloading {
//                        ProgressView()
//                            .progressViewStyle(CircularProgressViewStyle(tint: Color("TextColor")))
//                            .scaleEffect(1)
//                    }
                }
            }
        }
        .onAppear() {
            self.viewModel.fetchTimeTable()
        }
        NavigationLink(destination: SearchClassView(dayOfWeek: $dayOfWeek,
                                                    timePeriod: $timePeriod,
                                                    isPresented: $isCreatingNewTimeTable,
                                                    viewModel: SearchTimetableViewModel(timetables: "\(dayOfWeek)\(timePeriod)",campus: viewModel.university.whereFieldCampus!),
                                                    user: user),
                       isActive: $isCreatingNewTimeTable) {
        }
    }
}
