//
//  ClassDetailView.swift
//  ClassDetailView
//
//  Created by 髙間洋平 on 2021/08/23.
//

import SwiftUI
import Kingfisher

struct ClassDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var chartname1: String = "出席"
    @State var chartname2: String = "単位"
    @State private var showTimeTable = false
    @State private var showingTimeTable = false
    @State private var showingMenu = false
    @State private var showingAlertReportClass = false
    @Binding var dayOfWeek: String
    @Binding var timePeriod: String
    @Binding var isPresented: Bool
    let classes: TimeTable
    let user: User
    @ObservedObject var viewModel: ClassDetailViewModel
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Circle()
                    .fill(Color(classes.color!))
                    .frame(width: 10, height: 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("TextColor"), lineWidth: 0.3)
                    )
                Text(classes.courseName)
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
            }.padding()
            Divider()
            ScrollView {
                
                //Infomation
                VStack(alignment: .leading, spacing: 6) {
                    Text("Infomation")
                        .font(.subheadline)
                        .fontWeight(.black)
                        .kerning(0.8)
                    Text("キャンパス")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 15))
                            .frame(width: 20)
                        Text(classes.campus!)
                            .font(.system(size: 12))
                            .bold()
                        Spacer()
                    }
                    
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
                                                         classuser: user,
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
                                            } else {
                                                KFImage(URL(string: classinfo.profileImageUrl!))
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 60, height: 60)
                                                    .background(Color("TintColor"))
                                                    .clipShape(Circle())
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 30)
                                                            .stroke(Color.gray, lineWidth: 0.3)
                                                    )
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
                            })
                        }
                        if viewModel.loadinguser {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color("TextColor")))
                                .scaleEffect(1)
                        }
                    }
                }.padding()
            }
            Divider()
            VStack {
                HStack {
                    Button(action: {
                        registrationClass(dayOfWeek: dayOfWeek,
                                          timePeriod: timePeriod,
                                          classId: classes.classId,
                                          courseName: classes.courseName,
                                          roomLocation: classes.roomLocation!)
                        showTimeTable = true
                    }, label: {
                        Text("Timetableに加える")
                            .foregroundColor(Color("TintColor"))
                            .bold()
                            .font(.system(size: 14))
                            .frame(width: getScreenBounds().width - 80, height: 32)
                            .background(Color("CaptionColor"))
                            .cornerRadius(5)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 5)
//                                    .stroke(Color("CaptionColor"), lineWidth: 1.5)
//                            )
                            
                    })
                    Spacer()
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
                }.foregroundColor(Color("TextColor"))
                .padding(.top, 10).padding(.horizontal, 20)
                if showingMenu {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("class code")
                                .bold()
                                .font(.system(size: 14))
                            Spacer()
                            Text(classes.classId)
                                .font(.system(size: 13, weight: .semibold))
                            
                        }
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
                        }
                    }
                    .padding(.vertical, 10)
                    .frame(width: getScreenBounds().width - 40)
                }
            }
        }
    }
    func registrationClass(dayOfWeek: String,
                           timePeriod: String,
                           classId: String,
                           courseName: String,
                           roomLocation: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_USERS.document(user.id!).collection("2021AS").document(classId)
        let DogRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021AS").document(classId).collection("registeredUser").document(user.id!)
        let docID = docRef.documentID
        let data = ["courseName": courseName,
                    "roomLocation": roomLocation,
                    "teacherName": classes.teacherName!,
                    "unit": classes.unit!,
                    "classCode": classes.classCode!,
                    "graduate": classes.graduate!,
                    "reference_source": classes.reference_source!,
                    "note": "",
                    "timetables": classes.timetables!,
                    "attendance": 0,
                    "behindtime": 0,
                    "absence": 0,
                    "classId": docID] as [String: Any]
        let userdata = ["fullname": user.fullname!,
                        "profileImageUrl": user.profileImageUrl!,
                        "uid": user.uid!] as [String: Any]
        docRef.setData(data) { _ in
            DogRef.setData(userdata) { _ in
                TimeTableClassViewModel.shared.fetchTimeTable()
                isPresented = false
            }
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
