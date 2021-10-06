//
//  StudyContentDetailViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/18.
//

import SwiftUI

class StudyContentDetailViewModel: ObservableObject {
    
    @Published var contents = [Study]()
    @Published var detail: Study
//    @Published var timetable = [Admin]()
    
    init(detail: Study) {
        self.detail = detail
        fetchContent()
    }
    
    func fetchContent() {
        let docRef = COLLECTION_STUDY.document(detail.courseID ?? "").collection("contents").document(detail.detailID ?? "").collection("question")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let contentName = documents.map({ Study(dictionary: $0.data()) })
            self.contents = contentName.sorted(by: { (a, b) -> Bool in
                return a.order! < b.order!
            })
        }
    }
    func nextContent() {
        
    }
}
