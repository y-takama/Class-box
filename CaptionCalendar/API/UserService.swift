//
//  UserService.swift
//  UserService
//
//  Created by 髙間洋平 on 2021/08/24.
//

import Firebase

typealias FirestoreCompletion = ((Error?) -> Void)?

struct UserService {
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }

        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).getDocument { (snapshot, error) in
            guard let isFollowed = snapshot?.exists else { return }
            completion(isFollowed)
        }
    }
    
    static func fetchUserStats(user: User, completion: @escaping(UserStats) -> Void) {
        guard let uid = user.id else { return }
        let followersRef = COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
        let followingRef = COLLECTION_FOLLOWING.document(uid).collection("user-following")

        followersRef.getDocuments { snapshot, _ in
            guard let followerCount = snapshot?.documents.count else { return }

            followingRef.getDocuments { snapshot, _ in
                guard let followingCount = snapshot?.documents.count else { return }

                completion(UserStats(followers: followerCount, following: followingCount))
            }
        }
    }
//
//    static func follow(uid: String, completion: ((Error?) -> Void)?) {
//        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
//
//        COLLECTION_FOLLOWING.document(currentUid)
//            .collection("user-following").document(uid).setData([:]) { _ in
//                COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
//                    .document(currentUid).setData([:], completion: completion)
//            }
//    }
//
//    static func unfollow(uid: String, completion: ((Error?) -> Void)?) {
//        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
//
//        COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
//            .document(uid).delete { _ in
//                COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
//                    .document(currentUid).delete(completion: completion)
//            }
//    }
//
//    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void) {
//        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
//
//        COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
//            .document(uid).getDocument { snapshot, _ in
//                guard let isFollowed = snapshot?.exists else { return }
//                completion(isFollowed)
//            }
//    }
//
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
//            guard let user = try? snapshot?.data(as: User.self) else { return }
            guard let user = snapshot.map({ User(dictionary: $0.data()!)}) else { return }
            completion(user)
        }
    }
}
