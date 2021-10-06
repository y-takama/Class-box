//
//  AdminClassAtendView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/13.
//

import SwiftUI

struct AdminClassAtendView: View {
    let classinfo: Admin
    @ObservedObject var viewModel: AdminClassDetailViewModel
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                viewModel.fetchBeforeattendanceNone()
                viewModel.fetchClassDetail()
            }, label: {
                VStack {
                    Text("なし")
                        .frame(width: 28, height: 28)
                        .padding(10)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                        
                    Text(String(viewModel.classinfo.beforeattendanceNone!))
                }
                .foregroundColor(Color("TextColor"))
                .font(.system(size: 13, weight: .semibold))
                
            })
            Button(action: {
                viewModel.fetchBeforeattendanceSometimes()
                viewModel.fetchClassDetail()
            }, label: {
                VStack {
                    Text("時々")
                        .font(.system(size: 13, weight: .semibold))
                        .frame(width: 28, height: 28)
                        .padding(10)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                    Text(String(viewModel.classinfo.beforeattendanceSometimes!))
                }
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(Color("TextColor"))
                
            })
            Button(action: {
                viewModel.fetchBeforeattendanceEverytime()
                viewModel.fetchClassDetail()
            }, label: {
                VStack {
                    Text("毎回")
                        .frame(width: 28, height: 28)
                        .padding(10)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                    Text(String(viewModel.classinfo.beforeattendanceEverytime!))
                }
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(Color("TextColor"))
                
            })
            Button(action: {
                viewModel.fetchBeforeattendanceReport()
                viewModel.fetchClassDetail()
            }, label: {
                VStack {
                    Text("レポ")
                        .frame(width: 28, height: 28)
                        .padding(10)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                    Text(String(viewModel.classinfo.beforeattendanceReport!))
                }
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(Color("TextColor"))
                
            })
            Button(action: {
                viewModel.fetchBeforeattendanceNotClear()
                viewModel.fetchClassDetail()
            }, label: {
                VStack {
                    Text("その他")
                        .font(.system(size: 12, weight: .semibold))
                        .frame(width: 36, height: 36)
                        .padding(6)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                    Text(String(viewModel.classinfo.beforeattendanceNotClear!))
                        .font(.system(size: 13, weight: .semibold))
                }
                .foregroundColor(Color("TextColor"))
                
            })
            Spacer()
        }
    }
}
