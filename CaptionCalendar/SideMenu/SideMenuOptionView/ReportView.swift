//
//  ReportView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/09.
//

import SwiftUI

struct ReportView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                ReportHeaderView()
                Divider()
                Group {
                    HStack(spacing: 16) {
                        Image(systemName: "")
                            .font(.system(size: 20))
                            .frame(width: 24)
                        Text("アプリ全体に関して")
                            .font(.system(size: 15))
                            .bold()
                        Spacer()
                    }
                    HStack(spacing: 16) {
                        Image(systemName: "")
                            .font(.system(size: 20))
                            .frame(width: 24)
                        Text("不正利用、ユーザーの問題に関して")
                            .font(.system(size: 15))
                            .bold()
                        Spacer()
                    }
                    HStack(spacing: 16) {
                        Image(systemName: "")
                            .font(.system(size: 20))
                            .frame(width: 24)
                        Text("その他")
                            .font(.system(size: 15))
                            .bold()
                        Spacer()
                    }
                }.frame(width: UIScreen.main.bounds.width-90,height: 40)
                .foregroundColor(Color("TextColor"))
                Spacer()
            }
            .padding(.leading, -30)
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

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
