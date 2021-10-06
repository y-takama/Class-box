//
//  CheackBox.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/18.
//

import SwiftUI

struct CheckBox: View {
    @State private var isChecked = false
    @Binding var answer: Int
    let number: Int
    var body: some View {
        Button(action: {
            isChecked = true
            answer = number
            UIImpactFeedbackGenerator(style: .medium)
            .impactOccurred()
        }, label: {
            if(isChecked && answer == number) {
                Image(systemName: "checkmark.square.fill").onAppear(perform: {
                })
                    .foregroundColor(.green)
            } else {
                Image(systemName: "square")
            }
        })
    }
    
    func toggle() -> Void {
        isChecked = !isChecked
//        UIImpactFeedbackGenerator(style: .medium)
//        .impactOccurred()
    }
}
