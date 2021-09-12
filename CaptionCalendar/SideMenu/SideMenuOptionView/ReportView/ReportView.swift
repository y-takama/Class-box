//
//  ReportView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/09.
//

import SwiftUI

struct ReportView: View {
    @Binding var showReportView: Bool
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let user: User
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                ReportHeaderView(showReportView: $showReportView, user: user)
                Divider()
                ReportBottomView(showReportView: $showReportView, user: user)
                Spacer()
                
            }
            .padding(.leading, -40)
            .navigationBarItems(trailing: backButton)
            .navigationTitle("問題")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
    }
    var backButton: some View {
        Button(action: {
            mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.down")
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }

}
