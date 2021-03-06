//
//  EventsRepository.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/25.
//

import Foundation
import EventKit
import SwiftUI
import Combine

typealias Action = () -> ()

class EventsRepository: ObservableObject {
    static let shared = EventsRepository()
    private var subscribers: Set<AnyCancellable> = []
    let eventStore = EKEventStore()
    @Published var selectedCalendars: Set<EKCalendar>?
    @Published var events: [EKEvent]?
    
    private init() {
        selectedCalendars = loadSelectedCalendars()
        
        if selectedCalendars == nil {
            if EKEventStore.authorizationStatus(for: .event) == .authorized {
                selectedCalendars = Set([eventStore.defaultCalendarForNewEvents].compactMap({ $0 }))
            }
        }
        
        $selectedCalendars.sink { [weak self] (calendars) in
            self?.saveSelectedCalendars(calendars)
            self?.loadAndUpdateEvents()
        }.store(in: &subscribers)
        
        NotificationCenter.default.publisher(for: .eventsDidChange)
            .sink { [weak self] (notification) in
                self?.loadAndUpdateEvents()
                
            }.store(in: &subscribers)
        
        NotificationCenter.default.publisher(for: .EKEventStoreChanged)
            .sink { [weak self] (notification) in
                self?.loadAndUpdateEvents()
            }
            .store(in: &subscribers)
    }
    
    private func loadSelectedCalendars() -> Set<EKCalendar>? {
        if let identifiers = UserDefaults.standard.stringArray(forKey: "CalendarIdentifiers") {
            let calendars = eventStore.calendars(for: .event).filter({ identifiers.contains($0.calendarIdentifier) })
            guard !calendars.isEmpty else { return nil }
            return Set(calendars)
        } else {
            return nil
        }
    }
    
    private func saveSelectedCalendars(_ calendars: Set<EKCalendar>?) {
        if let identifiers = calendars?.compactMap({ $0.calendarIdentifier }) {
            UserDefaults.standard.set(identifiers, forKey: "CalendarIdentifiers")
        }
    }
    
    private func loadAndUpdateEvents() {
        loadEvents(completion: { (events) in
            DispatchQueue.main.async {
                self.events = events
                print(events as Any)
            }
        })
    }
    
    func requestAccess(onGranted: @escaping Action, onDenied: @escaping Action) {
        eventStore.requestAccess(to: .event) { (granted, error) in
            if granted {
                onGranted()
            } else {
                onDenied()
            }
        }
    }
    
    func loadEvents(completion: @escaping (([EKEvent]?) -> Void)) {
        requestAccess(onGranted: {
            let weekFromNow = Date().advanced(by: TimeInterval.twoweek)
            let day = Date()
            let Date = Calendar.current.date(byAdding: .month, value: -1, to: day)!
//            let modifiedDate = Calendar.current.date(byAdding: .month, value: -5, to: day)!
//            let weekFromNow = Date().
            let predicate = self.eventStore.predicateForEvents(withStart: Date, end: weekFromNow, calendars: Array(self.selectedCalendars ?? []))
            let events = self.eventStore.events(matching: predicate)
            
            completion(events)
        }) {
            completion(nil)
        }
    }
    
    deinit {
        subscribers.forEach { (sub) in
            sub.cancel()
        }
    }
}
