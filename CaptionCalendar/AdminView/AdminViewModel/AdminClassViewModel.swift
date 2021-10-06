//
//  AdminClassViewModel.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/26.
//
//
//import SwiftUI
//
//class AdminClassViewModel: ObservableObject {
//    
////    @Published var classInfo = [Admin]()
//    @Published var classinfo: Admin
//    @Published var classId: Admin
//    @Published var loading = false
//    
//    
//    
//    init(classinfo: Admin, classId: Admin) {
//        self.classinfo = classinfo
//        fetchClass()
//    }
//    
//    
//    func fetchClass() {
//        self.loading = true
//        let docRef = COLLECTION_TIMETABLE.document(classId.university!).collection("2021LH")
//        docRef.getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            self.classinfo = documents.map({ Admin(dictionary: $0.data()) })
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                self.loading = false
//            }
//        }
//    }
//    func filteredClass(_ query: String) -> [TimeTable] {
//        let lowercasedQuery = query.lowercased()
//        return classInfo.filter({ $0.courseName.contains(lowercasedQuery) || $0.classCode!.contains(lowercasedQuery) || $0.teacherName!.contains(lowercasedQuery)})
//    }
//}
