//
//  TyugokuUniversity.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/24.
//

import SwiftUI

enum TyugokuUniversity: String, CaseIterable {
    case ubehuronntelia // 宇部フロンティア大学
    case eikei // 叡啓大学
    case erizabetoonngaku // エリザベト音楽大学
    case okayama // 岡山大学
    case okayamairyousennmonnsyoku // 岡山医療専門職大学
    case okayamagakuin // 岡山学院大学
    case okayamakenritu // 岡山県立大学
    case okayamasyoka // 岡山商科大学
    case okayamarika // 岡山理科大学
    case onomitishiritu // 尾道私立大学
    case kawasakika // 川崎医科大学
    case kawasakiiryohukushi // 川崎医療福祉大学
    case kantaiheyo // 環太平洋大学
    case kibikokusai // 吉備国際大学
    case kurashikigeijyutugakugei // 倉敷芸術学芸大学
    case kurashikisakuyo // くらしき作陽大学
    case kenrituhroshima // 県立広島大学
    case koritutottorikankyo // 公立鳥取環境大学
    case sanyogakuen // 山陽学園大学
    case siseikan // 至誠館大学
    case shimane // 島根大学
    case simanekenritu // 島根県立大学
    case shimonosekishiritu // 下関市立大学
    case shirituyamagutitokyorika // 私立山口東京理科大学
    case syujitu // 就実大学
    case tyugokugakuen // 中国学園大学
    case toua // 東亜大学
    case tokuyama // 徳山大学
    case tottori // 鳥取大学
    case tottorikanngo // 鳥取看護大学
    case nihonsekijyujihirosimakango // 日本赤十字広島看護大学
    case nimikouritu // 新見公立大学
    case notorudamuseisinjyoshi // ノートルダム清心女子大学
    case baikogakuin // 梅光学院大学
    case bisaku // 美作大学
    case hijiyama // 比治山大学
    case hiroshima // 広島大学
    case hiroshimakeizai // 広島経済大学
    case hirosimakougyou // 広島工業大学
    case hiroshimakokusai // 広島国際大学
    case hiroshimasyudo // 広島修道大学
    case hiroshimajyogakuin // 広島女学院大学
    case hiroshimashiritu // 広島市立大学
    case hiroshimatoshigakuen // 広島都市学園大学
    case hiroshimabunkagakuen // 広島文化学園大学
    case hiroshimabunkyo // 広島文教大学
    case hukuyama // 福山大学
    case hukuyamashiritu // 福山市立大学
    case hukuyamaheisei // 福山平成大学
    case yasudajyosi // 安田女子大学
    case yamaguti // 山口大学
    case yamagutigakugei // 山口学芸大学
    case yamagutikenritu // 山口県立大学
    case yamagutitoukyourika // 山口東京理科大学
    
    var name: String {
        switch self {
        case .ubehuronntelia: return "宇部フロンティア大学"
        case .eikei: return "叡啓大学"
        case .erizabetoonngaku: return "エリザベト音楽大学"
        case .okayama: return "岡山大学"
        case .okayamairyousennmonnsyoku: return "岡山医療専門職大学"
        case .okayamagakuin: return "岡山学院大学"
        case .okayamakenritu: return "岡山県立大学"
        case .okayamasyoka: return "岡山商科大学"
        case .okayamarika: return "岡山理科大学"
        case .onomitishiritu: return "尾道私立大学"
        case .kawasakika: return "川崎医科大学"
        case .kawasakiiryohukushi: return "川崎医療福祉大学"
        case .kantaiheyo: return "環太平洋大学"
        case .kibikokusai: return "吉備国際大学"
        case .kurashikigeijyutugakugei: return "倉敷芸術学芸大学"
        case .kurashikisakuyo: return "くらしき作陽大学"
        case .kenrituhroshima: return "県立広島大学"
        case .koritutottorikankyo: return "公立鳥取環境大学"
        case .sanyogakuen: return "山陽学園大学"
        case .siseikan: return "至誠館大学"
        case .shimane: return "島根大学"
        case .simanekenritu: return "島根県立大学"
        case .shimonosekishiritu: return "下関市立大学"
        case .syujitu: return "就実大学"
        case .shirituyamagutitokyorika: return "私立山口東京理科大学"
        case .tyugokugakuen: return "中国学園大学"
        case .toua: return "東亜大学"
        case .tokuyama: return "徳山大学"
        case .tottori: return "鳥取大学"
        case .tottorikanngo: return "鳥取看護大学"
        case .nimikouritu: return "新見公立大学"
        case .nihonsekijyujihirosimakango: return "日本赤十字看護大学"
        case .notorudamuseisinjyoshi: return "ノートルダム清心女子大学"
        case .baikogakuin: return "梅光学院大学"
        case .bisaku: return "美作大学"
        case .hijiyama: return "比治山大学"
        case .hiroshima: return "広島大学"
        case .hiroshimakeizai: return "広島経済大学"
        case .hirosimakougyou: return "広島工業大学"
        case .hiroshimakokusai: return "広島国際大学"
        case .hiroshimasyudo: return "広島修道大学"
        case .hiroshimajyogakuin: return "広島女学院大学"
        case .hiroshimashiritu: return "広島市立大学"
        case .hiroshimatoshigakuen: return "広島都市学園大学"
        case .hiroshimabunkagakuen: return "広島文化学園大学"
        case .hiroshimabunkyo: return "広島文教大学"
        case .hukuyama: return "福山大学"
        case .hukuyamashiritu: return "福山市立大学"
        case .hukuyamaheisei: return "福山平成大学"
        case .yasudajyosi: return "安田女子大学"
        case .yamaguti: return "山口大学"
        case .yamagutikenritu: return "山口県立大学"
        case .yamagutigakugei: return "山口学芸大学"
        case .yamagutitoukyourika: return "山口東京理科大学"
        
            }
    }
    
