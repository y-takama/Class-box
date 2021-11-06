//
//  RegistrationTimetableView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/10.
//

import SwiftUI

struct RegistrationTimetableView: View {
    
    
    
    
    @State private var university = "愛媛大学"
    @State private var timetables = ""
    @State private var timetable1 = ""
    @State private var timetable2 = ""
    @State private var courseName = ""
    @State private var teacherName = ""
    @State private var classcode = ""
    @State private var classname = ""
    @State private var campus = ""
    @State private var graduate = ""
    @State private var classunit = 0
    var body: some View {
        NavigationView {
            Text(university)
                .navigationBarItems(trailing: registrationButton)
        }
    }
    
    func registrationclass() {
        var products = [String: [String: Any]]()
        
        
        
        for (key, value) in products {
            print("product name: ", key)
            let courseName = key
            value.forEach {
                if String($0.key) == "name" {
                    teacherName = $0.value as! String
                } else if String($0.key) == "code" {
                    classcode = $0.value as! String
                } else if String($0.key) == "unit" {
                    classunit = $0.value as! Int
                } else if String($0.key) == "timetables" {
                    timetables = $0.value as! String
                } else if String($0.key) == "campus" {
                    campus = $0.value as! String
                } else if String($0.key) == "graduate" {
                    graduate = $0.value as! String
                } else if String($0.key) == "classname" {
                    classname = $0.value as! String
                } else if String($0.key) == "timetable1" {
                    timetable1 = $0.value as! String
                } else if String($0.key) == "timetable2" {
                    timetable2 = $0.value as! String
                }
            }
            
            let docfef = COLLECTION_TIMETABLE.document(university).collection("2021AS").document()
            let docID = docfef.documentID
            //            let Docfef = COLLECTION_TIMETABLE.document(university).collection("\(campus)").document("2021AS").collection("\(timetables)").document(docID)
            
            
            let datas: [String: Any] = ["university": university,
                                        "campus": campus,
                                        "courseName": courseName,
                                        "roomLocation": "",
                                        "teacherName": teacherName,
                                        "unit": classunit,
                                        "author": "",
                                        "classCode": classcode,
                                        "graduate": graduate,
                                        "timetables": timetables,
                                        "timetable": [timetable1,timetable2],
                                        "classname": classname,
                                        "reference_source": "\(university) / シラバス",
                                        "classId": docID]
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                //                Docfef.setData(datas) { _ in
                //                }
                docfef.setData(datas) { _ in
                }
            }
        }
    }
    var registrationButton: some View {
        Button(action: {
            registrationclass()
        }, label: {
            Text("作成")
                .bold()
                .font(Font.system(size: 17, weight: .bold))
                .foregroundColor(courseName != "" ? Color(red: 104/255, green: 171/255, blue: 121/255) : Color.gray.opacity(0.7))
        })
    }
}
