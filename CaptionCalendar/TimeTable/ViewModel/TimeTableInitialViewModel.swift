//
//  TimeTableInitialViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/08.
//

import SwiftUI

class TimeTableInitialViewModel: ObservableObject {
    @Published var user: User
    @Published var loading = false
    
    init(user: User) {
        self.user = user
        fetchUser()
    }
    func fetchUser() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let dogRef = COLLECTION_USERS.document(uid)
        dogRef.getDocument { snapshot, _ in
            let classInfo = snapshot.map({ User(dictionary: $0.data()!)})
            self.user = classInfo!
        }
    }
}
