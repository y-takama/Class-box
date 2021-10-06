//
//  StudyNextContentView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/20.
//

import SwiftUI

class StudyNextContentView: ObservableObject {
    
    @Published var contents = [Study]()
    @Published var detail: Study
//    @Published var timetable = [Admin]()
    
    init(detail: Study) {
        self.detail = detail
        fetchNextContent()
    }
    
    func fetchNextContent() {
        if detail.nextID != "" {
            let courseID = detail.courseID!
            let detailID = detail.detailID!
            let nextID = detail.nextID!
            COLLECTION_STUDY.document(courseID).collection("contents").document(detailID).collection("question").document(nextID).getDocument { snapshot, _ in
                guard let documents = snapshot.map({ Study(dictionary: $0.data()!)}) else { return }
                self.detail = documents
            }
        }
    }
}
//COLLECTION_TIMETABLE.document(user.university!).collection("LH").document(ClassId).getDocument { snapshot, _ in
//    let editclass = snapshot.map({ TimeTable(dictionary: $0.data()!)})
//    self.editClass = editclass!
//}
