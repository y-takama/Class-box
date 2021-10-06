//
//  DetailDayView.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/08/10.
//

import SwiftUI

struct DetailDayView: View {
    @Binding var year : Int
    @Binding var month : Int
    @Binding var data : Int
    @ObservedObject var eventsRepository = EventsRepository.shared
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.gray.opacity(0.3).ignoresSafeArea()
            VStack {
                HStack{
                    Text(String(self.month)+"月"+String(self.data)+"日")
                        .font(.headline)
                    Spacer()
                }
                .padding(18)
                
                VStack {
                    ForEach(eventsRepository.events ?? [], id: \.self) { event in
                        let selectedData = String(format: "%04d",self.year)+String(format: "%02d",self.month)+String(format: "%02d",self.data)
                        if DetailDayView.dateFormatter.string(from: event.startDate) == selectedData || (DetailDayView.dateFormatter.string(from: event.startDate) < selectedData && DetailDayView.dateFormatter.string(from: event.endDate) >= selectedData) {
                            CalendarDetailRowView(event: event)
                                .padding(.horizontal, 10)
    //                            .onTapGesture {
    //                                selectedEvent = event
    //                                self.showEditFor(event)
    //
    //                            }
    //                            .sheet(isPresented: $showingEditSheet) {
    //                                EventEditView(eventStore: self.eventsRepository.eventStore, event: selectedEvent)
    //                                    .ignoresSafeArea()
    //                            }
                        }
                    }
                    
//                    Spacer()
//                    AdView()
//                        .frame(width: UIScreen.main.bounds.width,
//                               height: UIScreen.main.bounds.width*5/32)
//                        .padding(.top, 80)
                    
                }
            }
            .frame(width: UIScreen.main.bounds.width-30)
            
            .background(Color("TintColor"))
            .cornerRadius(15)
//            .animation(.default)
            .padding(.top, UIScreen.main.bounds.height/10)
//            .animation(.spring())
        }
    }
    private static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        //        formatter.timeStyle = .short
        formatter.dateFormat = "YYYYMMdd"
        return formatter
    }()
}
