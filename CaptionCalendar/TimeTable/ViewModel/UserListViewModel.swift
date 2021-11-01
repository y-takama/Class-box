//
//  UserListViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/21.
//

import SwiftUI
import Firebase

class UserListViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
        
//    func tweets(forFilter filter: TweetFilterOptions) -> [Tweet] {
//        switch filter {
//        case .tweets: return userTweets
//        case .likes: return likedTweets
//        case .replies: return replies
//        }
//    }
}

// MARK: - API

extension UserListViewModel {
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(user.id!).collection("user-followers")
        
        followingRef.document(user.id!).setData([:]) { _ in
            followersRef.document(currentUid).setData([:]) { _ in
                self.user.isFollowed = true
//                self.user.stats!.followers += 1
                NotificationViewModel.uploadNotification(toUid: self.user.id!, type: .follow)
            }
        }
    }
    
    func unfollow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(user.id!).collection("user-followers")
        
        followingRef.document(user.id!).delete { _ in
            followersRef.document(currentUid).delete { _ in
                self.user.isFollowed = false
//                self.user.stats!.followers -= 1
                NotificationViewModel.deleteNotification(toUid: self.user.id!)
            }
        }
    }
    
    func checkIfUserIsFollowed() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        
        followingRef.document(user.id!).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.user.isFollowed = isFollowed
        }
    }
    
    
//    func fetchUserStats() {
//        UserService.fetchUserStats(user: self.user) { stats in
//            self.user.stats = stats
//        }
//    }
}
