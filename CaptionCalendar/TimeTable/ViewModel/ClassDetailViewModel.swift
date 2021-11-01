//
//  ClassDetailViewModel.swift
//  ClassDetailViewModel
//
//  Created by 髙間洋平 on 2021/08/25.
//

import SwiftUI
import Firebase

class ClassDetailViewModel: ObservableObject {
    @Published var classmember = [User]()
    @Published var classId: TimeTable
    @Published var classInfo: TimeTable
    @Published var classinfo: TimeTable
    @Published var timetable: String
    
    @Published var loading = false
    @Published var loadinguser = false
    
    
    init(classId: TimeTable, timetable: String) {
        self.classId = classId
        self.classInfo = classId
        self.classinfo = classId
        self.timetable = timetable
        fetchClassUser()
        fetchClass()
//        fetchClassInfo()
    }
    
    func fetchClassUser() {
        self.loadinguser = true
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_TIMETABLE.document(user.university!).collection("2021AS").document(classId.classId).collection("registeredUser")
        docRef.getDocuments { snapshot, _ in
            guard let classList = snapshot?.documents.map({ $0.documentID }) else { return }
            if classList.isEmpty == false {
                classList.forEach { classes in
                    COLLECTION_USERS.document(classes).getDocument { snapshot, _ in
                        let classmember = snapshot.map({ User(dictionary: $0.data() ?? [:])})
                        self.classmember.append(classmember!)
                        
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.loadinguser = false
            }
        }
    }
    
    func fetchClass() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let ClassId = classId.classId
        COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId).getDocument { snapshot, err in
            if err == nil {
                let classInfo = snapshot.map({ TimeTable(dictionary: $0.data() ?? [:])})
                self.classInfo = classInfo!
            }
        }
    }
    func fetchClassInfo() {
        self.loading = true
        guard let user = AuthViewModel.shared.currentUser else { return }
        let ClassId = classId.classId
        COLLECTION_TIMETABLE.document(user.university!).collection("2021AS").document(ClassId).getDocument { snapshot, _ in
            let classinfo = snapshot.map({ TimeTable(dictionary: $0.data() ?? [:])})
            self.classinfo = classinfo!
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.loading = false
            }
        }
    }
    
    func fetchAttendance() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let ClassId = classId.classId
        let docRef = COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId).collection("AttendanceList").document()
        let DocRef = COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId)
        let docID = docRef.documentID
        let DocID = DocRef.documentID
        let data = ["status": "出席",
                    "listId": docID,
                    "classId": DocID,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        docRef.setData(data) { _ in
        }
        COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId).updateData(["attendance": self.classInfo.attendance! + 1]) { _ in
        }
    }
    
    func fetchBehindtime() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let ClassId = classId.classId
        let docRef = COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId).collection("AttendanceList").document()
        let DocRef = COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId)
        let docID = docRef.documentID
        let DocID = DocRef.documentID
        let data = ["status": "遅刻",
                    "listId": docID,
                    "classId": DocID,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        docRef.setData(data) { _ in
        }
        COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId).updateData(["behindtime": self.classInfo.behindtime! + 1]) { _ in
        }
    }
    
    func fetchAbsence() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let uid = user.uid!
        let ClassId = classId.classId
        let docRef = COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId).collection("AttendanceList").document()
        let DocRef = COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId)
        let docID = docRef.documentID
        let DocID = DocRef.documentID
        let data = ["status": "欠席",
                    "listId": docID,
                    "classId": DocID,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        docRef.setData(data) { _ in
        }
        COLLECTION_USERS.document(uid).collection("2021AS").document(ClassId).updateData(["absence": self.classInfo.absence! + 1]) { _ in
        }
    }
}
