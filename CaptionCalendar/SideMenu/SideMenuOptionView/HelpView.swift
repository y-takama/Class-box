//
//  HelpView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/08.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationBarItems(trailing: backButton)
            .navigationTitle("ヘルプ")
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

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
