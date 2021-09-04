//
//  PrimaryButtonStyle.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
