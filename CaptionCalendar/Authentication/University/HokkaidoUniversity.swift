//
//  HokkaidoUniversity.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/23.
//

import SwiftUI

enum HokkaidoUniversity: String, CaseIterable {
    case Asahikawaika // 旭川医科大学
    case Otarusyouka // 小樽商科大学
    case Obihirotikusann // 帯広畜産大学
    case Kitamikougyou // 北見工業大学
    case Hokkaidou // 北海道大学
    case asahikawakou // 北海道教育大学旭校
    case iwamisawakou // 北海道教育大学岩見沢校
    case kusirokou // 北海道教育大学釧路校
    case Sapporokou // 北海道教育大学札幌校
    case Hakodatekou // 北海道教育大学函館校
    case Murorannkougyou // 室蘭工業大学
    case Kusirokouritu // 釧路公立大学
    case Sapporoika // 札幌医科大学
    case Sapporoitiritu // 札幌市立大学
    case Titosekagakugijutu // 千歳科学技術大学
    case Nayoroitiritu // 名寄市立大学
    case Hakodatemirai // はこだて未来大学
    case Asahikawa // 旭川大学
    case Ikueikan // 育英館大学
    case Sapporo // 札幌大学
    case Sapporoootani // 札幌大谷大学
    case Sapporogakuin // 札幌学院大学
    case Sapporokokusai // 札幌国際大学
    case Sappporohokenniryou // 札幌保健医療大学
    case Seisadouto // 星槎道都大学
    case Tensi // 天使大学
    case Nihonnsekijuujihokkaidoukanngo // 日本赤十字北海道看護大学
    case Nihoniryou // 日本医療大学
    case Hakodate // 函館大学
    case Hujijosi // 藤女子大学
    case Hokusyou // 北翔大学
    case Hokuseigakuen // 北星学園大学
    case Hokuyou // 北洋大学
    case Hokkaigakuenn // 北海学園大学
    case Hokkaisyouka // 北海商科大学
    case Hokkaidouiryou // 北海道医療大学
    case Hokkaidoukagaku // 北海道科学大学
    case Hokkaidoujouhou // 北海道情報大学
    case Hokkaidoutitoserihabiritesyonn // 北海道千歳リハビリテーション大学
    case Hokkaidoubunkyou // 北海道文教大学
    case Rakunougakuenn // 酪農学園大学
    
    var name: String {
        switch self {
        case .Asahikawaika: return "旭川医科大学"
        case .Otarusyouka: return "小樽商科大学"
        case .Obihirotikusann: return "帯広畜産大学"
        case .Kitamikougyou: return "北見工業大学"
        case .Hokkaidou: return "北海道大学"
        case .asahikawakou: return "北海道教育大学旭校"
        case .iwamisawakou: return "北海道教育大学岩見沢校"
        case .kusirokou: return "北海道教育大学釧路校"
        case .Sapporokou: return "北海道教育大学札幌校"
        case .Hakodatekou: return "北海道教育大学函館校"
        case .Murorannkougyou: return "室蘭工業大学"
        case .Kusirokouritu: return "釧路公立大学"
        case .Sapporoika: return "札幌医科大学"
        case .Sapporoitiritu: return "札幌市立大学"
        case .Titosekagakugijutu: return "千歳科学技術大学"
        case .Nayoroitiritu: return "名寄市立大学"
        case .Hakodatemirai: return "はこだて未来大学"
        case .Asahikawa: return "旭川大学"
        case .Ikueikan: return "育英館大学"
        case .Sapporo: return "札幌大学"
        case .Sapporoootani: return "札幌大谷大学"
        case .Sapporogakuin: return "札幌学院大学"
        case .Sapporokokusai: return "札幌国際大学"
        case .Sappporohokenniryou: return "札幌保健医療大学"
        case .Seisadouto: return "星槎道都大学"
        case .Tensi: return "天使大学"
        case .Nihonnsekijuujihokkaidoukanngo: return "日本赤十字北海道看護大学"
        case .Nihoniryou: return "日本医療大学"
        case .Hakodate: return "函館大学"
        case .Hujijosi: return "藤女子大学"
        case .Hokusyou: return "北翔大学"
        case .Hokuseigakuen: return "北星学園大学"
        case .Hokuyou: return "北洋大学"
        case .Hokkaigakuenn: return "北海学園大学"
        case .Hokkaisyouka: return "北海商科大学"
        case .Hokkaidouiryou: return "北海道医療大学"
        case .Hokkaidoukagaku: return "北海道科学大学"
        case .Hokkaidoujouhou: return "北海道情報大学"
        case .Hokkaidoutitoserihabiritesyonn: return "北海道千歳リハビリテーション大学"
        case .Hokkaidoubunkyou: return "北海道文教大学"
        case .Rakunougakuenn: return "酪農学園大学"
        }
    }
    
    var description: [String] {
        switch self {
        case .Asahikawaika: return ["--","本校"]
        case .Otarusyouka: return ["--","本校"]
        case .Obihirotikusann: return ["--","本校"]
        case .Kitamikougyou: return ["--","本校"]
        case .Hokkaidou: return ["--","札幌キャンパス","函館キャンパス"]
        case .asahikawakou: return ["--","本校"]
        case .iwamisawakou: return ["--","本校"]
        case .kusirokou: return ["--","本校"]
        case .Sapporokou: return ["--","本校"]
        case .Hakodatekou: return ["--","本校"]
        case .Murorannkougyou: return ["--","本校"]
        case .Kusirokouritu: return ["--","本校"]
        case .Sapporoika: return ["--","本校"]
        case .Sapporoitiritu: return ["--","桑園キャンパス","まこまないキャンパス","芸術の森キャンパス","サテライトキャンパス"]
        case .Titosekagakugijutu: return ["--","本校"]
        case .Nayoroitiritu: return ["--","本校"]
        case .Hakodatemirai: return ["--","本校","サテライトラボ"]
        case .Asahikawa: return ["--","本校"]
        case .Ikueikan: return ["--","本校"]
        case .Sapporo: return ["--","本校"]
        case .Sapporoootani: return ["--","本校"]
        case .Sapporogakuin: return ["--","江別キャンパス","新札幌キャンパス"]
        case .Sapporokokusai: return ["--","本部"]
        case .Sappporohokenniryou: return ["--","本部"]
        case .Seisadouto: return ["--","本校"]
        case .Tensi: return ["--","本校"]
        case .Nihonnsekijuujihokkaidoukanngo: return ["--","本校"]
        case .Nihoniryou: return ["--","月寒本キャンパス","恵み野キャンパス","真栄キャンパス"]
        case .Hakodate: return ["--","本部"]
        case .Hujijosi: return ["--","北１６条キャンパス","花川キャンパス"]
        case .Hokusyou: return ["--","本校"]
        case .Hokuseigakuen: return ["--","本校"]
        case .Hokuyou: return ["--","本校"]
        case .Hokkaigakuenn: return ["--","豊平キャンパス","山鼻キャンパス"]
        case .Hokkaisyouka: return ["--","本校"]
        case .Hokkaidouiryou: return ["--","当別キャンパス","札幌あいの里キャンパス","札幌サテライトキャンパス"]
        case .Hokkaidoukagaku: return ["--","桂岡キャンパス","サテライトキャンパス"]
        case .Hokkaidoujouhou: return ["--","本校"]
        case .Hokkaidoutitoserihabiritesyonn: return ["--","本校"]
        case .Hokkaidoubunkyou: return ["--","本校"]
        case .Rakunougakuenn: return ["--","本校"]
        }
    }
}
