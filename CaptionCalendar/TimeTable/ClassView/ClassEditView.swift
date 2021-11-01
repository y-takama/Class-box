//
//  ClassEditView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/18.
//

import SwiftUI

struct ClassEditView: View {
    @State private var roomLocation: String
    @State private var teacherName: String
    @State private var unit: Int
    @State private var classCode: String
    @State private var editButton = false
    @State private var myself = false
    @Binding var classes: TimeTable
    let units = ["0","1","2","3","4","5","6","7","8","9","10"]
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(classes: Binding<TimeTable>) {
        self._classes = classes
        self._roomLocation = State(initialValue: _classes.wrappedValue.roomLocation ?? "")
        self._teacherName = State(initialValue: _classes.wrappedValue.teacherName ?? "")
        self._unit = State(initialValue: _classes.wrappedValue.unit ?? 0)
        self._classCode = State(initialValue: _classes.wrappedValue.classCode ?? "")
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    Group {
                        Text("教室")
                            .font(.system(size: 10))
                        HStack(spacing: 16) {
                            Image(systemName: "mappin")
                                .font(.system(size: 15))
                                .frame(width: 30)
                            TextField("教室", text: $roomLocation)
                                .foregroundColor(Color("CaptionColor"))
                                .font(.system(size: 13, weight: .semibold))
                            Spacer()
                        }.frame(height: 30)
                        Divider()
                        Text("担当教員")
                            .font(.system(size: 10))
                        HStack(spacing: 16) {
                            Image(systemName: "person")
                                .font(.system(size: 15))
                                .frame(width: 30)
                            TextField("担当教員", text: $teacherName)
                                .foregroundColor(Color("CaptionColor"))
                                .font(.system(size: 13, weight: .semibold))
                            Spacer()
                        }.frame(height: 30)
                        Divider()
                        Text("単位数")
                            .font(.system(size: 10))
                        HStack(spacing: 16) {
                            Image(systemName: "sum")
                                .font(.system(size: 15))
                                .frame(width: 30)
                            Picker(selection: $unit, label: Text("order")) {
                                ForEach(units, id: \.self) { num in
                                    Text("\(num)単位")
                                }
                            }
                            Spacer()
                        }.frame(height: 30)
                        Divider()
                        
                    }.padding(.horizontal, 20)
                    Group {
                        Text("授業コード")
                            .font(.system(size: 10))
                        HStack(spacing: 16) {
                            Image(systemName: "chevron.left.slash.chevron.right")
                                .font(.system(size: 15))
                                .frame(width: 30)
                            TextField("授業コード", text: $classCode)
                                .foregroundColor(Color("CaptionColor"))
                                .font(.system(size: 13, weight: .semibold))
                            Spacer()
                        }.frame(height: 30)
                        Divider()
                    }.padding(.horizontal, 20)
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 1)  {
                            Text("自身の時間割のみ変更する")
                                .font(.system(size: 14, weight: .semibold))
                            Text("自身の時間割のみ変更されます")
                                .font(.system(size: 9))
                        }
//                        .frame(width: getScreenBounds().width*2/3, alignment: .leading)
                        Spacer()
                        Toggle(isOn: $myself) {
                        }
                    }
                    .frame(width: getScreenBounds().width - 40)
                    .padding(.top, 30).padding(.horizontal, 20)
                }
            }
            
            AdView(adUnitID: "ca-app-pub-6537638223494633/3225095498")
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.width*5/16)
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
        .navigationTitle(classes.courseName)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: registrationButton)
    }
    var registrationButton: some View {
        Button(action: {
            editButton.toggle()
        }, label: {
            Text("保存")
                .font(Font.system(size: 16, weight: .bold))
                .foregroundColor(Color("TextColor"))
        })
            .alert(isPresented: $editButton) {
                Alert(title: Text("変更しますか？"),
                      message: Text("変更をすることでこの授業を登録しているすべての人に変更内容が適用されます。"),
                      primaryButton: .cancel(Text("Calcel")),
                      secondaryButton: .default(Text("OK"),
                                                action: {
                    EditClass()
                }))
            }
    }
    
    func EditClass() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let ClassId = classes.classId
        let userdocRef = COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId)
        let timetabledocRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021AS").document(ClassId)
        let timetablesdocRef = COLLECTION_TIMETABLE.document(user.university!).collection(user.campus!).document("2021AS").collection(classes.timetables!).document(ClassId)
        let data = ["roomLocation": roomLocation,
                    "teacherName": teacherName,
                    "unit": unit,
                    "editer": user.uid!,
                    "classCode": classCode] as [String : Any]
        if myself {
            userdocRef.updateData(data){ _ in
                mode.wrappedValue.dismiss()
            }
        } else {
            userdocRef.updateData(data){ _ in
                mode.wrappedValue.dismiss()
            }
            timetabledocRef.updateData(data){ _ in
            }
            timetablesdocRef.updateData(data){ _ in
            }
        }
    }
}
