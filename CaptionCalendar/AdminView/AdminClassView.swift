//
//  AdminClassView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/12.
//

import SwiftUI

struct AdminClassView: View {
    let classinfo: Admin
    @State var searchText = ""
//    @State var showClass = false
    @ObservedObject var viewModel: AdminClassDetailViewModel
    
    var body: some View {
        ZStack {
            Color("TintColor").ignoresSafeArea().onTapGesture { UIApplication.shared.closeKeyboard() }
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                ScrollView {
                    VStack {
                        ForEach(searchText.isEmpty ? viewModel.classInfo : viewModel.filteredClass(searchText), id: \.self) { classinfo in
                            NavigationLink(destination: {
                                AdminClassDetailView(classinfo: classinfo, viewModel: AdminClassDetailViewModel(classinfo: classinfo, classId: classinfo))
                            }, label: {
                                HStack {
                                    let classvalues = classinfo.courseName
                                    let start = String(classvalues.prefix(1))
                                    Text(start)
                                        .font(.system(size: 20, weight: .semibold))
                                        .frame(width: 26, height: 26)
                                        .padding(10)
                                        .clipShape(Circle())
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 23)
                                                .stroke(Color.gray, lineWidth: 0.3)
                                        )
                                        .foregroundColor(Color("TextColor"))
                                    VStack(alignment: .leading) {
                                        Text(classinfo.courseName)
                                            .bold()
                                            .foregroundColor(Color("TextColor"))
                                        Text(classinfo.classCode!)
                                            .font(.system(size: 10))
                                            .modifier(SecondaryCaptionTextStyle())
                                        
                                    }
                                    .padding(.leading)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .padding(.vertical, 5)
                            })
                        }
                    }.padding(.horizontal)
                    
                }
            }
            
            
            if viewModel.loading {
                ZStack {
                    Color("TextColor").opacity(0.03).ignoresSafeArea()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("TextColor")))
                        .scaleEffect(2)
                }
            }
        }
    }
}
