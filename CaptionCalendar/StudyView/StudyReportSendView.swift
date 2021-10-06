//
//  StudyReportSendView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/22.
//

import SwiftUI

struct StudyReportSendView: View {
    @State private var number = 10
    @State private var isSendButton = false
    @State private var reportText = ""
    @Binding var showReportView: Bool
    @Binding var showMenu: Bool
    let option: MenuOption
    let user: User
    var body: some View {
        ScrollView {
            HStack(spacing: 15) {
                Image(systemName: option.imageName)
                    .font(.system(size: 18))
                    .frame(width: 24)
                Text(option.description)
                    .bold()
            }
            
            Divider()
            
            HStack {
                VStack {
                    ForEach(0..<3) { num in
                        CheckBox(answer: $number, number: num).frame(height: 20)
                    }
                }
                VStack(alignment: .leading) {
                    Text("解答が違う").frame(height: 20)
                    Text("問題が違う").frame(height: 20)
                    Text("その他").frame(height: 20)
                }
                Spacer()
            }.padding()
            ReportTextField("誤りの内容を記入してください。", text: $reportText)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: sendButton)
    }
    
    
    var sendButton: some View {
        Button(action: {
            if number != 10 {
                isSendButton.toggle()
            }
        }, label: {
            Image(systemName: "paperplane")
//                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(number != 10 ? .blue : .gray)
//                .foregroundColor(.blue)
        }).alert(isPresented: $isSendButton) {
            Alert(title: Text("問題の報告"),
                  message: Text("問題を報告しますか？"),
                  primaryButton: .cancel(Text("キャンセル")),
                  secondaryButton: .default(Text("報告"),
                                            action: {
                report()
                showReportView.toggle()
                showMenu.toggle()
            }))
        }
    }
    
    func report() {
        let docRef = COLLECTION_REPORT.document()
        let data = ["reportTitle": option.description,
                    "reportContent": reportText,
                    "userName": user.fullname!,
                    "userEmail": user.email,
                    "reportnumber": number,

        ] as [String: Any]
        docRef.setData(data) { _ in
        }
    }
}
