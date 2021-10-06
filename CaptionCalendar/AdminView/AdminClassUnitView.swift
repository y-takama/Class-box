//
//  AdminClassUnitView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/13.
//

import SwiftUI

struct AdminClassUnitView: View {
    let classinfo: Admin
    @ObservedObject var viewModel: AdminClassDetailViewModel
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                viewModel.fetchBeforeunit1()
                viewModel.fetchClassDetail()
            }, label: {
                VStack {
                    Text("難")
                        .frame(width: 28, height: 28)
                        .padding(10)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                        
                    Text(String(viewModel.classinfo.beforeunit1!))
                }
                .foregroundColor(Color("TextColor"))
                .font(.system(size: 13, weight: .semibold))
                
            })
            Button(action: {
                viewModel.fetchBeforeunit2()
                viewModel.fetchClassDetail()
            }, label: {
                VStack {
                    Text("")
                        .font(.system(size: 13, weight: .semibold))
                        .frame(width: 28, height: 28)
                        .padding(10)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                    Text(String(viewModel.classinfo.beforeunit2!))
                }
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(Color("TextColor"))
                
            })
            Button(action: {
                viewModel.fetchBeforeunit3()
                viewModel.fetchClassDetail()
            }, label: {
                VStack {
                    Text("普通")
                        .frame(width: 28, height: 28)
                        .padding(10)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                    Text(String(viewModel.classinfo.beforeunit3!))
                }
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(Color("TextColor"))
                
            })
            Button(action: {
                viewModel.fetchBeforeunit4()
                viewModel.fetchClassDetail()
            }, label: {
                VStack {
                    Text("")
                        .frame(width: 28, height: 28)
                        .padding(10)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                    Text(String(viewModel.classinfo.beforeunit4!))
                }
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(Color("TextColor"))
                
            })
            Button(action: {
                viewModel.fetchBeforeunit5()
                viewModel.fetchClassDetail()
            }, label: {
                VStack {
                    Text("楽")
                        .font(.system(size: 12, weight: .semibold))
                        .frame(width: 36, height: 36)
                        .padding(6)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                    Text(String(viewModel.classinfo.beforeunit5!))
                        .font(.system(size: 13, weight: .semibold))
                }
                .foregroundColor(Color("TextColor"))
                
            })
            Spacer()
        }
    }
}
