//
//  TextbookCourseCellViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/13.
//

import SwiftUI

class TextbookCourseCellViewModel: ObservableObject {
    
    @Published var course = [Textbook]()
    @Published var textbook: Textbook
    
    init(textbook: Textbook) {
        self.textbook = textbook
        userStatus()
    }
    func userStatus() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let docRef = COLLECTION_USERS.document(uid).collection("textbook").document(textbook.textbookID!).collection(textbook.courseID!)
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.course = documents.map({ Textbook(dictionary: $0.data())})
            
        }
    }
}
