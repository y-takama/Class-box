//
//  University.swift
//  University
//
//  Created by 髙間洋平 on 2021/08/21.
//

import SwiftUI

enum University: String, CaseIterable {
    case Ritumeikan // 立命館大学
    case Dousisya // 同志社大学
    case Kansai // 関西大学
    case Kansaigakuin // 関西学院大学
    case Kinki // 近畿大学
    
    
    case Nagoya // 名古屋大学
    case Nagoyakogyo // 名古屋工業大学
    
    var name: String {
        switch self {
        case .Ritumeikan: return "立命館大学"
        case .Dousisya: return "同志社大学"
        case .Kansai: return "関西大学"
        case .Kansaigakuin: return "関西学院大学"
        case .Kinki: return "近畿大学"
        case .Nagoya: return "名古屋大学"
        case .Nagoyakogyo: return "名古屋工業大学"
        }
    }
    
    var description: [String] {
        switch self {
        case .Ritumeikan: return ["--","衣笠キャンパス","びわこ・くさつキャンパス","大阪いばらきキャンパス","朱雀キャンパス","未設定"]
        case .Dousisya: return ["--","今出川キャンパス","新町キャンパス","室町キャンパス","京田辺キャンパス","大阪サテライトキャンパス","東京サテライトキャンパス","未設定"]
        case .Kansai: return ["--","未設定"]
        case .Kansaigakuin: return ["--","未設定"]
        case .Kinki: return ["--","東大阪","大阪狭山キャンパス","奈良キャンパス","和歌山キャンパス","広島キャンパス","福岡キャンパス","未設定"]
        case .Nagoya: return ["--","東山キャンパス","鶴舞キャンパス","大幸キャンパス","未設定"]
        case .Nagoyakogyo: return ["--","御器所キャンパス","未設定"]
        }
    }
}


