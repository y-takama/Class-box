//
//  CalendarListView.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import SwiftUI
import EventKit
import Combine

struct CalendarListView: View {
    enum ActiveSheet {
        case calendarChooser
        case calendarEdit
    }
    let user: User
    @State private var showingEditSheet = false
    @State private var showingSheet = false
    @State private var showingMenu: Bool = false
    @State private var activeSheet: ActiveSheet = .calendarChooser
    @ObservedObject var eventsRepository = EventListRepository.shared
    @State private var selectedEvent: EKEvent?
    
    func showEditFor(_ event: EKEvent) {
        activeSheet = .calendarEdit
        selectedEvent = event
        showingEditSheet = true
    }
    
    var body: some View {
//        NavigationView {
            ScrollView {
                VStack {
                    if eventsRepository.events?.isEmpty ?? true {
                        Text("カレンダーを選択してください")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    ForEach(eventsRepository.events ?? [], id: \.self) { event in
                        EventRow(event: event)
                            .onTapGesture {
    //                                    showingEditSheet = true
    //                                    self.activeSheet = .calendarEdit
                                self.showEditFor(event)
                            }
                            .sheet(isPresented: $showingEditSheet) {
                                EventEditView(eventStore: self.eventsRepository.eventStore, event: self.selectedEvent)
                                    .ignoresSafeArea()
                            }
                    }
                }.padding(.horizontal)
            }
//            .navigationBarItems(trailing: CalendarListSettingButton)
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarItems(trailing: CalendarListSettingButton)
//            .navigationBarItems(leading: menuButton)
//        }
        .sheet(isPresented: $showingSheet) {
            CalendarChooser(calendars: self.$eventsRepository.selectedCalendars, eventStore: self.eventsRepository.eventStore)
                .ignoresSafeArea()
        }
        .sheet(isPresented: $showingEditSheet) {
            EventEditView(eventStore: self.eventsRepository.eventStore, event: nil)
                .ignoresSafeArea()
        }
    }
    
    var CalendarListSettingButton: some View {
        
        Menu {
            Button(action: {
                showingSheet.toggle()
            }) {
                Text("カレンダーを追加")
                Image(systemName: "calendar.badge.plus")
            }
            
            Button(action: {
                showingEditSheet.toggle()
            }) {
                Text("予定を追加")
                Image(systemName: "plus")
            }
            Button(action: {}) {
                Text("カレンダーを登録する")
                Image(systemName: "calendar.badge.exclamationmark")
            }
            Button(action: {}) {
                Text("CalendarListの使い方を見る")
                Image(systemName: "doc")
            }
        } label: {
            Image(systemName: "ellipsis")
//                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(Color("TextColor"))
        }
    }}
