//
//  PagerNewsView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/14.
//

import SwiftUI

struct PagerNewsView<Content: View>: View {
    var content: Content
    @Binding var selection: Int
    
    init(selection: Binding<Int>, @ViewBuilder content: @escaping()->Content) {
        self.content = content()
        self._selection = selection
    }
    @State var offset: CGFloat = 0
    @State var maxTabs: CGFloat = 0
    @State var tabOffset: CGFloat = 0
    
    var body: some View {
        OffSetPageTabView(selection: $selection, offset: $offset) {
            HStack(spacing: 0) {
                content
            }
            .overlay(
                GeometryReader{ proxy in
                    Color.clear
                        .preference(key: TabPreferenceKey.self, value: proxy.frame(in: .global))
                }
            )
//            .onPreferenceChange(TabPreferenceKey.self) { proxy in
//                let minX = -proxy.minX
//                let maxWidth = proxy.width
//                let screenWidth = getScreenBounds().width
//                let maxTabs = (maxWidth/screenWidth).rounded()
//                let progress = minX/screenWidth
//                let tabOffset = progress*(screenWidth/maxTabs)
//                
//                self.tabOffset = tabOffset
//                self.maxTabs = maxTabs
//                
//            }
        }
    }
}
