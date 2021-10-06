//
//  AdminClassDetailView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/12.
//

import SwiftUI

struct AdminClassDetailView: View {
    let classinfo: Admin
    @ObservedObject var viewModel: AdminClassDetailViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    Text("classID")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "command")
                            .font(.system(size: 17))
                            .frame(width: 20)
                        Text(classinfo.classId)
                            .font(.system(size: 15))
                            .bold()
                        Spacer()
                    }
                    Text("timetable")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "square.grid.3x3.topleft.fill")
                            .font(.system(size: 17))
                            .frame(width: 20)
                        Text(classinfo.timetables!)
                            .font(.system(size: 15))
                            .bold()
                        Spacer()
                    }
                }
                Divider()
                Group {
                    Text("教室")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "mappin")
                            .font(.system(size: 17))
                            .frame(width: 20)
                        Text(classinfo.roomLocation!)
                            .font(.system(size: 15))
                            .bold()
                        Spacer()
                    }
                    Text("担当教員")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "person")
                            .font(.system(size: 17))
                            .frame(width: 20)
                        Text(classinfo.teacherName!)
                            .font(.system(size: 15))
                            .bold()
                        Spacer()
                    }
                    Text("単位数")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "sum")
                            .font(.system(size: 17))
                            .frame(width: 20)
                        Text(classinfo.unit!)
                            .font(.system(size: 15))
                            .bold()
                        Spacer()
                    }
                    Text("授業コード")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "chevron.left.slash.chevron.right")
                            .font(.system(size: 17))
                            .frame(width: 20)
                        Text(classinfo.classCode!)
                            .font(.system(size: 15))
                            .bold()
                        Spacer()
                    }
                    Text("学部、研究科")
                        .font(.system(size: 10))
                    HStack(spacing: 16) {
                        Image(systemName: "graduationcap")
                            .font(.system(size: 17))
                            .frame(width: 20)
                        Text(classinfo.graduate!)
                            .font(.system(size: 15))
                            .bold()
                        Spacer()
                    }
                }
                Divider()
                AdminClassAtendView(classinfo: classinfo, viewModel: AdminClassDetailViewModel(classinfo: classinfo, classId: classinfo))
                AdminClassUnitView(classinfo: classinfo, viewModel: AdminClassDetailViewModel(classinfo: classinfo, classId: classinfo))
                Spacer()
            }
            .padding()
            .navigationTitle(classinfo.courseName)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: backButton)
        }
    }
    var backButton: some View {
        Button(action: {
            mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.down")
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }
}
