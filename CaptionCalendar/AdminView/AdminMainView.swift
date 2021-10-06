//
//  AdminClassView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/12.
//

import SwiftUI

struct AdminMainView: View {
    @ObservedObject var viewModel = AdminUniversityViewModel()
    @ObservedObject var viewModels = StudyCourseViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let user: User
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(viewModels.courceName, id: \.self) { courcename in
                    NavigationLink(destination: AdminStudyView(viewModel: StudyContentViewModel(content: courcename), cource: courcename, user: user), label: {
                        Text(courcename.courseName!)
                            .font(.system(size: 15))
                            .bold()
                    })
                }
                Divider()
                ForEach(viewModel.university, id: \.self) { classinfo in
                    NavigationLink(destination: AdminClassView(classinfo: classinfo, viewModel: AdminClassDetailViewModel(classinfo: classinfo, classId: classinfo)).navigationTitle(classinfo.university!), label: {
                        Text(classinfo.university!)
                            .font(.system(size: 15))
                            .bold()
                    })
                }
                Spacer()
            }
            .padding()
            .foregroundColor(Color("TextColor"))
            .navigationBarItems(trailing: backButton)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("University")
        }
    }
    var backButton: some View {
        Button(action: {
            mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.down")
                .foregroundColor(Color("TextColor"))
        })
    }
}
