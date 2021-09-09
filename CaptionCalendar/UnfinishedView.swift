//
//  UnfinishedView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/09.
//

import SwiftUI

struct UnfinishedView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                Text("Scheduled for implementation!")
            }
            .navigationBarItems(trailing: backButton)
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

struct UnfinishedView_Previews: PreviewProvider {
    static var previews: some View {
        UnfinishedView()
    }
}
