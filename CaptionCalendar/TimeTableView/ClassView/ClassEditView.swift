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
    @State private var unit: String
    @State private var classCode: String
    @Binding var classes: TimeTable
    @ObservedObject var viewModel: ClassDetailViewModel
    init(classes: Binding<TimeTable>) {
        self._classes = classes
        self.viewModel = ClassDetailViewModel(classId: self._classes.wrappedValue, classInfo: self._classes.wrappedValue, editClass: self._classes.wrappedValue)
        self._roomLocation = State(initialValue: _classes.wrappedValue.roomLocation ?? "")
        self._teacherName = State(initialValue: _classes.wrappedValue.teacherName ?? "")
        self._unit = State(initialValue: _classes.wrappedValue.unit ?? "")
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
                    Text("単位数")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "sum")
                            .font(.system(size: 15))
                            .frame(width: 20)
                        TextField("単位数", text: $unit)
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
                            .frame(width: 20)
                        TextField("授業コード", text: $classCode)
                        Spacer()
                    }
                    Divider()
                }
                
                Spacer()
            }
            .padding(.leading)
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: registrationButton)
        }
        
    }
    var registrationButton: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "square.and.arrow.down")
                .foregroundColor(Color("TextColor"))
        })
    }
}

