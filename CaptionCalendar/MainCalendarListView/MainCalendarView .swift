//
//  MainCalendarView .swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import SwiftUI
import UIKit
import FSCalendar
import EventKitUI

struct MainCalendarView: View {
    @State var selentedDate: Date = Date()
    @State var isShowingEventView = false
    @State private var showingEditSheet = false
    @ObservedObject var eventsRepository = EventsRepository.shared
    @State private var selectedEvent: EKEvent?
    
    var body: some View {
        
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                CalendarRepresentable(selectedDate: $selentedDate)
                    .frame(width: UIScreen.main.bounds.width-10,
                           height: UIScreen.main.bounds.height*9/10,
                           alignment: .top)
                    .padding(5)
                    .padding(.bottom, 100)
                
                ForEach(eventsRepository.events ?? [], id: \.self) { event in
                    EventRow(event: event)
                        .onTapGesture {
                            self.showEditFor(event)
                        }
                        .sheet(isPresented: $showingEditSheet) {
                            EventEditView(eventStore: self.eventsRepository.eventStore, event: self.selectedEvent)
                                .ignoresSafeArea()
                        }
                }.padding(.horizontal)
            }
            
            
            HStack {
                Button(action:
                        {  }
                       , label: {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .resizable()
                            .foregroundColor(Color("TintColor"))
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(13)
                       })
                    .background(Color("CaptionColor"))
                    .cornerRadius(27)
                
                Button(action:
                        { showingEditSheet = true }
                       , label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color("TintColor"))
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(16)
                       })
                    .sheet(isPresented: $showingEditSheet) {
                        EventEditView(eventStore: self.eventsRepository.eventStore, event: self.selectedEvent)
                            .ignoresSafeArea()
                    }
                    .background(Color("CaptionColor"))
                    .cornerRadius(27)
                    .padding(.leading)
            }
            .padding(12)
            .sheet(isPresented: $isShowingEventView,
                   content: {
            })
            
        }
    }
    func showEditFor(_ event: EKEvent) {
        showingEditSheet = true
        selectedEvent = event
    }
    
}
