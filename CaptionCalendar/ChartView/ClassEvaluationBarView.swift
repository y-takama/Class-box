//
//  ClassEvaluationBarView.swift
//  ClassEvaluationBarView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI

struct ClassEvaluationBarView: View{
    var value: Int
    var cornerRadius: CGFloat
    
    var body: some View {
        VStack {

            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 20, height: 115).foregroundColor(Color("TintColor"))
                VStack(spacing: 3) {
                    if (value*15)<100 {
                        Text(String(value))
                            .font(.system(size: 9))
                    } else {
                        Text("7以上")
                            .font(.system(size: 9))
                    }
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(LinearGradient(gradient: Gradient(colors: [.purple, .red, .blue]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 20, height: (value*15)<100 ? CGFloat(value*15) : 100)
                }
            }
            .padding(.bottom, 8)
        }
        
    }
}
