//
//  ExplanationViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/19.
//

import SwiftUI

class ExplanationViewModel: ObservableObject {
    
    @Published var contentName = [Study]()
    @Published var content: Study
//    @Published var timetable = [Admin]()
    
    init(content: Study) {
        self.content = content
        fetchContent()
    }
    
    func fetchContent() {
        let docRef = COLLECTION_STUDY.document(content.courseID ?? "").collection("explanation")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let contentName = documents.map({ Study(dictionary: $0.data()) })
            self.contentName = contentName.sorted(by: { (a, b) -> Bool in
                return a.order! < b.order!
            })
        }
    }
}