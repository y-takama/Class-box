//
//  AuthViewModel.swift
//  AuthViewModel
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
//    @Published var userSessions: FirebaseAuth.User?
//    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var currentUser: User?
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
//            print("DEBUG3\(user)")
        }
    }
    
    func signin(result: AuthDataResult?) {
        guard let user = result?.user else { return }
        self.userSession = user
        self.fetchUser()
    }
    
    func registerUser(email: String, password: String, result: AuthDataResult?) {
        guard let user = result?.user else { return }
        let data = ["email": email,
                    "uid": user.uid]
        Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func registerStudentUser(email: String,
                             fullname: String,
                             password: String,
                             university: String,
                             campus: String,
                             result: AuthDataResult?) {
        guard let user = result?.user else { return }
        print("DEBUG\(user)")
        let data = ["email": email,
                    "fullname": fullname.lowercased(),
                    "uid": user.uid,
                    "university": university,
                    "campus": campus,
                    "userStats": "student",
                    "profileImageUrl": ""]
        Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
//            self.userSession = user
//            self.fetchUser()
            print("DEBUG1\(String(describing: self.userSession))")
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
//        print("DEBUG4\(String(describing: userSession?.uid))")
        guard let uid = userSession?.uid else { return }
//        print("DEBUG5\(uid)")
        
        
//        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
//            print("DEBUG6\(String(describing: snapshot))")
//            guard let user = try? snapshot?.data(as: User.self) else { return }
//            print("DEBUG2\(user)")
//            self.currentUser = user
//        }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            self.currentUser = User(dictionary: data)
//            guard let user = try? snapshot?.data(as: User.self) else { return }
//            self.users = user
            
        }
        
    }
}