    var description: [String] {
        switch self {
        case .ubehuronntelia: return ["--","本校"]
        case .eikei: return ["--","本校"]
        case .erizabetoonngaku: return ["--","幟町キャンパス","西条キャンパス"]
        case .okayama: return ["--","津島キャンパス","鹿田キャンパス"]
        case .okayamagakuin: return ["--","本校"]
        case .okayamakenritu: return ["--","本校"]
        case .okayamasyoka: return ["--","本校"]
        case .okayamairyousennmonnsyoku: return ["--","本校"]
        case .okayamarika: return ["--","本校"]
        case .onomitishiritu: return ["--","本校"]
        case .kawasakiiryohukushi: return ["--","本校"]
        case .kantaiheyo: return ["--","本校"]
        case .kibikokusai: return ["--","南あわじ志知キャンパス","高梁キャンパス"]
        case .kurashikigeijyutugakugei: return ["--","本校"]
        case .kurashikisakuyo: return ["--","本校"]
        case .kenrituhroshima: return ["--","三原キャンパス","庄原キャンパス"]
        case .koritutottorikankyo: return ["--","本校"]
        case .sanyogakuen: return ["--","本校"]
        case .siseikan: return ["--","萩本校キャンパス","東京キャンパス"]
        case .simanekenritu: return ["--","松江キャンパス","出雲キャンパス","浜田キャンパス"]
        case .shimonosekishiritu: return ["--","本校"]
        case .shimane: return ["--","松江キャンパス","出雲キャンパス"]
        case .syujitu: return ["--","本校"]
        case .shirituyamagutitokyorika: return ["--","本校"]
        case .tyugokugakuen: return ["--","本校"]
        case .toua: return ["--","本校"]
        case .tokuyama: return ["--","本校"]
        case .tottori: return ["--","鳥取キャンパス米子キャンパス"]
        case .tottorikanngo: return ["--","本校"]
        case .nihonsekijyujihirosimakango: return ["--","広尾キャンパス","大宮キャンパス"]
        case .nimikouritu: return ["--","本校"]
        case .notorudamuseisinjyoshi: return ["--","本校"]
        case .baikogakuin: return ["--","本校"]
        case .bisaku: return ["--","本校"]
        case .hijiyama: return ["--","本校"]
        case .hiroshima: return ["--","東千田キャンパス","霞キャンパス","東広島キャンパス"]
        case .hiroshimakeizai: return ["--","本校"]
        case .hirosimakougyou: return ["--","五日市キャンパス","沼田キャンパス","広島校舎","八千代校舎"]
        case .hiroshimakokusai: return ["--","呉キャンパス","東広島キャンパス"]
        case .hiroshimasyudo: return ["--","本校"]
        case .hiroshimajyogakuin: return ["--","本校"]
        case .hiroshimashiritu: return ["--","本校"]
        case .hiroshimatoshigakuen: return ["--","西風新都キャンパス","宇品キャンパス"]
        case .hiroshimabunkagakuen: return ["--","長束キャンパス","坂キャンパス","阿賀キャンパス","郷原キャンパス"]
        case .hiroshimabunkyo: return ["--","本校"]
        case .hukuyama: return ["--","本校"]
        case .hukuyamashiritu: return ["--","本校"]
        case .hukuyamaheisei: return ["--","本校"]
        case .yasudajyosi: return ["--","本校"]
        case .yamaguti: return ["--","吉田キャンパス","小串キャンパス","常盤キャンパス"]
        case .yamagutigakugei: return ["--","本校"]
        case .yamagutikenritu: return ["--","本校"]
        case .yamagutitoukyourika: return ["--","本校"]
        case .kawasakika: return ["--","本校"]
        }
    }
}
