//
//  NewsMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/05.
//

import SwiftUI

struct NewsMainView: View {
    @State private var topsource = "https://newsapi.org/v2/top-headlines?language=jp&pageSize=10&apiKey=abfe104cee2347df94840c79e686e74d"
    var body: some View {
        ScrollView {
            NewsTopView(source: $topsource)
        }.ignoresSafeArea(.all)
        
    }
}
