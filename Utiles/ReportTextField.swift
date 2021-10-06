//
//  ReportTextField.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/09.
//

import SwiftUI

struct ReportTextField: View {
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
//                .foregroundColor(Color("TextColor"))
                
        }
        .font(.body)
        .frame(maxWidth: (UIScreen.main.bounds.width-40), minHeight: 120, idealHeight: 200, maxHeight: .infinity)
    }
}
