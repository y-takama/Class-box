//
//  NewsTab1View.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/14.
//

import SwiftUI

struct NewsTab1View: View {
    @State var currentSelection: Int = 0
    @State private var topsource = "https://newsapi.org/v2/top-headlines?language=jp&pageSize=10&apiKey=abfe104cee2347df94840c79e686e74d"
    @State private var businesssource = "https://newsapi.org/v2/top-headlines?country=jp&category=business&pageSize=5&apiKey=83552eb3d7694bbcbc231256ecbed6f1"
    var body: some View {
        PagerTabView(tint: .gray, selection: $currentSelection) {
            Image(systemName: "square.grid.2x2")
                .pageLabel()
            Image(systemName: "square.grid.2x2")
                .pageLabel()
            
            Image(systemName: "square.grid.2x2")
                .pageLabel()
        } content: {
            NewsBusinessView(source: $businesssource)
                .pageView()
            NewsBusinessView(source: $businesssource)
                .pageView()
            NewsBusinessView(source: $businesssource)
                .pageView()
        }
    }
}

struct NewsTab1View_Previews: PreviewProvider {
    static var previews: some View {
        NewsTab1View()
    }
}
