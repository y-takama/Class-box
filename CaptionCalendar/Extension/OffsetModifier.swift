//
//  OffsetModifier.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/27.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    var tab: Textbook
    @Binding var currentTab: String
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("SCROLL")))
                }
            )
            .onPreferenceChange(OffsetKey.self) { proxy in
                let offset = proxy.minY - 80
                withAnimation() {
                    currentTab = (offset < 20 && -offset < (proxy.midX / 2) && currentTab != "\(tab.order!)") ? "\(tab.order!) SCROLL" : currentTab
                }
            }
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
