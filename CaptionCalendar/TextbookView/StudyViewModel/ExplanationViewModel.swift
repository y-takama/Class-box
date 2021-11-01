//
//  ExplanationViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/19.
//

import SwiftUI

class ExplanationViewModel: ObservableObject {
    
    @Published var contentName = [Textbook]()
    @Published var content: Textbook
//    @Published var timetable = [Admin]()
    
    init(content: Textbook) {
        self.content = content
        fetchContent()
    }
    
    func fetchContent() {
        let docRef = COLLECTION_TEXTBOOK.document(content.textbookID ?? "").collection("explanation")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let contentName = documents.map({ Textbook(dictionary: $0.data()) })
            self.contentName = contentName.sorted(by: { (a, b) -> Bool in
                return a.order! < b.order!
            })
        }
    }
}
