//
//  MainTableViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/08.
//

import SwiftUI

class MainTableViewModel: ObservableObject {
    @Published var timetable = [TimeTable]()
    @Published var loading = false
    
    init() {
        fetchTimeTable()
    }
    
    func fetchTimeTable() {
        COLLECTION_TIMETABLE.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.timetable = documents.map({ TimeTable(dictionary: $0.data()) })
            
        }
    }
}
