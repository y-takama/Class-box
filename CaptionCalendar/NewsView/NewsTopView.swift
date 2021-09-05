//
//  NewsView.swift
//  NewsView
//
//  Created by 髙間洋平 on 2021/08/29.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsTopView: View {
    @State private var isShowSafari = false
    @State private var imageURL = ""
    @Binding private var source: String
    @ObservedObject var list: getData
    let width = UIScreen.main.bounds.width
    
    init(source: Binding<String>) {
        self._source = source
        list = getData(source: source)
    }
    
    var body: some View {
        TabView {
            ForEach(list.datas){ i in
                if i.image != "" {
                    Button(action: {
                        isShowSafari.toggle()
                    }, label: {
                        ZStack(alignment: .bottomLeading) {
                            WebImage(url: URL(string: i.image), options: .highPriority, context: nil)
                                .resizable()
                                .scaledToFill()
                                .frame(width: width, height: width*3/4)
                                .clipped()
                            
//                                LinearGradient(colors: [
//                                    .clear,
//                                    .black.opacity(0.1),
//                                    .black.opacity(0.4)
//                                ], startPoint: .top, endPoint: .bottom)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(i.title)
                                    .fontWeight(.heavy)
                                    .font(.system(size: 20))
                                    .lineLimit(2)
                                    .foregroundColor(.white)
                                    .frame(width: width*2/3)
                                Text(i.desc)
                                    .lineLimit(1)
                                    .foregroundColor(.white)
                                    .font(.callout)
                            }
                            .padding(15)
                        }
                    }).fullScreenCover(isPresented: $isShowSafari) {
                        safari(urlString: i.url).ignoresSafeArea(.all)
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: width*3/4)
    }
}

