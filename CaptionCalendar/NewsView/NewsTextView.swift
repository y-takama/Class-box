//
//  NewsBusinessTextView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/14.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsTextView: View {
    @State private var isShowSafari = false
//    @State private var tabBar: UITabBar! = nil
    @State var imageURL: String = ""
    @Binding private var source: String
    @ObservedObject var list: getData
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    init(source: Binding<String>) {
        self._source = source
        list = getData(source: source)
    }
    
    var body: some View {
        VStack(spacing: 4) {
            ForEach(list.datas, id: \.self){ i in
                Button(action: {
                    imageURL = i.url
                    print(imageURL)
                    isShowSafari.toggle()
                }, label: {
                    VStack(alignment: .leading) {
                        Text(i.title)
                            .fontWeight(.heavy)
                            .font(.system(size: 14))
                            .lineLimit(1)
                            .foregroundColor(Color("TextColor"))
                    }
                })
            }
            Text(imageURL)
                .font(.system(size: 1))
                .foregroundColor(Color("TextColor"))
        }.fullScreenCover(isPresented: $isShowSafari) {
            safari(urlString: imageURL).ignoresSafeArea(.all)
        }
    }
}
