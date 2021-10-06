//
//  NewsMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/05.
//

import SwiftUI

struct NewsMainView: View {
    @State var currentSelection: Int = 0
    @State var isLoading = false
    @State private var topsource1 = "https://newsapi.org/v2/top-headlines?language=jp&pageSize=3&apiKey=c367d504caab4478b0268be33bf7e325"
    @State private var headersource1 = "https://newsapi.org/v2/top-headlines?country=jp&category=business&pageSize=5&apiKey=b9ece0366a5644528e2b87a41e9663ad"
    @State private var windowsource1 = "https://newsapi.org/v2/top-headlines?country=jp&category=science&pageSize=1&apiKey=c367d504caab4478b0268be33bf7e325"
    @State private var textsource1 = "https://newsapi.org/v2/top-headlines?country=jp&category=science&pageSize=3&apiKey=31a0f37c4f0e42758680edf4ac926b05"
    
    @State private var topsource2 = "https://newsapi.org/v2/top-headlines?language=jp&category=entertainment&pageSize=3&apiKey=c367d504caab4478b0268be33bf7e325"
    @State private var headersource2 = "https://newsapi.org/v2/top-headlines?country=jp&category=health&pageSize=5&apiKey=f292ef49c34143a18221947a6f9d79dd"
    @State private var windowsource2 = "https://newsapi.org/v2/top-headlines?country=jp&category=sports&pageSize=1&apiKey=c367d504caab4478b0268be33bf7e325"
    @State private var textsource2 = "https://newsapi.org/v2/top-headlines?country=jp&category=general&pageSize=3&apiKey=31a0f37c4f0e42758680edf4ac926b05"
    
    @State private var topsource3 = "https://newsapi.org/v2/everything?q=apple&from=2021-09-13&to=2021-09-13&sortBy=popularity&pageSize=3&apiKey=c367d504caab4478b0268be33bf7e325"
    @State private var headersource3 = "https://newsapi.org/v2/everything?domains=wsj.com&pageSize=8&apiKey=83552eb3d7694bbcbc231256ecbed6f1"
    @State private var windowsource3 = "https://newsapi.org/v2/everything?q=tesla&from=2021-08-14&sortBy=publishedAt&pageSize=1&apiKey==c367d504caab4478b0268be33bf7e325"
    @State private var textsource3 = "https://newsapi.org/v2/top-headlines?sources=techcrunch&pageSize=5&apiKey=31a0f37c4f0e42758680edf4ac926b05"
    var body: some View {
        ZStack {
            PagerTabView(tint: .gray, selection: $currentSelection) {
                Image(systemName: "square.grid.2x2")
                    .pageLabel()
                
                Image(systemName: "square.grid.2x2")
                    .pageLabel()
                
                Image(systemName: "globe")
                    .pageLabel()
            } content: {
                ScrollView {
                    VStack {
                        NewsTopView(source: $topsource1).ignoresSafeArea(.all)
                        NewsHeaderView(source: $headersource1)
                        NewsTextView(source: $textsource1)
//                        AdView()
//                            .frame(width: UIScreen.main.bounds.width,
//                                   height: UIScreen.main.bounds.width*5/16)
                        NewsWindowView(source: $windowsource1)
//                        AdView()
//                            .frame(width: UIScreen.main.bounds.width,
//                                   height: UIScreen.main.bounds.width*5/16)
                        Spacer()
                    }
                    
                }
                .pageView()
                ScrollView {
                    NewsTopView(source: $topsource2).ignoresSafeArea(.all)
                    NewsHeaderView(source: $headersource2)
                    NewsTextView(source: $textsource2)
//                    AdView()
//                        .frame(width: UIScreen.main.bounds.width,
//                               height: UIScreen.main.bounds.width*5/16)
                    NewsWindowView(source: $windowsource2)
//                    AdView()
//                        .frame(width: UIScreen.main.bounds.width,
//                               height: UIScreen.main.bounds.width*5/16)
                    Spacer()
                    Spacer()
                }
                .pageView()
                ScrollView {
                    NewsTopView(source: $topsource3).ignoresSafeArea(.all)
//                    AdView()
//                        .frame(width: UIScreen.main.bounds.width,
//                               height: UIScreen.main.bounds.width*5/16)
                    NewsHeaderView(source: $headersource3)
                    NewsWindowView(source: $windowsource3)
                    NewsTextView(source: $textsource3)
//                    AdView()
//                        .frame(width: UIScreen.main.bounds.width,
//                               height: UIScreen.main.bounds.width*5/16)
                    
                    
                    Spacer()
                    Spacer()
                }
                .pageView()
            }
            .onAppear { startLoading() }
            .animation(.default)
            
            if isLoading {
                ZStack {
                    Color("TintColor").ignoresSafeArea(.all)
                    VStack(spacing: 20) {
                        Image(systemName: "shippingbox")
                            .font(Font.system(size: 45, weight: .bold))
                            .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("TextColor")))
                            .scaleEffect(1)
                    }
                }
            }
        }
        
    }
    func startLoading() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            isLoading = false
        }
    }
}
