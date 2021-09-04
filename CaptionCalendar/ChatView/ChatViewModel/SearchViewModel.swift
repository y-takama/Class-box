//
//  SearchViewModel.swift
//  SearchViewModel
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
import Firebase

enum SearchViewModelConfiguration {
    case followers(String)
    case following(String)
    case likes(String)
    case search
    case newMessage
}

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    private let config: SearchViewModelConfiguration
    
    init(config: SearchViewModelConfiguration) {
        self.config = config
        fetchUsers(forConfig: config)
    }
    
//    func fetchUsers(forConfig config: SearchViewModelConfiguration) {
//        COLLECTION_USERS.getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            let users = documents.compactMap({ try? $0.data(as: User.self)})
//
//            switch config {
//            case .newMessage:
//                self.users = users.filter({ !$0.isCurrentUser })
//            case .search:
//                self.users = users
//            }
//        }
//    }
    
    func fetchUsers() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: User.self) }).filter({ $0.id != currentUid })
        }
    }

    
    func fetchUsers(forConfig config: SearchViewModelConfiguration) {
        switch config {
        case .followers(let uid):
            fetchFollowerUsers(forUid: uid)
        case .following(let uid):
            fetchFollowingUsers(forUid: uid)
        case .likes(let tweedId):
            fetchPostLikesUsers(forPostId: tweedId)
        case .search, .newMessage:
            fetchUsers()
        }
    }
    
    private func fetchPostLikesUsers(forPostId captionId: String) {
        COLLECTION_POSTS.document(captionId).collection("caption-likes").getDocuments { snapshot, _ in
            self.fetchUsers(snapshot)
        }
    }
    
    private func fetchFollowerUsers(forUid uid: String) {
        COLLECTION_FOLLOWERS.document(uid).collection("user-followers").getDocuments { snapshot, _ in
            self.fetchUsers(snapshot)
        }
    }
    
    private func fetchFollowingUsers(forUid uid: String) {
        COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments { snapshot, _users in
            self.fetchUsers(snapshot)
        }
    }
    
    private func fetchUsers(_ snapshot: QuerySnapshot?) {
        guard let documents = snapshot?.documents else { return }
        
        documents.forEach { doc in
            UserService.fetchUser(withUid: doc.documentID) { user in
                self.users.append(user)
            }
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.uid!.contains(lowercasedQuery)})
        
    }
}
