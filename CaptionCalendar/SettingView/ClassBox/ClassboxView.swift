//
//  ClassboxView.swift
//  ClassboxView
//
//  Created by 髙間洋平 on 2021/08/31.
//

import SwiftUI

struct ClassboxView: View {
    var body: some View {
        Color("CaptionColor")
            .clipShape(LiquidSwipe())
            .ignoresSafeArea()
//            .padding(.trailing, 5)
    }
}


struct LiquidSwipe: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            let width = rect.width
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y:  0))
            path.addLine(to: CGPoint(x: rect.width, y:  rect.height))
            path.addLine(to: CGPoint(x: 0, y:  rect.height))
            
            path.move(to: CGPoint(x: width, y: 80))
            
            let mid: CGFloat = 80 + ((180-80)/2)
            path.addCurve(to: CGPoint(x: width, y: 180),
                          control1: CGPoint(x: width - 50, y: mid),
                          control2: CGPoint(x: width - 50, y: mid))
            
            
        }
    }
}
