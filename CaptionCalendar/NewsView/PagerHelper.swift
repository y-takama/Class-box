//
//  PagerHelper.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/14.
//

import SwiftUI

struct PagerTabView<Content: View, Label: View>: View {
    var content: Content
    var label: Label
    var tint: Color
    @Binding var selection: Int
    
    init(tint: Color, selection: Binding<Int>, @ViewBuilder labels: @escaping()->Label, @ViewBuilder content: @escaping()->Content) {
        self.content = content()
        self.label = labels()
        self.tint = tint
        self._selection = selection
    }
    @State var offset: CGFloat = 0
    @State var maxTabs: CGFloat = 0
    @State var tabOffset: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                label
            }
            .overlay(HStack(spacing: 0) {
                ForEach(0..<Int(maxTabs), id: \.self) { index in
                    Rectangle()
                        .fill(Color.black.opacity(0.01))
                        .onTapGesture {
                            let newOffSet = CGFloat(index)*getScreenBounds().width
                            self.offset = newOffSet
                        }
                }
            })
            .foregroundColor(tint)
            
            Capsule()
                .fill(tint)
                .frame(width: maxTabs == 0 ? 0 : (getScreenBounds().width/maxTabs), height: 2)
                .padding(.top, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: tabOffset)
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
                .onPreferenceChange(TabPreferenceKey.self) { proxy in
                    let minX = -proxy.minX
                    let maxWidth = proxy.width
                    let screenWidth = getScreenBounds().width
                    let maxTabs = (maxWidth/screenWidth).rounded()
                    let progress = minX/screenWidth
                    let tabOffset = progress*(screenWidth/maxTabs)
                    
                    self.tabOffset = tabOffset
                    self.maxTabs = maxTabs
                    
                }
            }
        }
    }
}

struct  TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .init()
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    func pageLabel()-> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func pageView()-> some View {
        self
            .frame(width: getScreenBounds().width, alignment: .center)
    }
    func getScreenBounds()->CGRect {
        return UIScreen.main.bounds
    }
}
