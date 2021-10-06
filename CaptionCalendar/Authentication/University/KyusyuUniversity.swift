//
//  KyusyuUniversity.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/24.
//

import SwiftUI

enum KyusyuUniversity: String, CaseIterable {
    case kyusyu // 九州大学
    case hukuokajyoshi // 福岡女子大学
    case kumamoto // 熊本大学
    case nagasaki // 長崎大学
    case kitakyusyusiritu // 北九州市立大学
    case kagoshima // 鹿児島大学
    case kumamotokenritu // 熊本県立大学
    case oita // 大分大学
    case miyazaki // 宮崎大学
    case saga // 佐賀大学
    case nagasakikenritu // 長崎県立大学
    case kanoyataiku // 鹿屋体育大学
    case ryukyu // 琉球大学
    case hukuokakenritu // 福岡県立大学
    case hukuokakyoiku // 福岡教育大学
    case meio // 名桜大学
    case okinawakenritugeijyutu // 沖縄県立芸術大学
    case seinangakuin // 西南学院大学
    case ritumeikanajiataiheyo // 立命館アジア太平洋大学
    case hukuoka // 福岡大学
    case nakamuragakuin // 中村学院大学
    case kyusyusangyo // 九州産業大学
    case kyusyuruteru // 九州ルーテル大学
    case kurume // 久留米大学
    case kyusyueiyohukushi // 九州栄養福祉大学
    case syokei // 尚絅大学
    case miyazakisangyokeiei // 宮崎産業経営大学
    case okinawakokusai // 沖縄国際大学
    case hukuokakogyo // 福岡工業大学
    case hukuokajyogakuin // 福岡女学院大学
    case nishikyusyu // 西九州大学
    case kassuijyoshi // 活水女子大学
    case seinaijyogakuin // 西南女学院大学
    case kumamotogakuin // 熊本学院大学
    case beppu // 別府大学
    case miyazakikokusai // 宮崎国際大学
    case kyusyukyouritu // 九州共立大学
    case kyusyujyoshi // 九州女子大学
    case tukushijyogakuen // 筑紫女学園大学
    case okinawa // 沖縄大学
    case shigakuen // 志学園大学
    
    
    
    var name: String {
        switch self {
        case .kyusyu: return "九州大学"
        case .hukuokajyoshi: return "福岡女子大学"
        case .kumamoto: return "熊本大学"
        case .nagasaki: return "長崎大学"
        case .kitakyusyusiritu: return "北九州市立大学"
        case .kagoshima: return "鹿児島大学"
        case .kumamotokenritu: return "熊本県立大学"
        case .oita: return "大分大学"
        case .miyazaki: return "宮崎大学"
        case .saga: return "佐賀大学"
        case .nagasakikenritu: return "長崎県立大学"
        case .kanoyataiku: return "鹿屋体育大学"
        case .ryukyu: return "琉球大学"
        case .hukuokakenritu: return "福岡県立大学"
        case .hukuokakyoiku: return "福岡教育大学"
        case .meio: return "名桜大学"
        case .okinawakenritugeijyutu: return "沖縄県立芸術大学"
        case .seinangakuin: return "西南学院大学"
        case .ritumeikanajiataiheyo: return "立命館アジア太平洋大学"
        case .hukuoka: return "福岡大学"
        case .nakamuragakuin: return "中村学院大学"
        case .kyusyusangyo: return "九州産業大学"
        case .kyusyuruteru: return "九州ルーテル大学"
        case .kurume: return "久留米大学"
        case .kyusyueiyohukushi: return "九州栄養福祉大学"
        case .syokei: return "尚絅大学"
        case .miyazakisangyokeiei: return "宮崎産業経営大学"
        case .okinawakokusai: return "沖縄国際大学"
        case .hukuokakogyo: return "福岡工業大学"
        case .hukuokajyogakuin: return "福岡女学院大学"
        case .nishikyusyu: return "西九州大学"
        case .kassuijyoshi: return "活水女子大学"
        case .seinaijyogakuin: return "西南女学院大学"
        case .kumamotogakuin: return "熊本学院大学"
        case .beppu: return "別府大学"
        case .miyazakikokusai: return "宮崎国際大学"
        case .kyusyukyouritu: return "九州共立大学"
        case .kyusyujyoshi: return "九州女子大学"
        case .tukushijyogakuen: return "筑紫女学園大学"
        case .okinawa: return "沖縄大学"
        case .shigakuen: return "志学園大学"
            }
    }
    
    var description: [String] {
        switch self {
        case .kyusyu: return ["--","病院キャンパス","大橋キャンパス","筑紫キャンパス","伊都キャンパス","未設定"]
        case .hukuokajyoshi: return ["--","未設定"]
        case .kumamoto: return ["--","黒髪地区","本荘地区","大江地区","本荘南地区","未設定"]
        case .nagasaki: return ["--","片渕地区キャンパス","坂本地区","キャンパス","文教地区キャンパス","未設定"]
        case .kitakyusyusiritu: return ["--","北片キャンパス","ひびきのキャンパス","未設定"]
        case .kagoshima: return ["--","下荒田キャンパス","郡元キャンパス","桜ヶ丘キャンパス","未設定"]
        case .kumamotokenritu: return ["--","未設定"]
        case .oita: return ["--","旦野原キャンパス","挟間キャンパス","未設定"]
        case .miyazaki: return ["--","清武キャンパス","木花キャンパス","未設定"]
        case .saga: return ["--","本庄キャンパス","鍋島キャンパス","未設定"]
        case .nagasakikenritu: return ["--","シーボルト校","佐世保","未設定"]
        case .kanoyataiku: return ["--","未設定"]
        case .ryukyu: return ["--","千原キャンパス","上原キャンパス","未設定"]
        case .hukuokakenritu: return ["--","未設定"]
        case .hukuokakyoiku: return ["--","未設定"]
        case .meio: return ["--","未設定"]
        case .okinawakenritugeijyutu: return ["--","首里崎山キャンパス","首里当蔵キャンパス","未設定"]
        case .seinangakuin: return ["--","未設定"]
        case .ritumeikanajiataiheyo: return ["--","未設定"]
        case .hukuoka: return ["--","未設定"]
        case .nakamuragakuin: return ["--","未設定"]
        case .kyusyusangyo: return ["--","未設定"]
        case .kyusyuruteru: return ["--","未設定"]
        case .kurume: return ["--","旭町キャンパス","御井キャンパス","未設定"]
        case .kyusyueiyohukushi: return ["--","小倉南区キャンパス","小倉北区キャンパス","未設定"]
        case .syokei: return ["--","未設定"]
        case .miyazakisangyokeiei: return ["--","未設定"]
        case .okinawakokusai: return ["--","未設定"]
        case .hukuokakogyo: return ["--","未設定"]
        case .hukuokajyogakuin: return ["--","未設定"]
        case .nishikyusyu: return ["--","佐賀キャンパス","神崎キャンパス","小城キャンパス","未設定"]
        case .kassuijyoshi: return ["--","東山手キャンパス","大村キャンパス","未設定"]
        case .seinaijyogakuin: return ["--","未設定"]
        case .kumamotogakuin: return ["--","未設定"]
        case .beppu: return ["--","未設定"]
        case .miyazakikokusai: return ["--","未設定"]
        case .kyusyukyouritu: return ["--","未設定"]
        case .kyusyujyoshi: return ["--","未設定"]
        case .tukushijyogakuen: return ["--","未設定"]
        case .okinawa: return ["--","未設定"]
        case .shigakuen: return ["--","未設定"]
        }
    }
}
