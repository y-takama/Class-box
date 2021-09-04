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
    
    var name: String {
        switch self {
        case .Ritumeikan: return "立命館大学"
        case .Dousisya: return "同志社大学"
        case .Kansai: return "関西大学"
        case .Kansaigakuin: return "関西学院大学"
        }
    }
    
    var description: [String] {
        switch self {
        case .Ritumeikan: return ["未設定","衣笠キャンパス","びわこ・くさつキャンパス","大阪いばらきキャンパス","朱雀キャンパス"]
        case .Dousisya: return ["未設定","今出川キャンパス","新町キャンパス","室町キャンパス","京田辺キャンパス","大阪サテライトキャンパス","東京サテライトキャンパス"]
        case .Kansai: return ["未設定"]
        case .Kansaigakuin: return ["未設定"]
        }
    }
}


