//
//  StudyCourseViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/17.
//

import SwiftUI

class StudyCourseViewModel: ObservableObject {
    
    @Published var textbookName = [Textbook]()
    
    init() {
        fetchCource()
    }
    
    func fetchCource() {
        let docRef = COLLECTION_TEXTBOOK
        print("bbbbbbbb")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.textbookName = documents.map({ Textbook(dictionary: $0.data()) })
        }
    }
}
