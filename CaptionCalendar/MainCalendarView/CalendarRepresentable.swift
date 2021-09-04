//
//  CalendarRepresentable.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

//import SwiftUI
//import UIKit
//import FSCalendar
//import EventKit
//
//struct CalendarRepresentable: UIViewRepresentable {
//    
//    typealias UIViewType = FSCalendar
//    
//    var calendar = FSCalendar()
////    private let event: EKEvent
//    
//    
//    @Binding var selectedDate: Date
//    @ObservedObject var eventsRepository = EventsRepository.shared
//    
//    func updateUIView(_ uiView: FSCalendar, context: Context) {
//        
//    }
//    
//    func makeUIView(context: Context) -> FSCalendar {
//        calendar.delegate = context.coordinator
//        calendar.dataSource = context.coordinator
//        calendar.calendarWeekdayView.weekdayLabels[6].textColor = .systemBlue
//        calendar.calendarWeekdayView.weekdayLabels[0].textColor = .systemRed
//        calendar.appearance.titleDefaultColor = UIColor(named: "TitleText")
//        calendar.appearance.weekdayTextColor = UIColor(named: "CaptionColor")
//        calendar.appearance.headerDateFormat = "yyyy/MM"
//        calendar.appearance.headerTitleColor = UIColor(named: "TextColor")
//        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 30, weight: .semibold)
//        calendar.appearance.eventOffset = CGPoint.init(x: -1, y: -14)
//        calendar.appearance.borderRadius = 1
//                return calendar
//    } //: MAKEUI
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
////        Coordinator()
//    }
//    
//    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
////        private var parent = CalendarRepresentable.self
//        private var parent: CalendarRepresentable
//        @ObservedObject var eventsRepository = EventsRepository.shared
////        private let event = EKEvent()
//        private var formattar = DateFormatter()
//        
//        let eventsDate = [
//                    Date(),
//                    Calendar.current.date(byAdding: .day, value: +1, to: Date())!,
//                    Calendar.current.date(byAdding: .day, value: +5, to: Date())!
//                ]
//        
//        
//        init(_ parent: CalendarRepresentable) {
//            self.parent = parent
//        }
//        
//        private static var dateFormatter: DateFormatter = {
//            let formatter = DateFormatter()
//    //        formatter.timeStyle = .short
//            formatter.dateFormat = "yyyy/MM/dd"
//            return formatter
//        }()
//        
//        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//            formattar.dateFormat = "yyyy/MM/dd"
//            print("Date = \(formattar.string(from: date))")
//            
//        }
//        
//        func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
//            let formattars = DateFormatter()
//            formattars.dateFormat = "yyyy/MM/dd"
//            
////            print("DEBUG \(String(describing: eventsRepository.events))")
////            print("DEBUG \(String(describing: event.startDate))")
//            
//            eventsRepository.events?.forEach { event in
//                
//                if formattar.string(from: date) == Coordinator.dateFormatter.string(from: event.startDate) {
//                    
//                    print("DEBUG \(Coordinator.dateFormatter.string(from: event.startDate))")
//                    print("Date = \(formattar.string(from: date))")
//                    print("DEBUG \(String(describing: event.title))")
//                    let labelMy = UILabel(frame: CGRect(x: 2, y: 60, width: cell.bounds.width-5, height: 14))
//                    labelMy.font = UIFont(name: "ArialHebrew", size: 11)
//                    labelMy.text = event.title
//    //                labelMy.backgroundColor = UIColor(named: event.color)
//                    
//                    cell.addSubview(labelMy)
//                }
//            }
//        }
//        
//        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//            let formattars = DateFormatter()
//            formattars.dateFormat = "yyyy/MM/dd"
//            for eventDate in eventsDate{
//                guard let eventDate = formattars.date(from: dateFormatYMD(date: eventDate)) else { return 0 }
//                if date.compare(eventDate) == .orderedSame{
//                    return 1
//                }
//            }
//            return 0
//        }
//        func dateFormatYMD(date: Date) -> String {
//                    let df = DateFormatter()
//                    df.dateStyle = .long
//                    df.timeStyle = .none
//                    
//                    return df.string(from: date)
//                }
//        
//    }
//}

