//
//  InquiryView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/09.
//

import SwiftUI

struct InquiryView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                Text("お知らせはありません")
                    .bold()
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            .navigationBarItems(trailing: backButton)
            .navigationTitle("お知らせ")
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

struct InquiryView_Previews: PreviewProvider {
    static var previews: some View {
        InquiryView()
    }
}
