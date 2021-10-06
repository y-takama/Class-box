//
//  AttendanceListView.swift
//  AttendanceListView
//
//  Created by 髙間洋平 on 2021/08/28.
//

import SwiftUI

struct AttendanceListView: View {
    let classes: TimeTable
//    @State private var isDeleteButton = false
    @ObservedObject var viewModel: AttendanceListViewModel
    var body: some View {
        
        List {
//            Text("\(viewModel.classinfo.attendance!)")
            ForEach(viewModel.attendanceList, id: \.self) { list in
                NavigationLink(destination:
                                ClassUserNote(viewModel: ClassUserNoteViewModel(classInfo: classes), classes: list)
                , label: {
                    VStack(spacing: 4) {
                        Text(list.status)
                            .font(.headline)
//                            .padding()
                        Text(list.TimestampString)
                            .modifier(SecondaryCaptionTextStyle())
                    }
                })
                
            }
        }
        .onAppear {
            viewModel.AttendanceList()
        }
        .listStyle(PlainListStyle())
    }
}
