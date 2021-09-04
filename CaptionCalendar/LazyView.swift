//
//  LazyView.swift
//  LazyView
//
//  Created by 髙間洋平 on 2021/08/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
            
    }
}
