//
//  AddCourceView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/19.
//

import SwiftUI

struct AddCourceView: View {
    @State private var selectedOrder = "1"
    @State private var courceName = ""
    @State private var headerName = ""
    @State private var isShowAlert = false
    @Binding var addCource: Bool
    let order = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
    let cource: Study
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("cource name").padding(.leading)
                TextField("コース名を入力してください", text: $courceName)
                Divider()
                Text("header").padding(.leading)
                TextField("ヘッダーを入力してください", text: $headerName)
                Divider()
                Text("order").padding(.leading)
                Picker(selection: $selectedOrder, label: Text("order")) {
                    ForEach(order, id: \.self) { num in
                        Text("\(num)")
                    }
                }.pickerStyle(WheelPickerStyle())
                Spacer()
            }.padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: registrationButton)
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text(""), message: Text("正しく登録することができませんでした。"), dismissButton: .destructive(Text("OK")))
            }
        }
    }
    var registrationButton: some View {
        Button(action: {
            registration()
        }, label: {
            if courceName != "" && headerName != "" {
                Image(systemName: "plus")
            } else {
                Image(systemName: "plus")
                    .foregroundColor(Color.gray)
            }
        })
    }
    
    func registration() {
        let dogRef = COLLECTION_STUDY.document(cource.courseID!).collection("contents").document()
        let docID = dogRef.documentID
        let datas: [String: Any] = ["courseID": cource.courseID!,
                                   "detailID": docID,
                                   "header": headerName,
                                   "title": courceName,
                                    "order": Int(selectedOrder)!]
        if courceName != "" && headerName != "" {
            dogRef.setData(datas) { err in
                if err == nil {
                    addCource.toggle()
                } else {
                    isShowAlert.toggle()
                }
            }
        }
    }
}
