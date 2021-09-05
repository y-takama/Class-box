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
    @State var dayOfWeek = ""
    @State var timePeriod = ""
    @ObservedObject var viewModel = SearchClassViewModel()
    let user: User
    let dayofweek = ["月","火","水","木","金"]
    let width = UIScreen.main.bounds.width
    var body: some View {
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
            }.padding(.leading, width/6 - 40)
            
            //j=0
            HStack(spacing: 6) {
                let j = 0
                Text("\(j+1)")
                    .frame(width: width/6 - 40)
                ForEach(0..<self.dayofweek.count){ index in
                    ZStack {
                        Button(action: {
                            isCreatingNewTimeTable.toggle()
                            dayOfWeek = dayofweek[index]
                            timePeriod = "\(j+1)"
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width:width/6,height:80)
                                    .foregroundColor(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color("TextColor").opacity(0.2), lineWidth: 0.5)
                                    )
                                VStack {
                                    Text("\(dayofweek[index])\(j+1)")
                                        .foregroundColor(Color("TextColor"))
                                        .opacity(0.2)
                                }
                            }
                        })
                        ForEach(viewModel.timeTable, id: \.self) { classes in
                            let timetablecell = dayofweek[index] + "1"
                            if classes.timetables! == timetablecell {
                                NavigationLink(destination:
                                    SelectedClasDetailView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes), classes: classes, user: user)
                                , label: {
                                    ZStack {
                                        ClassColorView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes))
                                        VStack {
                                            Spacer()
                                            Text(classes.courseName)
                                                .bold()
                                                .font(.system(size: 14))
                                                .frame(width: width/6-10,
                                                       height: 40)
                                            
                                            Text(classes.roomLocation!)
                                                .bold()
                                                .font(.system(size: 11))
                                                .frame(width: width/6-10,
                                                       height: 20)
                                        }.foregroundColor(Color("TextColor"))
                                    }
                                })
                            } else {
                            }
                        }
                    }
                }
            }
            
            
            //j=1
            HStack(spacing: 6) {
                let j = 1
                Text("\(j+1)")
                    .frame(width: width/6 - 40)
                ForEach(0..<self.dayofweek.count){ index in
                    ZStack {
                        Button(action: {
                            isCreatingNewTimeTable.toggle()
                            dayOfWeek = dayofweek[index]
                            timePeriod = "\(j+1)"
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width:width/6,height:80)
                                    .foregroundColor(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color("TextColor").opacity(0.2), lineWidth: 0.5)
                                    )
                                VStack {
                                    Text("\(dayofweek[index])\(j+1)")
                                        .foregroundColor(Color("TextColor"))
                                        .opacity(0.2)
                                }
                            }
                        })
                        ForEach(viewModel.timeTable, id: \.self) { classes in
                            let timetablecell = dayofweek[index] + "\(j+1)"
                            if classes.timetables! == timetablecell {
                                NavigationLink(destination:
                                    SelectedClasDetailView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes), classes: classes, user: user)
                                , label: {
                                    ZStack {
                                        ClassColorView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes))
                                        VStack {
                                            Spacer()
                                            Text(classes.courseName)
                                                .bold()
                                                .font(.system(size: 14))
                                                .frame(width: width/6-10,
                                                       height: 40)
                                            
                                            Text(classes.roomLocation!)
                                                .bold()
                                                .font(.system(size: 11))
                                                .frame(width: width/6-10,
                                                       height: 20)
                                        }.foregroundColor(Color("TextColor"))
                                    }
                                })
                            } else {
                            }
                        }
                    }
                }
            }
            
            //j=2
            HStack(spacing: 6) {
                let j = 2
                Text("\(j+1)")
                    .frame(width: width/6 - 40)
                ForEach(0..<self.dayofweek.count){ index in
                    ZStack {
                        Button(action: {
                            isCreatingNewTimeTable.toggle()
                            dayOfWeek = dayofweek[index]
                            timePeriod = "\(j+1)"
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width:width/6,height:80)
                                    .foregroundColor(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color("TextColor").opacity(0.2), lineWidth: 0.5)
                                    )
                                VStack {
                                    Text("\(dayofweek[index])\(j+1)")
                                        .foregroundColor(Color("TextColor"))
                                        .opacity(0.2)
                                }
                            }
                        })
                        ForEach(viewModel.timeTable, id: \.self) { classes in
                            let timetablecell = dayofweek[index] + "\(j+1)"
                            if classes.timetables! == timetablecell {
                                NavigationLink(destination:
                                    SelectedClasDetailView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes), classes: classes, user: user)
                                , label: {
                                    ZStack {
                                        ClassColorView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes))
                                        VStack {
                                            Spacer()
                                            Text(classes.courseName)
                                                .bold()
                                                .font(.system(size: 14))
                                                .frame(width: width/6-10,
                                                       height: 40)
                                            
                                            Text(classes.roomLocation!)
                                                .bold()
                                                .font(.system(size: 11))
                                                .frame(width: width/6-10,
                                                       height: 20)
                                        }.foregroundColor(Color("TextColor"))
                                    }
                                })
                            } else {
                            }
                        }
                    }
                }
            }
            
            //j=3
            HStack(spacing: 6) {
                let j = 3
                Text("\(j+1)")
                    .frame(width: width/6 - 40)
                ForEach(0..<self.dayofweek.count){ index in
                    ZStack {
                        Button(action: {
                            isCreatingNewTimeTable.toggle()
                            dayOfWeek = dayofweek[index]
                            timePeriod = "\(j+1)"
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width:width/6,height:80)
                                    .foregroundColor(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color("TextColor").opacity(0.2), lineWidth: 0.5)
                                    )
                                VStack {
                                    Text("\(dayofweek[index])\(j+1)")
                                        .foregroundColor(Color("TextColor"))
                                        .opacity(0.2)
                                }
                            }
                        })
                        ForEach(viewModel.timeTable, id: \.self) { classes in
                            let timetablecell = dayofweek[index] + "\(j+1)"
                            if classes.timetables! == timetablecell {
                                NavigationLink(destination:
                                    SelectedClasDetailView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes), classes: classes, user: user)
                                , label: {
                                    ZStack {
                                        ClassColorView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes))
                                        VStack {
                                            Spacer()
                                            Text(classes.courseName)
                                                .bold()
                                                .font(.system(size: 14))
                                                .frame(width: width/6-10,
                                                       height: 40)
                                            
                                            Text(classes.roomLocation!)
                                                .bold()
                                                .font(.system(size: 11))
                                                .frame(width: width/6-10,
                                                       height: 20)
                                        }.foregroundColor(Color("TextColor"))
                                    }
                                })
                            } else {
                            }
                        }
                    }
                }
            }
            //j=4
            HStack(spacing: 6) {
                let j = 4
                Text("\(j+1)")
                    .frame(width: width/6 - 40)
                ForEach(0..<self.dayofweek.count){ index in
                    ZStack {
                        Button(action: {
                            isCreatingNewTimeTable.toggle()
                            dayOfWeek = dayofweek[index]
                            timePeriod = "\(j+1)"
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width:width/6,height:80)
                                    .foregroundColor(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color("TextColor").opacity(0.2), lineWidth: 0.5)
                                    )
                                VStack {
                                    Text("\(dayofweek[index])\(j+1)")
                                        .foregroundColor(Color("TextColor"))
                                        .opacity(0.2)
                                }
                            }
                        })
                        ForEach(viewModel.timeTable, id: \.self) { classes in
                            let timetablecell = dayofweek[index] + "\(j+1)"
                            if classes.timetables! == timetablecell {
                                NavigationLink(destination:
                                    SelectedClasDetailView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes), classes: classes, user: user)
                                , label: {
                                    ZStack {
                                        ClassColorView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes))
                                        VStack {
                                            Spacer()
                                            Text(classes.courseName)
                                                .bold()
                                                .font(.system(size: 14))
                                                .frame(width: width/6-10,
                                                       height: 40)
                                            
                                            Text(classes.roomLocation!)
                                                .bold()
                                                .font(.system(size: 11))
                                                .frame(width: width/6-10,
                                                       height: 20)
                                        }.foregroundColor(Color("TextColor"))
                                    }
                                })
                            } else {
                            }
                        }
                    }
                }
            }
            
            //j=5
            HStack(spacing: 6) {
                let j = 5
                Text("\(j+1)")
                    .frame(width: width/6 - 40)
                ForEach(0..<self.dayofweek.count){ index in
                    ZStack {
                        Button(action: {
                            isCreatingNewTimeTable.toggle()
                            dayOfWeek = dayofweek[index]
                            timePeriod = "\(j+1)"
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width:width/6,height:80)
                                    .foregroundColor(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color("TextColor").opacity(0.2), lineWidth: 0.5)
                                    )
                                VStack {
                                    Text("\(dayofweek[index])\(j+1)")
                                        .foregroundColor(Color("TextColor"))
                                        .opacity(0.2)
                                }
                            }
                        })
                        ForEach(viewModel.timeTable, id: \.self) { classes in
                            let timetablecell = dayofweek[index] + "\(j+1)"
                            if classes.timetables! == timetablecell {
                                    NavigationLink(destination:
                                        SelectedClasDetailView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes), classes: classes, user: user)
                                , label: {
                                    ZStack {
                                        ClassColorView(viewModel: ClassDetailViewModel(classId: classes, classInfo: classes))
                                        VStack {
                                            Spacer()
                                            Text(classes.courseName)
                                                .bold()
                                                .font(.system(size: 14))
                                                .frame(width: width/6-10,
                                                       height: 40)
                                            
                                            Text(classes.roomLocation!)
                                                .bold()
                                                .font(.system(size: 11))
                                                .frame(width: width/6-10,
                                                       height: 20)
                                        }.foregroundColor(Color("TextColor"))
                                    }
                                })
                            } else {
                            }
                        }
                    }
                }
            }
        }
        NavigationLink(destination: SearchClassView(dayOfWeek: $dayOfWeek,
                                                    timePeriod: $timePeriod,
                                                    isPresented: $isCreatingNewTimeTable,
                                                    user: user),
                       isActive: $isCreatingNewTimeTable) {
        }
    }
}
