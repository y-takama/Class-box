//
//  TextAnimation.swift
//  TextAnimation
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI

struct TextAnimation: Identifiable {
    var id = UUID().uuidString
    var text: String
    var offset: CGFloat = 110
}

