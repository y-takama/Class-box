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
//    @State private var showingEditSheet = false
    @State private var selection = "2"
    @State private var courseName = ""
    @State private var teacherName = ""
    @State private var teacherName2 = ""
    @State private var classcode = ""
    @State private var className = ""
    @ObservedObject var viewModel: TimeTableViewModel
    let unit = ["0", "0.5", "1", "1.5", "2", "3", "4", "5"]
//    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var timeTable: TimeTable?
    
    init(isPresented: Binding<Bool>, dayOfWeek: Binding<String>, timePeriod: Binding<String>, timeTable: TimeTable?) {
        self._isPresented = isPresented
        self._dayOfWeek = dayOfWeek
        self._timePeriod = timePeriod
        self.viewModel = TimeTableViewModel(isPresented: isPresented, timeTable: timeTable)
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    Group {
                        HStack{
                            Text("講座名")
                            Text("必須")
                                .font(.system(size: 10, weight: .semibold))
                                .frame(width: 30, height: 14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color("TextColor"), lineWidth: 0.5)
                                )
                                .foregroundColor(Color("TextColor"))
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
                    Text("選択値：\(selection)")
                    Spacer()
                    
                    Button(action: {
                        viewModel.uploadTimeTable(courseName: courseName,
                                                  roomLocation: className,
                                                  teacherName: teacherName,
                                                  teacherName2: teacherName2,
                                                  unit: selection,
                                                  classCode: classcode,
                                                  dayOfWeek: dayOfWeek,
                                                  timePeriod: timePeriod)
                    }, label: {
                        HStack {
                            Spacer()
                            Text("作成")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color.white)
                                .frame(width: 120, height: 40)
                                .background(Color(red: 104/255, green: 171/255, blue: 121/255))
                                .cornerRadius(10)
                            Spacer()
                        }
                    })
                    Spacer()
                }
                .navigationBarItems(trailing: backButton)
                .padding()
                .navigationBarTitle("\(dayOfWeek)曜\(timePeriod)時限")
            }
        }
    }
    var backButton: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(Color("TextColor"))
        })
    }
}
