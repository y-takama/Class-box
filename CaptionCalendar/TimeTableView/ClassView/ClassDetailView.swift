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
    @State private var showTimeTable = false
    @State private var showingTimeTable = false
    @Binding var dayOfWeek: String
    @Binding var timePeriod: String
    let classes: TimeTable
    let user: User
    @ObservedObject var viewModel: ClassDetailViewModel
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
                    registrationClass(dayOfWeek: dayOfWeek,
                                      timePeriod: timePeriod,
                                      classId: classes.classId,
                                      courseName: classes.courseName,
                                      roomLocation: classes.roomLocation!)
                    showTimeTable = true
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
            
            ZStack {
                HStack {
                    ClassEvaluationView(name: $chartname1, classes: classes)
                        .frame(width: getScreenBounds().width/2-10)
                    ClassEvaluationView(name: $chartname2, classes: classes)
                        .frame(width: getScreenBounds().width/2-10)
                }.padding()
                if viewModel.loading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("TextColor")))
                        .scaleEffect(1)
                }
            }
            
            //Member
            VStack(alignment: .leading, spacing: 6) {
                Text("Member")
                    .font(.subheadline)
                    .fontWeight(.black)
                    .kerning(0.8)
                ZStack {
                    if viewModel.classmember.isEmpty {
                        HStack {
                            Spacer()
                            Text("メンバーはいません")
                                .modifier(SecondaryCaptionTextStyle())
                            Spacer()
                        }
                    } else {
                        NavigationLink(destination:
                                        UserListView(viewModel: viewModel,
                                                     user: user,
                                                     classinfo: classes)
                                        .navigationBarTitleDisplayMode(.inline)
                        , label: {
                            HStack {
                                ForEach(viewModel.classmember) { classinfo in
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
                    if viewModel.loadinguser {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("TextColor")))
                            .scaleEffect(1)
                    }
                }
                
                
            }.padding()
            
            //Infomation
            VStack(alignment: .leading, spacing: 6) {
                Text("Infomation")
                    .font(.subheadline)
                    .fontWeight(.black)
                    .kerning(0.8)
                Group {
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
                        Text("\(classes.unit!)")
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
                    Text("学部、研究科")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "graduationcap")
                            .font(.system(size: 15))
                            .frame(width: 20)
                        Text(classes.graduate!)
                            .font(.system(size: 12))
                            .bold()
                        Spacer()
                    }
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
//        .fullScreenCover(isPresented: $showingTimeTable) {
//            MainTableView(showTimeTableSheet: $showingTimeTable, user: user)
//        }
        NavigationLink(destination: MainTableView(showTimeTableSheet: $showingTimeTable, user: user).navigationBarHidden(true),
                       isActive: $showTimeTable) {
        }
    }
    func registrationClass(dayOfWeek: String,
                           timePeriod: String,
                           classId: String,
                           courseName: String,
                           roomLocation: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("2021LH").document(classId)
        let DogRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(classId).collection("registeredUser").document(uid)
        let docID = docRef.documentID
        let data = ["courseName": courseName,
                    "roomLocation": roomLocation,
                    "note": "",
                    "timetables": "\(dayOfWeek)\(timePeriod)",
                    "attendance": 0,
                    "behindtime": 0,
                    "absence": 0,
                    "classId": docID] as [String: Any]
        docRef.setData(data) { _ in
            DogRef.setData([:]) { _ in
                
            }
        }
    }
}
