//
//  AdminClassViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/12.
//

import SwiftUI

class AdminUniversityViewModel: ObservableObject {
    
    @Published var university = [Admin]()
    
    init() {
        fetchUniversity()
    }
    
    func fetchUniversity() {
        let docRef = COLLECTION_TIMETABLE
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.university = documents.map({ Admin(dictionary: $0.data()) })
        }
    }
    
}
