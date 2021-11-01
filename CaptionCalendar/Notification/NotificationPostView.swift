//
//  NotificationPostView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/07.
//

import SwiftUI
import Firebase

struct NotificationPostView: View {
    @State private var title = ""
    @State private var content = ""
    @State private var isShowAlert = false
    let user: User
    @Binding var post: Bool
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("タイトル").bold()
                    Spacer()
                }
                VStack(alignment: .leading) {
                    CustomTextField("Title", text: $title)
                    Divider()
                }
                HStack {
                    Text("内容").bold()
                    Spacer()
                }
                VStack(alignment: .leading) {
                    CustomTextField("Content", text: $content)
                    Divider()
                }
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: HStack(spacing: 10) {
                backButton
                registrationButton
            })
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text(""), message: Text("正しく登録することができませんでした。"), dismissButton: .destructive(Text("OK")))
            }
        }.onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
    }
    var registrationButton: some View {
        Button(action: {
            registration()
        }, label: {
            if title != "" && content != "" {
                Image(systemName: "plus")
                    .foregroundColor(Color("TextColor"))
            } else {
                Image(systemName: "plus")
                    .foregroundColor(Color.gray)
            }
        })
    }
    var backButton: some View {
        Button(action: {
            post.toggle()
        }, label: {
            Image(systemName: "multiply.circle.fill")
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }
    
    func registration() {
        let DogRef = COLLECTION_NOTIFICATION.document()
        let DocID = DogRef.documentID
        let datas: [String: Any] = ["title": title,
                                    "content": content,
                                    "name": user.fullname!,
                                    "timestamp": Timestamp(date: Date()),
                                    "questionID": DocID]
        if title != "" && content != "" {
            DogRef.setData(datas) { err in
                if err == nil {
                    post.toggle()
                } else {
                    isShowAlert.toggle()
                }
            }
        }
    }
}
