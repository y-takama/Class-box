//
//  SearchClassView.swift
//  SearchClassView
//
//  Created by 髙間洋平 on 2021/08/21.
//

import SwiftUI

struct SearchClassView: View {
    @State var searchText = ""
    @State private var selection = 0
    @Binding var dayOfWeek: String
    @Binding var timePeriod: String
    @Binding var isPresented: Bool
//    @Binding var hasTitle: Bool
    @State var isCreatingNewTimeTable = false
    @State var isCreatingClassDetail = false
    @State var showImage = false
    @ObservedObject var viewModel: SearchTimetableViewModel
    let user: User
    var body: some View {
        ZStack {
            Color("TintColor").ignoresSafeArea().onTapGesture { UIApplication.shared.closeKeyboard() }
            
            VStack {
                HStack {
                    SearchBar(text: $searchText)
                        .padding(.leading)
                    Button(action: {
                        withAnimation() {
                            showImage.toggle()
                        }
                    }, label: {
                        Image(systemName: showImage ? "chevron.up.circle" : "chevron.down.circle")
                            .font(.system(size: 20))
                                    .padding(.trailing)
                            .foregroundColor(Color("TextColor"))
                    })
                    
                }.padding(.top, 5)
                if showImage {
                    Picker("", selection: $selection) {
                        Text(user.campus!).tag(0)
                        Text(user.university!).tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                }
                
                TabView(selection: $selection) {
                    ScrollView {
                        ForEach(searchText.isEmpty ? viewModel.timetable : viewModel.filteredClass(searchText), id: \.self) { classinfo in
                            let timetablecell = dayOfWeek + timePeriod
                            NavigationLink(destination:
                                ClassDetailView(dayOfWeek: $dayOfWeek,
                                                timePeriod: $timePeriod,
                                                isPresented: $isPresented, classes: classinfo,
                                                user: user,
                                                viewModel: ClassDetailViewModel(classId: classinfo,
                                                                                timetable: timetablecell))
                            , label: {
                                ClassCell(classes: classinfo)
                            })

                        }
                        Spacer()
                    }.tag(0)
                    
//                    ScrollView {
//                        ForEach(searchText.isEmpty ? viewModel.timetable : viewModel.filteredClass(searchText), id: \.self) { classinfo in
//                            let timetablecell = dayOfWeek + timePeriod
//                            if classinfo.timetables! == timetablecell {
//                                NavigationLink(destination:
//                                    ClassDetailView(dayOfWeek: $dayOfWeek,
//                                                    timePeriod: $timePeriod,
//                                                    classes: classinfo,
//                                                    user: user,
//                                                    viewModel: ClassDetailViewModel(classId: classinfo,classInfo: classinfo, editClass: classinfo, timetable: timetablecell))
//                                , label: {
//                                    ClassCell(classes: classinfo)
//                                })
//                            }
//                        }
//                        Spacer()
//                    }.tag(1)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.top, 5)
                            
            }
            if viewModel.loading {
                ZStack {
                    Color.clear.ignoresSafeArea()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("TextColor")))
                        .scaleEffect(1)
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationBarItems(trailing: addClassButton)
        .navigationBarTitle("\(dayOfWeek)曜\(timePeriod)時限")
        .accentColor(Color("CaptionColor"))
        
        NavigationLink(destination: CreateNewClassView(dayOfWeek: $dayOfWeek,
                                                       timePeriod: $timePeriod,
                                                       isPresented: $isPresented,
                                                       user: user)
                       , isActive: $isCreatingNewTimeTable) {
        }
    }
    var addClassButton: some View {
        
        Button(action: {
            isCreatingNewTimeTable.toggle()
        }, label: {
            Image(systemName: "plus.app")
                .font(Font.system(size: 16, weight: .semibold))
                .foregroundColor(Color("TextColor"))
        })
    }
}
