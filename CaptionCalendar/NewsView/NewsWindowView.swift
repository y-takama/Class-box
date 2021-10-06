//
//  NewsWindowView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/14.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsWindowView: View {
    @State private var isShowSafari = false
    @State private var tabBar: UITabBar! = nil
    @State var imageURL: String = ""
    @Binding private var source: String
    @State var currentSelection: Int = 0
    @ObservedObject var list: getData
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    init(source: Binding<String>) {
        self._source = source
        list = getData(source: source)
    }
    
    var body: some View {
        VStack {
            ForEach(list.datas, id: \.self){ i in
                if i.image != "" {
                    Button(action: {
                        imageURL = i.url
                        print(imageURL)
                        isShowSafari.toggle()
                    }, label: {
                        VStack {
                            WebImage(url: URL(string: i.image), options: .highPriority, context: nil)
                                .resizable()
                                .scaledToFill()
                                .frame(width: width-30, height: (width-30)*5/7)
                                .clipped()
                                .cornerRadius(3)
                            Text(i.title)
                                .fontWeight(.heavy)
                                .font(.system(size: 15))
                                .lineLimit(2)
                                .foregroundColor(Color("TextColor"))
                            .frame(width: width-40)
                            .padding(3)
                        }
                        .padding(.horizontal, 10)
                    })
                }
            }
            Text(imageURL)
                .font(.system(size: 1))
                .foregroundColor(Color("TextColor"))
            
        }.fullScreenCover(isPresented: $isShowSafari) {
            safari(urlString: imageURL).ignoresSafeArea(.all)
        }
    }
}
