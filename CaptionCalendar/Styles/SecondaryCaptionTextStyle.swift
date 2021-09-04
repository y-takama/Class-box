//
//  SecondaryCaptionTextStyle.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import Foundation
import SwiftUI

struct SecondaryCaptionTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.secondary)
    }
}
