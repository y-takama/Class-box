//
//  StudyContentDetailViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/18.
//

import SwiftUI

class StudyContentDetailViewModel: ObservableObject {
    
    @Published var contents = [Textbook]()
//    @Published var userinfo = [Textbook]()
    @Published var detail: Textbook
//    @Published var timetable = [Admin]()
    
    init(detail: Textbook) {
        self.detail = detail
//        fetchContent()
    }
    
    func fetchContent() {
        let docRef = COLLECTION_TEXTBOOK.document(detail.textbookID ?? "").collection("course").document(detail.courseID ?? "").collection("question")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let contentName = documents.map({ Textbook(dictionary: $0.data()) })
            self.contents = contentName.sorted(by: { (a, b) -> Bool in
                return a.order! < b.order!
            })
        }
    }
//    func userStatus() {
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
//        let docRef = COLLECTION_USERS.document(uid).collection("textbook").document(detail.textbookID!).collection("contents")
//        docRef.getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            self.userinfo = documents.map({ Textbook(dictionary: $0.data()) })
//
//        }
//    }
}
