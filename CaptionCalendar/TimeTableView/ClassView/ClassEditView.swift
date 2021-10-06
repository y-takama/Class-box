//
//  ClassEditView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/05.
//

import SwiftUI

struct ClassEditView: View {
    @State private var roomLocation: String
    @State private var teacherName: String
    @State private var unit: Int
    @State private var classCode: String
    @State private var editButton = false
    @Binding var classes: TimeTable
    @Binding var showingEditClass: Bool
    @ObservedObject var viewModel: EditClassViewModel
    
    init(classes: Binding<TimeTable>, showingEditClass: Binding<Bool>) {
        self._classes = classes
        self._showingEditClass = showingEditClass
        self.viewModel = EditClassViewModel(classId: self._classes.wrappedValue,
                                              classInfo: self._classes.wrappedValue,
                                              editClass: self._classes.wrappedValue)
        self._roomLocation = State(initialValue: _classes.wrappedValue.roomLocation ?? "")
        self._teacherName = State(initialValue: _classes.wrappedValue.teacherName ?? "")
        self._unit = State(initialValue: _classes.wrappedValue.unit ?? 0)
        self._classCode = State(initialValue: _classes.wrappedValue.classCode ?? "")
    }
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Group {
                    Text("教室")
                        .font(.system(size: 10))
                        
                    HStack(spacing: 16) {
                        Image(systemName: "mappin")
                            .font(.system(size: 15))
                            .frame(width: 20)
                        TextField("教室", text: $roomLocation)
                        Spacer()
                    }
                    Divider()
                }
                Group {
                    Text("担当教員")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "person")
                            .font(.system(size: 15))
                            .frame(width: 20)
                        TextField("担当教員", text: $teacherName)
                        Spacer()
                    }
                    Divider()
                }
                Group {
//                    Text("単位数")
//                        .font(.system(size: 10))
//                    HStack(spacing: 16) {
//                        Image(systemName: "sum")
//                            .font(.system(size: 15))
//                            .frame(width: 20)
//                        TextField("単位数", text: $unit)
//                        Spacer()
//                    }
//                    Divider()
                }
                Group {
                    Text("授業コード")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "chevron.left.slash.chevron.right")
                            .font(.system(size: 15))
                            .frame(width: 20)
                        TextField("授業コード", text: $classCode)
                        Spacer()
                    }
                    Divider()
                }
                Spacer()
            }
            .padding(.leading)
            .navigationTitle(classes.courseName)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: registrationButton)
        }
        
    }
    var registrationButton: some View {
        Button(action: {
            editButton.toggle()
        }, label: {
            Image(systemName: "square.and.arrow.down")
                .foregroundColor(Color("TextColor"))
        })
        .alert(isPresented: $editButton) {
            Alert(title: Text("変更しますか？"),
                  message: Text("変更をすることでこの授業を登録しているすべての人に変更内容が適用されます。"),
                  primaryButton: .cancel(Text("Calcel")),
                  secondaryButton: .default(Text("OK"),
                                            action: {
                                                editRoomLocation()
                                            }))
        }
    }
    func editRoomLocation() {
        let dogRef = COLLECTION_TIMETABLE.document(classes.university!).collection("2021LH").document(classes.classId)
        let data = ["roomLocation": roomLocation,
                    "teacherName": teacherName,
                    "classCode": classCode]
        dogRef.updateData(data) { _ in
            viewModel.fetchEditClass()
            viewModel.fetchClass()
            self.showingEditClass = false

        }
    }
}

