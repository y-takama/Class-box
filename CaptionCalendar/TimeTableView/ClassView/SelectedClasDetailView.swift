//
//  SelectedClasDetailView.swift
//  SelectedClasDetailView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI

struct SelectedClasDetailView: View {
    @State var chartname1: String = "出席"
    @State var chartname2: String = "単位"
    @State var isPresentedColorChooser = false
    @State private var showingAlertRemoveClass = false
    @State private var showingTimeTable = false
    @ObservedObject var viewModel: ClassDetailViewModel
    let classes: TimeTable
    let user: User
    let width = UIScreen.main.bounds.width
    var body: some View {
        ScrollView {
            HStack {
                ClassEvaluationView(name: $chartname1, classes: classes)
                    .frame(width: width/2-10)
                ClassEvaluationView(name: $chartname2, classes: classes)
                    .frame(width: width/2-10)
            }.padding()
            
            //Attendance
            VStack(alignment: .leading) {
                Text("Attendance")
                    .font(.subheadline)
                    .fontWeight(.black)
                    .kerning(0.8)
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.fetchAttendance()
                        viewModel.fetchClass()
                    }, label: {
                        HStack(spacing: 5) {
                            Text("出席")
                                .font(.system(size: 14, weight: .semibold))
                            
                            Text(String(viewModel.classInfo.attendance!))
                                .font(.system(size: 14, weight: .semibold))
                                
                        }
                        .frame(width: (width-120)/3, height: 38)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("TextColor"), lineWidth: 0.3)
                        )
                    })
                    
                    
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.fetchBehindtime()
                        viewModel.fetchClass()
                    }, label: {
                        HStack(spacing: 5) {
                            Text("遅刻")
                                .font(.system(size: 14, weight: .semibold))
                            Text(String(viewModel.classInfo.behindtime!))
                                .font(.system(size: 14, weight: .semibold))
                                
                        }
                        .frame(width: (width-120)/3, height: 38)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("TextColor"), lineWidth: 0.3)
                        )
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.fetchAbsence()
                        viewModel.fetchClass()
                    }, label: {
                        HStack(spacing: 5) {
                            Text("欠席")
                                .font(.system(size: 14, weight: .semibold))
                            Text(String(viewModel.classInfo.absence!))
                                .font(.system(size: 14, weight: .semibold))
                                
                        }
                        .frame(width: (width-120)/3, height: 38)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("TextColor"), lineWidth: 0.3)
                        )
                    })
                    
                    Spacer()
                    
                    NavigationLink(destination:
                        AttendanceListView(classes: classes, viewModel: AttendanceListViewModel(classInfo: classes, classinfo: classes)).navigationBarTitleDisplayMode(.inline)
                    , label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("TextColor"))
                            .padding(.trailing)
                    })
                }
            }
            .padding()
            
            //Member
            
            VStack(alignment: .leading) {
                Text("Member")
                    .font(.subheadline)
                    .fontWeight(.black)
                    .kerning(0.8)
                NavigationLink(destination:
                    UserListView(viewModel: viewModel, user: user).navigationBarTitleDisplayMode(.inline)
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
                                } else {
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
                                    if classinfo.fullname! == user.fullname {
                                        Text("自分")
                                            .font(.system(size: 10))
                                    } else {
                                        Text(classinfo.fullname!)
                                            .font(.system(size: 10))
                                    }
                                    
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
            }.padding()
            
        }
        .navigationBarItems(trailing: menuButton)
        .navigationTitle(classes.courseName)
        .sheet(isPresented: $isPresentedColorChooser) {
            VStack(spacing: 15) {
                HStack(spacing: 0) {
                    ForEach(0..<6){ num in
                        Button(action: {
                            registrationColor(color: "Color\(num)")
                        }, label: {
                            ZStack {
                                Circle()
                                    .fill(Color("Color\(num)"))
                                    .frame(width: 30, height: 30)
                                if viewModel.classInfo.color == "Color\(num)" {
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color.black)
                                }
                            }.frame(width: width/7, height: 80)
                            
                        })
                    }
                }
                HStack(spacing: 0) {
                    ForEach(6..<12){ num in
                        Button(action: {
                            registrationColor(color: "Color\(num)")
                        }, label: {
                            ZStack {
                                Circle()
                                    .fill(Color("Color\(num)"))
                                    .frame(width: 30, height: 30)
                                if viewModel.classInfo.color == "Color\(num)" {
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color.black)
                                }
                            }.frame(width: width/7, height: 80)
                            
                        })
                    }
                }
            }
        }
        .alert(isPresented: $showingAlertRemoveClass) {
            Alert(title: Text("TimeTableから外す"),
                  message: Text("出席情報も削除されますがよろしいてすか？"),
                  primaryButton: .cancel(Text("Cancel")),
                  secondaryButton: .destructive(Text("TimeTableから外す"),
                                                action: removeClass)
            )
        }
        NavigationLink(destination: MainTableView(user: user).navigationBarHidden(true), isActive: $showingTimeTable) {
        }
    }
    
    var menuButton: some View {
        Menu {
            Button(action: {
                isPresentedColorChooser.toggle()
            }) {
                Text("カラーを変更する")
                Image(systemName: "paintbrush")
            }
            Button(action: {}) {
                Text("編集する")
                Image(systemName: "square.and.pencil")
            }
            Button(action: {}) {
                Text("消去依頼")
                Image(systemName: "trash")
            }
            Button(action: {
                self.showingAlertRemoveClass = true
            }, label: {
                Text("TimeTableから外す")
                Image(systemName: "arrowshape.turn.up.forward")
            })
        } label: {
            Image(systemName: "ellipsis")
                .foregroundColor(Color("TextColor"))
        }
    }
    
    
    func removeClass() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let userRef = COLLECTION_USERS.document(uid).collection("2021LH").document(classes.classId)
        let timetableRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(classes.classId).collection("registeredUser").document(uid)
        timetableRef.delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            }
        }
        userRef.delete() { err in
             if let err = err {
                 print("Error removing document: \(err)")
             } else {
                 showingTimeTable = true
             }
         }
    }
    func registrationColor(color: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_USERS.document(uid).collection("2021LH").document(classes.classId).updateData(["color": color]) { _ in
            isPresentedColorChooser = false
            showingTimeTable = true
        }
    }
}
