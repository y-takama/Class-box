//
//  SelectedClasDetailView.swift
//  SelectedClasDetailView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
import Kingfisher

struct SelectedClassDetailView: View {
    @State var chartname1: String = "出席"
    @State var chartname2: String = "単位"
    @State var isPresentedColorChooser = false
    @State var showTimeTable = false
    @State var isLoading = false
    @State private var showingAlertRemoveClass = false
    @State private var showingAlertReportClass = false
    @State private var showingMenu = false
    @State private var exclamationmark = false
    @State private var colorPicker = false
    @State private var color = "TintColor"
    @State var coloropacity: Double = 1
    @ObservedObject var viewModel: ClassDetailViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var classes: TimeTable
    let user: User
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Circle()
                    .fill(Color(viewModel.classInfo.color!))
                    .frame(width: 12, height: 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("TextColor"), lineWidth: 0.3)
                    )
                Text(classes.courseName)
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 5)
            .padding(.bottom, 13)
            .frame(width: getScreenBounds().width)
            
            Color(viewModel.classInfo.color!)
                .frame(width: getScreenBounds().width, height: 1)
            
            ScrollView {
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
                            Text(viewModel.classInfo.roomLocation!)
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
                            Text(viewModel.classInfo.teacherName!)
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
                            Text("\(viewModel.classInfo.unit!)")
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
                            Text(viewModel.classInfo.classCode!)
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
                            Text(viewModel.classInfo.graduate!)
                                .font(.system(size: 12))
                                .bold()
                            Spacer()
                        }
                    }
//                    .padding(.leading)
                    
                    if classes.reference_source != "" {
                        Text("引用元")
                            .font(.system(size: 10))
                        HStack(spacing: 16) {
                            Image(systemName: "menucard")
                                .font(.system(size: 15))
                                .frame(width: 20)
                            Text(classes.reference_source!)
                                .font(.system(size: 12))
                                .bold()
                            Spacer()
                        }
                    }
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
                            .foregroundColor(Color("TextColor"))
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
                            .foregroundColor(Color("TextColor"))
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
                            .foregroundColor(Color("TextColor"))
                            .frame(width: (width-120)/3, height: 38)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("TextColor"), lineWidth: 0.3)
                            )
                        })
                        
                        Spacer()
                        
                        NavigationLink(destination:
                            AttendanceListView(classes: classes, viewModel: AttendanceListViewModel(classInfo: classes)).navigationBarTitleDisplayMode(.inline)
                        , label: {
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("TextColor"))
                                .padding(.trailing)
                        })
                    }.padding(.top, 7)
                }
                .padding()
                
                //Member
                if classes.myself {
                    
                } else {
                    VStack(alignment: .leading) {
                        Text("Member")
                            .font(.subheadline)
                            .fontWeight(.black)
                            .kerning(0.8)
                        ZStack {
                            NavigationLink(destination:
                                            UserListView(viewModel: viewModel,
                                                         classuser: user,
                                                         user: user,
                                                         classinfo: classes)
                                            .navigationBarTitleDisplayMode(.inline)
                            , label: {
                                HStack {
                                    ForEach(viewModel.classmember) { classinfo in
                                        VStack {
                                            if classinfo.profileImageUrl == "" {
                                                let username = classinfo.fullname
                                                let start = String(username!.prefix(2))
                                                Text(start)
                                                    .font(.system(size: 15, weight: .semibold))
                                                    .frame(width: 40, height: 40)
                                                    .padding(5)
                                                    .clipShape(Circle())
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 25)
                                                            .stroke(Color.gray, lineWidth: 0.3)
                                                    )
                                                    .foregroundColor(Color("TextColor"))
                                            } else {
                                                KFImage(URL(string: classinfo.profileImageUrl!))
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 50, height: 50)
                                                    .background(Color("TintColor"))
                                                    .clipShape(Circle())
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 25)
                                                            .stroke(Color.gray, lineWidth: 0.3)
                                                    )
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
                            })
                        }
                    }
                    .frame(height: 75)
                    .padding()
                }
                
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
                
                Spacer()
            }
            .onAppear(perform: {
                viewModel.fetchClass()
            })
            Divider()
            VStack {
                HStack {
                    NavigationLink(destination: {
                        ClassEditView(classes: $viewModel.classInfo)
                    }, label: {
                        Text("授業の編集")
                            .bold()
                            .font(.system(size: 14))
                            .frame(width: getScreenBounds().width/2 - 40, height: 32)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("TextColor"), lineWidth: 0.3)
                            )
                    })
                    Button(action: {
                        withAnimation() {
                            colorPicker.toggle()
                        }
                    }, label: {
                        Text("カラーの変更")
                            .bold()
                            .font(.system(size: 14))
                            .frame(width: getScreenBounds().width/2 - 40, height: 32)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("TextColor"), lineWidth: 0.3)
                            )
                    })
                    Button(action: {
                        withAnimation() {
                            showingMenu.toggle()
                        }
                    }, label: {
                        Image(systemName: showingMenu ? "chevron.up" : "chevron.down")
                            .font(Font.system(size: 16, weight: .semibold))
                            .frame(width: 32, height: 32)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("TextColor"), lineWidth: 0.3)
                            )
                    })
                }
                .padding(.vertical, 10).padding(.horizontal, 20)
                .foregroundColor(Color("TextColor"))
                
                if colorPicker {
                    VStack(spacing: 15) {
                        Divider()
                        Button(action: {
                            color = "TintColor"
                            coloropacity = 1
                            registrationColor()
                        }, label: {
                            Text("クリア")
                                .foregroundColor(Color("TextColor"))
                                .bold()
                                .font(.system(size: 15))
                                .frame(width: getScreenBounds().width - 40,
                                       height: (getScreenBounds().width-40)/12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 2)
                                        .stroke(Color("TextColor"), lineWidth: 0.3)
                                ).padding(.top)
                        })
                        HStack(spacing: 0) {
                            ForEach(0..<12){ num in
                                Button(action: {
                                    color = "Color\(num)"
                                    coloropacity = 1
                                    registrationColor()
                                }, label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color("Color\(num)"))
                                            .frame(width: (getScreenBounds().width-40)/12-2, height: (getScreenBounds().width-40)/12-2)
                                            .padding(1)
                                        if color == "Color\(num)" {
                                            Image(systemName: "square")
                                                .resizable()
                                                .frame(width: (getScreenBounds().width-40)/12, height: (getScreenBounds().width-40)/12)
                                                .foregroundColor(Color.gray)
                                        }
                                    }
                                })
                            }
                        }
                    }.padding(.bottom, 25)
                }
                
                if showingMenu {
                    VStack(spacing: 12) {
                        Divider()
                        HStack {
                            Text("class code")
                                .bold()
                                .font(.system(size: 14))
                            Spacer()
                            Text(classes.classId)
                                .font(.system(size: 13, weight: .semibold))
                            
                        }.padding(.top)
                            .frame(width: getScreenBounds().width - 40)
                        HStack {
                            VStack(alignment: .leading, spacing: 1) {
                                Text("削除の申請")
                                    .bold()
                                    .font(.system(size: 13))
                                Text("利用規約に違反する授業について申請することができます")
                                    .font(.system(size: 9))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                showingAlertReportClass = true
                            }, label: {
                                Text("削除の申請")
                                    .bold()
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.red)
                                    .frame(height: 28)
                                    .padding(.horizontal)
                                    .cornerRadius(5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color("TextColor"), lineWidth: 0.2)
                                    )
                                    .background(Color.gray.opacity(0.1))
                            }).alert(isPresented: $showingAlertReportClass) {
                                Alert(title: Text("削除の申請"),
                                      message: Text("この授業の削除を申請しますか？"),
                                      primaryButton: .cancel(Text("Cancel")),
                                      secondaryButton: .destructive(Text("申請"),
                                                                    action: report)
                                )
                            }
                        }.frame(width: getScreenBounds().width - 40)
                        HStack {
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Timetableから外す")
                                    .bold()
                                    .font(.system(size: 13))
                                Text("出席情報なども消去されます")
                                    .font(.system(size: 9))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                showingAlertRemoveClass = true
                            }, label: {
                                Text("Timetableから外す")
                                    .bold()
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.red)
                                    .frame(height: 28)
                                    .padding(.horizontal)
                                    .cornerRadius(5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color("TextColor"), lineWidth: 0.2)
                                    )
                                    .background(Color.gray.opacity(0.1))
                            }).alert(isPresented: $showingAlertRemoveClass) {
                                Alert(title: Text("TimeTableから外す"),
                                      message: Text("出席情報も削除されますがよろしいてすか？"),
                                      primaryButton: .cancel(Text("Cancel")),
                                      secondaryButton: .destructive(Text("TimeTableから外す"),
                                                                    action: removeClass)
                                )
                            }
                        }.frame(width: getScreenBounds().width - 40)
                    }
                    .padding(.vertical, 10)
                    
                }
            }
        }.onTapGesture(perform: {
            withAnimation() {
                colorPicker = false
                showingMenu = false
            }
        })
        .navigationBarItems(trailing: reportButton)
        .navigationTitle(classes.timetables!)
