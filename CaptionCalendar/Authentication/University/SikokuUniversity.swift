//
//  SikokuUniversity.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/24.
//

import SwiftUI

enum SikokuUniversity: String, CaseIterable {
    case ehime // 愛媛大学
    case ehimeiryougijutu // 愛媛医療技術大学
    case kagawa // 香川大学
    case kagawahokenniryou // 香川保健医療大学
    case koti // 高知大学
    case kotigakuen // 高知学園大学
    case kotikenritu // 高知県立大学
    case kotikoka // 高知工科大学
    case kotirihabiritesyonnsennmonnsyoku // 高知リハビリテーション専門職大学
    case shikoku // 四国大学
    case shikokugakuin // 四国学院大学
    case seikatarina // 聖カタリナ大学
    case takamatu // 高松大学
    case tokushima // 徳島大学
    case tokushimabunri // 徳島文理大学
    case narutokyoiku // 鳴門教育大学
    case matuyama // 松山大学
    case matuyamasinonomejyoshi // 松山東雲女子大学
    

    var name: String {
        switch self {
        case .ehime: return "愛媛大学"
        case .ehimeiryougijutu: return "愛媛医療技術大学"
        case .kagawa: return "香川大学"
        case .kagawahokenniryou: return "香川保健医療大学"
        case .koti: return "高知大学"
        case .kotigakuen: return "高知学園大学"
        case .kotikenritu: return "高知県立大学"
        case .kotikoka: return "高知工科大学"
        case .kotirihabiritesyonnsennmonnsyoku: return "高知リハビリテーション専門職大学"
        case .shikoku: return "四国大学"
        case .shikokugakuin: return "四国学院大学"
        case .seikatarina: return "聖カタリナ大学"
        case .takamatu: return "高松大学"
        case .tokushima: return "徳島大学"
        case .tokushimabunri: return "徳島文理大学"
        case .narutokyoiku: return "鳴門教育大学"
        case .matuyama: return "松山大学"
        case .matuyamasinonomejyoshi: return "松山東雲女子大学"
            }
    }
    
    var description: [String] {
        switch self {
        case .ehime: return ["--","樽味地区","城北地区","重信地区"]
        case .ehimeiryougijutu: return ["--","本校"]
        case .kagawa: return ["--","幸町地区","林町地区","三木町地区"]
        case .kagawahokenniryou: return ["--","本校"]
        case .koti: return ["--","浅倉キャンパス","物部キャンパス","岡豊キャンパス"]
        case .kotigakuen: return ["--","本校"]
        case .kotikenritu: return ["--","永国寺キャンパス","池キャンパス"]
        case .kotikoka: return ["--","永国寺キャンパス","香美キャンパス"]
        case .kotirihabiritesyonnsennmonnsyoku: return ["--","本校"]
        case .shikoku: return ["--","本校"]
        case .shikokugakuin: return ["--","本校"]
        case .seikatarina: return ["--","本校"]
        case .takamatu: return ["--","本校"]
        case .tokushima: return ["--","常三島キャンパス","蔵本キャンパス"]
        case .tokushimabunri: return ["--","香川キャンパス","徳島キャンパス"]
        case .narutokyoiku: return ["--","本校"]
        case .matuyama: return ["--","本校"]
        case .matuyamasinonomejyoshi: return ["--","本校"]
        }
    }
}
