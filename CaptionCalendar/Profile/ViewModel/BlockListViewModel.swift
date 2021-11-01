//
//  BlockListViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/21.
//

import SwiftUI

class BlockListViewModel: ObservableObject {
    
    @Published var blockList = [User]()
    
    init() {
        fetchList()
    }
    
    func fetchList() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let docRef = COLLECTION_USERS.document(uid).collection("bloakList")
        print("bbbbbbbb")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.blockList = documents.map({ User(dictionary: $0.data()) })
        }
    }
}
