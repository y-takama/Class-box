//
//  ClassDetailView.swift
//  ClassDetailView
//
//  Created by 髙間洋平 on 2021/08/23.
//

import SwiftUI

struct ClassDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var chartname1: String = "出席"
    @State var chartname2: String = "単位"
    @State private var showingTimeTable = false
    @Binding var dayOfWeek: String
    @Binding var timePeriod: String
    let classes: TimeTable
    let user: User
    let width = UIScreen.main.bounds.width
    @ObservedObject var viewModel = SearchClassViewModel()
    @ObservedObject var viewModels: ClassDetailViewModel
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("キャンパス")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 16))
                            .frame(width: 20)
                        Text(classes.campus!)
                            .font(.system(size: 13))
                            .bold()
                    }
                }
                Spacer()
                Button(action: {
                    viewModel.registrationClass(dayOfWeek: dayOfWeek,
                                                timePeriod: timePeriod,
                                                classId: classes.classId)
                    showingTimeTable = true
                }, label: {
                    Text("TimeTableに加える")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(Color.white)
                        .frame(width: 140, height: 37)
                        .background(Color(red: 104/255, green: 171/255, blue: 121/255))
                        .clipShape(Capsule())
                        .padding()
                })
            }
            .padding(.horizontal, 20)
            
            HStack {
                ClassEvaluationView(name: $chartname1, classes: classes)
                    .frame(width: width/2-10)
                ClassEvaluationView(name: $chartname2, classes: classes)
                    .frame(width: width/2-10)
            }.padding()
            
            //Member
            VStack(alignment: .leading, spacing: 6) {
                Text("Member")
                    .font(.subheadline)
                    .fontWeight(.black)
                    .kerning(0.8)
                if viewModels.classmember.isEmpty {
                    HStack {
                        Spacer()
                        Text("メンバーはいません")
                            .modifier(SecondaryCaptionTextStyle())
                        Spacer()
                    }
                } else {
                    NavigationLink(destination:
                        UserListView(viewModel: viewModels, user: user).navigationBarTitleDisplayMode(.inline)
                    , label: {
                        HStack {
                            ForEach(viewModels.classmember) { classinfo in
                                VStack {
                                    if classinfo.profileImageUrl == "" {
                                        ZStack {
                                            Circle()
                                                .frame(width: 60 ,height: 60)
                                                .foregroundColor(Color(.systemGray3))
                                            
                                            Image(systemName: "person.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30 ,height: 30)
                                                .foregroundColor(Color(.systemGray5))
                                        }
                                    }
                                    if classinfo.fullname! != "" {
                                        Text(classinfo.fullname!)
                                            .font(.system(size: 10))
                                    }
                                }
                            }
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("TextColor"))
                                .padding(.trailing)
                                
                        }.padding(.leading, 10)
    //                    .padding(.horizontal)
                    })
                }
                
            }.padding()
            
            //Infomation
            VStack(alignment: .leading, spacing: 6) {
                Text("Infomation")
                    .font(.subheadline)
                    .fontWeight(.black)
                    .kerning(0.8)
                Text("教室")
                    .font(.system(size: 10))
                HStack(spacing: 16) {
                    Image(systemName: "mappin")
                        .font(.system(size: 15))
                        .frame(width: 20)
                    Text(classes.roomLocation!)
                        .font(.system(size: 12))
                        .bold()
                    Spacer()
                }
                Text("担当教員")
                    .font(.system(size: 10))
                HStack(spacing: 16) {
                    Image(systemName: "person")
                        .font(.system(size: 15))
                        .frame(width: 20)
                    Text(classes.teacherName!)
                        .font(.system(size: 12))
                        .bold()
                    Spacer()
                }
                Text("単位数")
                    .font(.system(size: 10))
                HStack(spacing: 16) {
                    Image(systemName: "sum")
                        .font(.system(size: 15))
                        .frame(width: 20)
                    Text(classes.unit!)
                        .font(.system(size: 12))
                        .bold()
                    Spacer()
                }
                Text("授業コード")
                    .font(.system(size: 10))
                HStack(spacing: 16) {
                    Image(systemName: "chevron.left.slash.chevron.right")
                        .font(.system(size: 15))
                        .frame(width: 20)
                    Text(classes.classCode!)
                        .font(.system(size: 12))
                        .bold()
                    Spacer()
                }
                
            }.padding()
            
            
            //Note
            VStack(alignment: .leading, spacing: 6) {
                Text("Note")
                    .font(.subheadline)
                    .fontWeight(.black)
                    .kerning(0.8)
                HStack {
                    Image(systemName: "doc.fill.badge.plus")
                        .font(.system(size: 15))
                    Text("メモを追加する")
                        .font(.system(size: 13))
                    Spacer()
                }
                .foregroundColor(Color.gray)
                .padding(.leading)
            }.padding()
            
            //Syllabus
            VStack(alignment: .leading, spacing: 6) {
                Text("Syllabus")
                    .font(.subheadline)
                    .fontWeight(.black)
                    .kerning(0.8)
                HStack {
                    Image(systemName: "macwindow.badge.plus")
                        .font(.system(size: 15))
                    Text("シラバスを追加する")
                        .font(.system(size: 13))
                    Spacer()
                }
                .foregroundColor(Color.gray)
                .padding(.leading)
            }
            .padding()
        }
        .navigationTitle(classes.courseName)
        NavigationLink(destination: MainTableView(showTimeTableSheet: $showingTimeTable, user: user).navigationBarHidden(true), isActive: $showingTimeTable) {
            
        }
    }
}
