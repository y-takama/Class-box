//
//  SearchClassView.swift
//  SearchClassView
//
//  Created by 髙間洋平 on 2021/08/21.
//

import SwiftUI

struct SearchClassView: View {
    @State var searchText = ""
    @Binding var dayOfWeek: String
    @Binding var timePeriod: String
    @Binding var isPresented: Bool
    @State var isCreatingNewTimeTable = false
    @State var isCreatingClassDetail = false
    @ObservedObject var viewModel = SearchClassViewModel()
    let user: User
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding(.horizontal)
            ForEach(viewModel.timetable, id: \.self) { classinfo in
                let timetablecell = dayOfWeek + timePeriod
                if classinfo.timetables! == timetablecell {
                    NavigationLink(destination:
                        ClassDetailView(dayOfWeek: $dayOfWeek,
                                        timePeriod: $timePeriod,
                                        classes: classinfo,
                                        user: user,
                                        viewModels: ClassDetailViewModel(classId: classinfo,
                                                                         classInfo: classinfo, editClass: classinfo))
                        //                                    .navigationBarHidden(true)
                    , label: {
                        ClassCell(classes: classinfo)
                    })
                }
            }
            Spacer()
        }
        .navigationBarItems(trailing: addClassButton)
        .navigationBarTitle("\(dayOfWeek)曜\(timePeriod)時限")
        .accentColor(Color("CaptionColor"))
        
    }
    var addClassButton: some View {
        Button(action: {
            isCreatingNewTimeTable.toggle()
        }, label: {
            Image(systemName: "plus")
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        }).fullScreenCover(isPresented: $isCreatingNewTimeTable){
            CreateNewClassView(isPresented:$isCreatingNewTimeTable,
                               dayOfWeek: $dayOfWeek,
                               timePeriod: $timePeriod,
                               timeTable: nil)
        }
    }
}
