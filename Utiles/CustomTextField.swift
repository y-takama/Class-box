//
//  CustomTextField.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/19.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(Color(.placeholderText))
                    .padding(10)
            }
            TextEditor(text: $text)
                .foregroundColor(Color("TextColor"))
                
        }
        .font(.body)
        .frame(width: UIScreen.main.bounds.width-40,
               height: 60,
               alignment: .leading)
    }
}
