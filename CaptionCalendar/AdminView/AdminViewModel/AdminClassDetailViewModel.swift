//
//  AdminClassViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/12.
//

import SwiftUI

class AdminClassDetailViewModel: ObservableObject {
    
    @Published var classInfo = [Admin]()
    @Published var classinfo: Admin
    @Published var classId: Admin
    @Published var loading = false
    
    
    
    init(classinfo: Admin, classId: Admin) {
        self.classinfo = classinfo
        self.classId = classId
        fetchClass()
    }
    
    func fetchClassDetail() {
        let docRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS").document(classId.classId)
        docRef.getDocument { snapshot, _ in
            let classinfo = snapshot.map({ Admin(dictionary: $0.data()!)})
            self.classinfo = classinfo!
        }
    }
    
    func fetchClass() {
        self.loading = true
        let docRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS")
        docRef.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let classInfo = documents.map({ Admin(dictionary: $0.data()) })
            self.classInfo = classInfo.sorted(by: {
                $0.courseName < $1.courseName
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.loading = false
            }
        }
    }
    
    func fetchBeforeattendanceNone() {
        let data = ["beforeattendanceNone": 1] as [String: Any]
        let dogRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS").document(classId.classId)
        if classId.beforeattendanceNone! == 0 {
            dogRef.updateData(data) { _ in
            }
        } else {
            dogRef.updateData(["beforeattendanceNone": self.classId.beforeattendanceNone! + 1]) { _ in
            }
        }
    }
    func fetchBeforeattendanceSometimes() {
        let data = ["beforeattendanceSometimes": 1] as [String: Any]
        let dogRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS").document(classId.classId)
        if classId.beforeattendanceSometimes! == 0 {
            dogRef.updateData(data) { _ in
            }
        } else {
            dogRef.updateData(["beforeattendanceSometimes": self.classId.beforeattendanceSometimes! + 1]) { _ in
            }
        }
    }
    func fetchBeforeattendanceEverytime() {
        let data = ["beforeattendanceEverytime": 1] as [String: Any]
        let dogRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS").document(classId.classId)
        if classId.beforeattendanceEverytime! == 0 {
            dogRef.updateData(data) { _ in
            }
        } else {
            dogRef.updateData(["beforeattendanceEverytime": self.classId.beforeattendanceEverytime! + 1]) { _ in
            }
        }
    }
    func fetchBeforeattendanceReport() {
        let data = ["beforeattendanceReport": 1] as [String: Any]
        let dogRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS").document(classId.classId)
        if classId.beforeattendanceReport! == 0 {
            dogRef.updateData(data) { _ in
            }
        } else {
            dogRef.updateData(["beforeattendanceReport": self.classId.beforeattendanceReport! + 1]) { _ in
            }
        }
    }
    func fetchBeforeattendanceNotClear() {
        let data = ["beforeattendanceNotClear": 1] as [String: Any]
        let dogRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS").document(classId.classId)
        if classId.beforeattendanceNotClear! == 0 {
            dogRef.updateData(data) { _ in
            }
        } else {
            dogRef.updateData(["beforeattendanceNotClear": self.classId.beforeattendanceNotClear! + 1]) { _ in
            }
        }
    }
    func fetchBeforeunit1() {
        let data = ["beforeunit1": 1] as [String: Any]
        let dogRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS").document(classId.classId)
        if classId.beforeunit1! == 0 {
            dogRef.updateData(data) { _ in
            }
        } else {
            dogRef.updateData(["beforeunit1": self.classId.beforeunit1! + 1]) { _ in
            }
        }
    }
    func fetchBeforeunit2() {
        let data = ["beforeunit2": 1] as [String: Any]
        let dogRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS").document(classId.classId)
        if classId.beforeunit2! == 0 {
            dogRef.updateData(data) { _ in
            }
        } else {
            dogRef.updateData(["beforeunit2": self.classId.beforeunit2! + 1]) { _ in
            }
        }
    }
    func fetchBeforeunit3() {
        let data = ["beforeunit3": 1] as [String: Any]
        let dogRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS").document(classId.classId)
        if classId.beforeunit3! == 0 {
            dogRef.updateData(data) { _ in
            }
        } else {
            dogRef.updateData(["beforeunit3": self.classId.beforeunit3! + 1]) { _ in
            }
        }
    }
    func fetchBeforeunit4() {
        let data = ["beforeunit4": 1] as [String: Any]
        let dogRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS").document(classId.classId)
        if classId.beforeunit4! == 0 {
            dogRef.updateData(data) { _ in
            }
        } else {
            dogRef.updateData(["beforeunit4": self.classId.beforeunit4! + 1]) { _ in
            }
        }
    }
    func fetchBeforeunit5() {
        let data = ["beforeunit5": 1] as [String: Any]
        let dogRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021AS").document(classId.classId)
        if classId.beforeunit5! == 0 {
            dogRef.updateData(data) { _ in
            }
        } else {
            dogRef.updateData(["beforeunit5": self.classId.beforeunit5! + 1]) { _ in
            }
        }
    }
    func filteredClass(_ query: String) -> [Admin] {
        let lowercasedQuery = query.lowercased()
        return classInfo.filter({ $0.courseName.contains(lowercasedQuery) || $0.classCode!.contains(lowercasedQuery) ||
            $0.graduate!.contains(lowercasedQuery) ||
            $0.teacherName!.contains(lowercasedQuery)})
    }
}
