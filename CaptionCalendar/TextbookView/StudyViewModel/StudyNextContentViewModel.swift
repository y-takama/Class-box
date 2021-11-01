//
//  StudyNextContentView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/20.
//

import SwiftUI

class StudyNextContentView: ObservableObject {
    
    @Published var contents = [Textbook]()
    @Published var detail: Textbook
    
    init(detail: Textbook) {
        self.detail = detail
        fetchNextContent()
    }
    
    func fetchNextContent() {
        if detail.nextID != "" {
            let textbookID = detail.textbookID!
            let courseID = detail.courseID!
            let nextID = detail.nextID!
            COLLECTION_TEXTBOOK.document(textbookID).collection("course").document(courseID).collection("question").document(nextID).getDocument { snapshot, _ in
                guard let documents = snapshot.map({ Textbook(dictionary: $0.data()!)}) else { return }
                self.detail = documents
            }
        }
    }
}
