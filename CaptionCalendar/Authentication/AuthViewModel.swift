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
    @Published var error: Error?
    @Published var currentUser: User?
    @Published var loading = false
    @Published var erralert = false
    @Published var complete = false
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
            } else {
                print("login is succecced!!!!!!!")
            }
            print("login is succecced!!!!!!!")
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func signin(result: AuthDataResult?) {
        guard let user = result?.user else { return }
        print("login is succecced!!!!!!!")
        self.userSession = user
        self.fetchUser()
    }
    
    func registerUser(email: String, password: String, fullname: String, result: AuthDataResult?) {
        guard let user = result?.user else { return }
        let data = ["email": email.lowercased(),
                    "fullname": fullname.lowercased(),
                    "username": user.uid,
                    "profileImageUrl": "",
                    "backImageUrl": "",
                    "university": "",
                    "userStats": "standard",
                    "isShowClassChat": false,
                    "uid": user.uid] as [String : Any]
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
        let data = ["email": email.lowercased(),
                    "fullname": fullname.lowercased(),
                    "username": user.uid,
                    "uid": user.uid,
                    "profileImageUrl": "",
                    "backImageUrl": "",
                    "university": university,
                    "campus": campus,
                    "userStats": "student",
                    "isShowClassChat": true] as [String : Any]
        Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
            self.userSession = user
            self.fetchUser()
            print("DEBUG1\(String(describing: self.userSession))")
        }
    }
    
    func updateStudentUser(mailAddress: String,
                             university: String,
                             campus: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let data = ["email": mailAddress.lowercased(),
                    "university": university,
                    "campus": campus,
                    "userStats": "student",
                    "usedTmetable": false,
                    "isShowClassChat": true] as [String : Any]
        Firestore.firestore().collection("users").document(user.uid!).updateData(data) { _ in
//            self.userSession = user
            self.fetchUser()
            self.complete = true
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        self.loading = true
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, err in
            if err == nil {
                guard let data = snapshot?.data() else { return }
                self.currentUser = User(dictionary: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.loading = false
                }
            } else {
                self.erralert = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.erralert = true
        }
    }
    func fetchUserSetting() {
        self.loading = true
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, err in
            if err == nil {
                guard let data = snapshot?.data() else { return }
                self.currentUser = User(dictionary: data)
                self.loading = false
            } else {
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.erralert = true
        }
    }
    
    func fetchUserSettingLoading() {
        self.erralert = false
        self.loading = true
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, err in
            if err == nil {
                guard let data = snapshot?.data() else { return }
                self.currentUser = User(dictionary: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    self.loading = false
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.erralert = true
        }
    }
}
