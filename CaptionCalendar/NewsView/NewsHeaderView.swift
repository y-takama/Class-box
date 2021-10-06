//
//  NewsBusinessView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/13.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsHeaderView: View {
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
                        HStack {
                            WebImage(url: URL(string: i.image), options: .highPriority, context: nil)
                                .resizable()
                                .scaledToFill()
                                .frame(width: width/3-10, height: width*5/21-10)
                                .clipped()
                                .cornerRadius(3)
                            Spacer()
                            VStack(alignment: .leading, spacing: 5) {
                                Text(i.title)
                                    .fontWeight(.heavy)
                                    .font(.system(size: 15))
                                    .lineLimit(2)
                                    .foregroundColor(Color("TextColor"))
                                Text(i.desc)
                                    .lineLimit(1)
                                    .font(.system(size: 11))
                                    .foregroundColor(Color("TextColor"))
                                
                            }
                            .frame(width: width*2/3 - 30)
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