//        .halfSheet(showSheet: $exclamationmark) {
//            
//        }
    }
    
    var reportButton: some View {
        Button(action: {
            exclamationmark.toggle()
        }, label: {
            Image(systemName: "exclamationmark.circle")
                .font(Font.system(size: 16, weight: .bold))
                .foregroundColor(Color("TextColor"))
        })
    }
    
    func removeClass() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let userRef = COLLECTION_USERS.document(user.uid!).collection("2021AS").document(classes.classId)
        let timetableRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021AS").document(classes.classId).collection("registeredUser").document(user.uid!)
        userRef.delete() { err in
            if err != nil {
                report()
            }
        }
        timetableRef.delete() { err in
            if err != nil {
                report()
            }
        }
        mode.wrappedValue.dismiss()
    }
    
    func registrationColor() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.uid!).collection("2021AS").document(classes.classId)
        let data = ["color": color,
                    "coloropacity": coloropacity] as [String: Any]
        docRef.updateData(data) { _ in
            viewModel.fetchClass()
        }
    }
    func report() {
        let docRef = COLLECTION_REPORT.document()
        let data = ["classID": classes.classId,
                    "userName": user.fullname!,
                    "userEmail": user.email,
                    "content": "授業の削除"
        ] as [String: Any]
        docRef.setData(data) { _ in
            
        }
    }
}





//                ZStack {
//                    HStack {
//                        ClassEvaluationView(name: $chartname1, classes: classes)
//                            .frame(width: width/2-10)
//                        ClassEvaluationView(name: $chartname2, classes: classes)
//                            .frame(width: width/2-10)
//                    }.padding()
//
//                    if viewModel.loading {
//                        ProgressView()
//                            .progressViewStyle(CircularProgressViewStyle(tint: Color("TextColor")))
//                            .scaleEffect(1)
//                    }
//                }
