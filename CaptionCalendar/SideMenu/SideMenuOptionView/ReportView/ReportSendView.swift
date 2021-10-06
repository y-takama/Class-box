//
//  ReportSendView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/09.
//

import SwiftUI

struct ReportSendView: View {
    @Binding var showReportView: Bool
    let option: MenuOption
    let user: User
    @State private var isSendButton = false
    @State private var reportText = ""
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
                ReportTextField("発生した問題や、問題の再現方法など入力してください", text: $reportText)
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: sendButton)
    }
    
    
    var sendButton: some View {
        Button(action: {
            if reportText.count != 0 {
                isSendButton.toggle()
            }
        }, label: {
            Image(systemName: "paperplane")
                .font(Font.system(size: 18, weight: .bold))
                .foregroundColor(reportText.count != 0 ? .blue : .gray)
//                .foregroundColor(.blue)
        }).alert(isPresented: $isSendButton) {
            Alert(title: Text("問題の報告"),
                  message: Text("問題を報告しますか？"),
                  primaryButton: .cancel(Text("キャンセル")),
                  secondaryButton: .default(Text("報告"),
                                            action: {
                                                report(title: option.description,
                                                       content: reportText,
                                                       user: user)
                                                showReportView.toggle()
                                                
                                            }))
        }
    }
    
    func report(title: String, content: String, user: User) {
        let docRef = COLLECTION_REPORT.document()
        let data = ["reportTitle": title,
                    "reportContent": content,
                    "userName": user.fullname!,
                    "userEmail": user.email,
        ] as [String: Any]
        docRef.setData(data) { _ in
        }
    }
}
