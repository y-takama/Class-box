//
//  CustomCreateClassTextField.swift
//  CustomCreateClassTextField
//
//  Created by 髙間洋平 on 2021/08/20.
//

import SwiftUI

struct CustomCreateClassTextField: View {
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color.gray)
                    .padding(.leading, 40)
                    .foregroundColor(Color("TextColor"))
            }
            
            HStack(spacing: 16) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color("TextColor"))
                
                TextField("", text: $text)
            }
        }
    }
}
