//
//  CustomSecureField.swift
//  CustomSecureField
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color.gray)
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
//                    .foregroundColor(Color("TextColor"))
                    .foregroundColor(Color.black)
                
                SecureField("", text: $text)
            }
        }
    }
}
