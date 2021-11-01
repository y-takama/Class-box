//
//  StudyContentViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/17.
//

import SwiftUI

class StudyContentViewModel: ObservableObject {
    
    @Published var contentName = [Textbook]()
    @Published var tabItems = [Textbook]()
    @Published var content: Textbook
//    @Published var timetable = [Admin]()
    
    init(content: Textbook) {
        self.content = content
        fetchContent()
        fetchTab()
    }
    
    func fetchContent() {
        let docRef = COLLECTION_TEXTBOOK.document(content.textbookID ?? "").collection("course")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let contentName = documents.map({ Textbook(dictionary: $0.data()) })
            self.contentName = contentName.sorted(by: { (a, b) -> Bool in
                return a.order! < b.order!
            })
        }
    }
    func fetchTab() {
        let docRef = COLLECTION_TEXTBOOK.document(content.textbookID ?? "").collection("tab_items").order(by: "order")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.tabItems = documents.map({ Textbook(dictionary: $0.data()) })
        }
    }
}
