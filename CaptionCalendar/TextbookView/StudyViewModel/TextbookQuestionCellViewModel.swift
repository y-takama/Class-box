//
//  TextbookQuestionCellViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/13.
//

import SwiftUI

class TextbookQuestionCellViewModel: ObservableObject {
    
//    @Published var contents = [Textbook]()
    @Published var textbook: Textbook
    
    init(textbook: Textbook) {
        self.textbook = textbook
        userStatus()
    }
    func userStatus() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let docRef = COLLECTION_USERS.document(uid).collection("textbook").document(textbook.textbookID!).collection(textbook.courseID!).document(textbook.questionID!)
        docRef.getDocument { snapshot, err in
            if err == nil && snapshot != nil {
                let Info = snapshot.map({ Textbook(dictionary: $0.data() ?? [:])})
                self.textbook = Info!
            } else {
                return
            }
        }
    }
}
