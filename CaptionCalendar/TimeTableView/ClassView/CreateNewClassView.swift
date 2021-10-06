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
    @State private var selection = 2
    @State private var courseName = ""
    @State private var teacherName = ""
    @State private var teacherName2 = ""
    @State private var classcode = ""
    @State private var className = ""
    @State private var timetable = ""
    @State private var campus = ""
    @State private var graduate = ""
    @State private var classunit = 0
    @State private var showTimeTable = false
    @State private var showingTimeTable = false
    @ObservedObject var viewModel: SearchClassViewModel
    let unit = ["1","2","3","4"]
    var timeTable: TimeTable?
    let user: User
    var body: some View {
        //        NavigationView {
        ScrollView {
            ZStack {
                Color("TintColor").ignoresSafeArea().onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
                VStack(alignment: .leading, spacing: 5) {
                    Group {
                        HStack {
                            Text("講座名")
                            Text("必須")
                                .font(.system(size: 10, weight: .semibold))
                                .frame(width: 30, height: 14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color("TextColor"), lineWidth: 0.5)
                                )
                                .foregroundColor(Color("TextColor"))
                            
                            if viewModel.loading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: Color("TextColor")))
                                    .scaleEffect(1)
                            }
                            ForEach(viewModel.timetable, id: \.self){ classinfo in
                                if classinfo.courseName == courseName {
                                    Text("同じ名前の授業が存在します")
                                        .font(.system(size: 10, weight: .semibold))
                                        .foregroundColor(Color.red)
                                }
                            }
                        }
                        CustomCreateClassTextField(text: $courseName, placeholder: Text("授業名"), imageName: "rosette")
                            .padding(10)
                            .background(Color("TextColor").opacity(0.1))
                            .cornerRadius(4)
                            .padding(.bottom)
                        
                        HStack{
                            Text("教員名")
                        }
                        CustomCreateClassTextField(text: $teacherName, placeholder: Text("教員名"), imageName: "graduationcap")
                            .padding(10)
                            .background(Color("TextColor").opacity(0.1))
                            .cornerRadius(4)
                            .padding(.bottom)
                        
                        HStack{
                            Text("授業コード")
                        }
                        CustomCreateClassTextField(text: $classcode, placeholder: Text("授業コード"), imageName: "chevron.left.slash.chevron.right")
                            .padding(10)
                            .background(Color("TextColor").opacity(0.1))
                            .cornerRadius(4)
                            .padding(.bottom)
                        HStack{
                            Text("教室名")
                        }
                        
                        CustomCreateClassTextField(text: $className, placeholder: Text("教室名"), imageName: "location.viewfinder")
                            .padding(10)
                            .background(Color("TextColor").opacity(0.1))
                            .cornerRadius(4)
                            .padding(.bottom)
                    }
                    Text("単位数")
                    VStack {
                        Picker(selection: $selection, label: Text("単位数")) {
                            ForEach(unit, id: \.self) { units in
                                Text(units)
                            }
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    //                    Text("選択値：\(selection)")
                    Spacer()
                    
                }
                .padding()
            }
            .navigationBarItems(trailing: registrationButton)
            .navigationBarTitle("\(dayOfWeek)曜\(timePeriod)時限")
        }
        NavigationLink(destination: MainTableView(showTimeTableSheet: $showingTimeTable, user: user).navigationBarHidden(true), isActive: $showTimeTable) {
        }
    }
    
    
    func uploadTimeTable(courseName: String,
                         roomLocation: String,
                         teacherName: String,
                         teacherName2: String,
                         unit: Int,
                         classCode: String,
                         dayOfWeek: String,
                         timePeriod: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let docfef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document()
        let docID = docfef.documentID
        let Docfef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH\(dayOfWeek)\(timePeriod)").document(docID)
        let docRef = COLLECTION_USERS.document(user.id!).collection("2021LH").document(docID)
        let DogRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document(docID).collection("registeredUser").document(uid)
        let datas: [String: Any] = ["university": user.university as Any,
                                    "courseName": courseName,
                                    "roomLocation": roomLocation,
                                    "teacherName": teacherName,
                                    "teacherName2": teacherName2,
                                    "unit": unit,
                                    "author": user.fullname as Any,
                                    "campus": user.campus as Any,
                                    "classCode": classCode,
                                    "timetables": "\(dayOfWeek)\(timePeriod)",
                                    "classId": docID]
        let data = ["courseName": courseName,
                    "roomLocation": roomLocation,
                    "note": "",
                    "timetables": "\(dayOfWeek)\(timePeriod)",
                    "attendance": 0,
                    "behindtime": 0,
                    "absence": 0,
                    "classId": docID] as [String: Any]
        docfef.setData(datas) { _ in
            docRef.setData(data) { _ in
                DogRef.setData([:]) { _ in
                    showTimeTable = true
                }
            }
        }
        Docfef.setData(datas) { _ in
        }
    }
    
    func registrationclass() {
        var products = [String: [String: Any]]()
        

        
        
        
        for (key, value) in products {
            print("product name: ", key)
            let courseName = key
            value.forEach {
                if String($0.key) == "name" {
                    teacherName = $0.value as! String
                } else if String($0.key) == "code" {
                    classcode = $0.value as! String
                } else if String($0.key) == "unit" {
                    classunit = $0.value as! Int
                } else if String($0.key) == "timetables" {
                    timetable = $0.value as! String
                } else if String($0.key) == "campus" {
                    campus = $0.value as! String
                } else if String($0.key) == "graduate" {
                    graduate = $0.value as! String
                }
            }
            guard let user = AuthViewModel.shared.currentUser else { return }
            //            guard let uid = AuthViewModel.shared.userSession?.uid else { return }
            let docfef = COLLECTION_TIMETABLE.document(user.university!).collection("2021LH").document()
            let docID = docfef.documentID
            let Docfef = COLLECTION_TIMETABLE.document(user.university!).collection("\(campus)").document("2021LH").collection("\(timetable)").document(docID)
            
            
            let datas: [String: Any] = ["university": user.university as Any,
                                        "courseName": courseName,
                                        "roomLocation": "",
                                        "teacherName": teacherName,
                                        "teacherName2": teacherName2,
                                        "unit": classunit,
                                        "author": user.fullname as Any,
                                        "campus": campus,
                                        "classCode": classcode,
                                        "graduate": graduate,
                                        "timetables": timetable,
                                        "classId": docID]
            Docfef.setData(datas) { _ in
            }
            docfef.setData(datas) { _ in
                
            }
        }
    }
    
    
    var registrationButton: some View {
        Button(action: {
            registrationclass()
            //            courseName != "" ?
            //            uploadTimeTable(courseName: courseName,
            //                            roomLocation: className,
            //                            teacherName: teacherName,
            //                            teacherName2: teacherName2,
            //                            unit: selection,
            //                            classCode: classcode,
            //                            dayOfWeek: dayOfWeek,
            //                            timePeriod: timePeriod) : nil
        }, label: {
            Text("作成")
            //                .bold()
                .font(Font.system(size: 17, weight: .bold))
                .foregroundColor(courseName != "" ? Color(red: 104/255, green: 171/255, blue: 121/255) : Color.gray.opacity(0.7))
        })
    }
}
