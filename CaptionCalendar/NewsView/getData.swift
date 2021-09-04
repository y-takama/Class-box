//
//  getData.swift
//  getData
//
//  Created by 髙間洋平 on 2021/08/29.
//

import SwiftUI
import SwiftyJSON

struct dataType : Identifiable {
    var id : String
    var title : String
    var desc : String
    var url : String
    var image : String
}

class getData: ObservableObject {
    @Published var datas = [dataType]()
    init() {
        let source =
        "https://newsapi.org/v2/top-headlines?language=jp&pageSize=10&apiKey=abfe104cee2347df94840c79e686e74d"
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, _, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSON(data: data!)
            for i in json["articles"]{
                let title = i.1["title"].stringValue
                let description = i.1["description"].stringValue
                let url = i.1["url"].stringValue
                let image = i.1["urlToImage"].stringValue
                let id = i.1["publishedAt"].stringValue
                
                DispatchQueue.main.async {
                    self.datas.append(dataType(id: id, title: title, desc: description, url: url, image: image))
                }
            }
        }.resume()
    }
}
