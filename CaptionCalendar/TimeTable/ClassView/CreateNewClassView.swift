//
//  CreateNewClassView.swift
//  CreateNewClassView
//
//  Created by 髙間洋平 on 2021/08/20.
//

import SwiftUI

struct CreateNewClassView: View {
    @Binding var dayOfWeek: String
    @Binding var timePeriod: String
    @Binding var isPresented: Bool
    @State private var selection = 2
    @State private var courseName = ""
    @State private var teacherName = ""
    @State private var roomLocation = ""
    @State private var classCode = ""
    @State private var graduate = ""
    @State private var myself = false
    let user: User
    var body: some View {
        //        NavigationView {
        ScrollView {
            ZStack {
                Color("TintColor").ignoresSafeArea().onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("講座名")
                            .font(.system(size: 10))
                        
                        Text("必須")
                            .font(.system(size: 9))
                            .frame(width: 28, height: 13)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.black, lineWidth: 0.3)
                            )
                    }
                    
                    HStack(spacing: 16) {
                        Image(systemName: "character.book.closed")
                            .font(.system(size: 15))
                            .frame(width: 30)
                        TextField("講座名", text: $courseName)
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.vertical, 5)
                        Spacer()
                    }
                    Divider()
                    Group {
                        Text("教室")
                            .font(.system(size: 10))
                        HStack(spacing: 16) {
                            Image(systemName: "mappin")
                                .font(.system(size: 15))
                                .frame(width: 30)
                            TextField("教室", text: $roomLocation)
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.vertical, 5)
                            Spacer()
                        }
                        Divider()
                        Text("担当教員")
                            .font(.system(size: 10))
                        HStack(spacing: 16) {
                            Image(systemName: "person")
                                .font(.system(size: 15))
                                .frame(width: 30)
                            TextField("担当教員", text: $teacherName)
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.vertical, 5)
                            Spacer()
                        }
                        Divider()
                        
                    }
                    Group {
                        Text("授業コード")
                            .font(.system(size: 10))
                        HStack(spacing: 16) {
                            Image(systemName: "chevron.left.slash.chevron.right")
                                .font(.system(size: 15))
                                .frame(width: 30)
                            TextField("教室", text: $classCode)
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.vertical, 5)
                            Spacer()
                        }
                        Divider()
                        Text("学部、研究科")
                            .font(.system(size: 10))
                        HStack(spacing: 16) {
                            Image(systemName: "graduationcap")
                                .font(.system(size: 15))
                                .frame(width: 30)
                            TextField("学部、研究科", text: $graduate)
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.vertical, 5)
                            Spacer()
                        }
                        Divider()
                    }
                    Text("単位数")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "sum")
                            .font(.system(size: 15))
                            .frame(width: 30)
                        Picker("", selection: $selection) {
                            ForEach(0..<9) { num in
                                Text("\(num)単位")
                            }
                        }
                    }
                    Divider()
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 1)  {
                            Text("自身のみで利用する")
                                .font(.system(size: 14, weight: .semibold))
                            Text("自身のみで作成した時間割は公開されず、一部機能は利用できません")
                                .font(.system(size: 9))
                        }.frame(width: getScreenBounds().width*2/3)
                        Spacer()
                        Toggle(isOn: $myself) {
                            
                        }
                    }.padding(.top, 30)
//                    Text("\(selection)")
                    Spacer()
                    
                }
                .padding()
            }
            .onTapGesture {
                UIApplication.shared.closeKeyboard()
            }
            .navigationBarItems(trailing: registrationButton)
            .navigationBarTitle("\(dayOfWeek)曜\(timePeriod)時限")
        }
    }
    
    var registrationButton: some View {
        
        Button(action: {
            if myself {
                courseName != "" ? uploadMyselfTimeTable() : nil
            } else {
                courseName != "" ? uploadTimeTable() : nil
            }
        }, label: {
            Text("作成")
                .font(Font.system(size: 16, weight: .bold))
                .foregroundColor(courseName != "" ? Color(red: 104/255, green: 171/255, blue: 121/255) : Color.gray.opacity(0.7))
        })
    }
    
    func uploadTimeTable() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let docfef = COLLECTION_TIMETABLE.document(user.university!).collection("2021AS").document()
        let docID = docfef.documentID
//        let timetableDocRef = COLLECTION_TIMETABLE.document(user.university!).collection(user.campus!).document("2021AS").collection("\(dayOfWeek)\(timePeriod)").document(docID)
        let DogRef = COLLECTION_USERS.document(user.id!).collection("2021AS").document(docID)
        let userDocRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021AS").document(docID).collection("registeredUser").document(uid)
        let datas: [String: Any] = ["university": user.university!,
                                    "courseName": courseName,
                                    "roomLocation": roomLocation,
                                    "teacherName": teacherName,
                                    "unit": selection,
                                    "classCode": classCode,
                                    "graduate": graduate,
                                    "author": user.fullname!,
                                    "campus": user.campus!,
                                    "timetables": "\(dayOfWeek)\(timePeriod)",
                                    "classId": docID]
        let data = ["courseName": courseName,
                    "roomLocation": roomLocation,
                    "teacherName": teacherName,
                    "unit": selection,
                    "classCode": classCode,
                    "graduate": graduate,
                    "timetables": "\(dayOfWeek)\(timePeriod)",
                    "attendance": 0,
                    "behindtime": 0,
                    "absence": 0,
                    "classId": docID] as [String: Any]
        
        let userdata = ["fullname": user.fullname!,
                        "profileImageUrl": user.profileImageUrl!,
                        "uid": user.uid!] as [String: Any]
        
        docfef.setData(datas) { _ in
        }
        DogRef.setData(data) { _ in
        }
        userDocRef.setData(userdata) { _ in
        }
        
        isPresented = false
    }
    func uploadMyselfTimeTable() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let DogRef = COLLECTION_USERS.document(uid).collection("2021AS").document()
        let docID = DogRef.documentID
        let data = ["courseName": courseName,
                    "roomLocation": roomLocation,
                    "teacherName": teacherName,
                    "unit": selection,
                    "classCode": classCode,
                    "graduate": graduate,
                    "timetables": "\(dayOfWeek)\(timePeriod)",
                    "attendance": 0,
                    "behindtime": 0,
                    "absence": 0,
                    "myself": true,
                    "classId": docID] as [String: Any]
        DogRef.setData(data) { _ in
        }
        
        isPresented = false
    }
}
