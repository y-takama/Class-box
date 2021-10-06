//
//  TyugokuUniversity.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/24.
//

import SwiftUI

enum TyugokuUniversity: String, CaseIterable {
    case okayama // 岡山大学
    case hiroshima // 広島大学
    case hiroshimashiritu // 広島市立大学
    case shimane // 島根大学
    case eikei // 叡啓大学
    case yamaguti // 山口大学
    case okayamakenritu // 岡山県立大学
    case kenrituhroshima // 県立広島大学
    case simanekenritu // 島根県立大学
    case onomitishiritu // 尾道私立大学
    case tottori // 鳥取大学
    case yamagutikenritu // 山口県立大学
    case nimikouritu // 新見公立大学
    case shimonosekishiritu // 下関市立大学
    case hukuyamashiritu // 福山市立大学
    case koritutottorikankyo // 公立鳥取環境大学
    case shirituyamagutitokyorika // 私立山口東京理科大学
    case notorudamuseisinjyoshi // ノートルダム清心女子大学
    case syujitu // 就実大学
    case yasudajyosi // 安田女子大学
    case hiroshimabunkyo // 広島文教大学
    case okayamasyoka // 岡山商科大学
    case okayamarika // 岡山理科大学
    case hiroshimasyudo // 広島修道大学
    case hiroshimakokusai // 広島国際大学
    case bisaku // 美作大学
    case kurashikisakuyo // くらしき作陽大学
    case yamagutigakugei // 山口学芸大学
    case kawasakiiryohukushi // 川崎医療福祉大学
    case sanyogakuen // 山陽学園大学
    case hijiyama // 比治山大学
    case tyugokugakuen // 中国学園大学
    case hiroshimabunkagakuen // 広島文化学園大学
    case hiroshimajyogakuin // 広島女学院大学
    case kibikokusai // 吉備国際大学
    case kurashikigeijyutugakugei // 倉敷芸術学芸大学
    case okayamagakuin // 岡山学院大学
    case hiroshimakeizai // 広島経済大学
    case hiroshimatoshigakuen // 広島都市学園大学
    case baikogakuin // 梅光学院大学
    case kantaiheyo // 環太平洋大学
    case nihonsekijyujikango // 日本赤十字看護大学
    
    
    var name: String {
        switch self {
        case .okayama: return "岡山大学"
        case .hiroshima: return "広島大学"
        case .hiroshimashiritu: return "広島市立大学"
        case .shimane: return "島根大学"
        case .eikei: return "叡啓大学"
        case .yamaguti: return "山口大学"
        case .okayamakenritu: return "岡山県立大学"
        case .kenrituhroshima: return "県立広島大学"
        case .simanekenritu: return "島根県立大学"
        case .onomitishiritu: return "尾道私立大学"
        case .tottori: return "鳥取大学"
        case .yamagutikenritu: return "山口県立大学"
        case .nimikouritu: return "新見公立大学"
        case .shimonosekishiritu: return "下関市立大学"
        case .hukuyamashiritu: return "福山市立大学"
        case .koritutottorikankyo: return "公立鳥取環境大学"
        case .shirituyamagutitokyorika: return "私立山口東京理科大学"
        case .notorudamuseisinjyoshi: return "ノートルダム清心女子大学"
        case .syujitu: return "就実大学"
        case .yasudajyosi: return "安田女子大学"
        case .hiroshimabunkyo: return "広島文教大学"
        case .okayamasyoka: return "岡山商科大学"
        case .okayamarika: return "岡山理科大学"
        case .hiroshimasyudo: return "広島修道大学"
        case .hiroshimakokusai: return "広島国際大学"
        case .bisaku: return "美作大学"
        case .kurashikisakuyo: return "くらしき作陽大学"
        case .yamagutigakugei: return "山口学芸大学"
        case .kawasakiiryohukushi: return "川崎医療福祉大学"
        case .sanyogakuen: return "山陽学園大学"
        case .hijiyama: return "比治山大学"
        case .tyugokugakuen: return "中国学園大学"
        case .hiroshimabunkagakuen: return "広島文化学園大学"
        case .hiroshimajyogakuin: return "広島女学院大学"
        case .kibikokusai: return "吉備国際大学"
        case .kurashikigeijyutugakugei: return "倉敷芸術学芸大学"
        case .okayamagakuin: return "岡山学院大学"
        case .hiroshimakeizai: return "広島経済大学"
        case .hiroshimatoshigakuen: return "広島都市学園大学"
        case .baikogakuin: return "梅光学院大学"
        case .kantaiheyo: return "環太平洋大学"
        case .nihonsekijyujikango: return "日本赤十字看護大学"
            }
    }
    
    var description: [String] {
        switch self {
        case .okayama: return ["--","津島キャンパス","鹿田キャンパス","未設定"]
        case .hiroshima: return ["--","東千田キャンパス","霞キャンパス","東広島キャンパス","未設定"]
        case .hiroshimashiritu: return ["--","未設定"]
        case .shimane: return ["--","松江キャンパス","出雲キャンパス","未設定"]
        case .eikei: return ["--","未設定"]
        case .yamaguti: return ["--","吉田キャンパス","小串キャンパス","常盤キャンパス","未設定"]
        case .okayamakenritu: return ["--","未設定"]
        case .kenrituhroshima: return ["--","三原キャンパス","庄原キャンパス","未設定"]
        case .simanekenritu: return ["--","松江キャンパス","出雲キャンパス","浜田キャンパス","未設定"]
        case .onomitishiritu: return ["--","未設定"]
        case .tottori: return ["--","鳥取キャンパス米子キャンパス未設定"]
        case .yamagutikenritu: return ["--","未設定"]
        case .nimikouritu: return ["--","未設定"]
        case .shimonosekishiritu: return ["--","未設定"]
        case .hukuyamashiritu: return ["--","未設定"]
        case .koritutottorikankyo: return ["--","未設定"]
        case .shirituyamagutitokyorika: return ["--","未設定"]
        case .notorudamuseisinjyoshi: return ["--","未設定"]
        case .syujitu: return ["--","未設定"]
        case .yasudajyosi: return ["--","未設定"]
        case .hiroshimabunkyo: return ["--","未設定"]
        case .okayamasyoka: return ["--","未設定"]
        case .okayamarika: return ["--","未設定"]
        case .hiroshimasyudo: return ["--","未設定"]
        case .hiroshimakokusai: return ["--","呉キャンパス","東広島キャンパス","未設定"]
        case .bisaku: return ["--","未設定"]
        case .kurashikisakuyo: return ["--","未設定"]
        case .yamagutigakugei: return ["--","未設定"]
        case .kawasakiiryohukushi: return ["--","未設定"]
        case .sanyogakuen: return ["--","未設定"]
        case .hijiyama: return ["--","未設定"]
        case .tyugokugakuen: return ["--","未設定"]
        case .hiroshimabunkagakuen: return ["--","長束キャンパス","坂キャンパス","阿賀キャンパス","郷原キャンパス","未設定"]
        case .hiroshimajyogakuin: return ["--","未設定"]
        case .kibikokusai: return ["--","南あわじ志知キャンパス","高梁キャンパス","未設定"]
        case .kurashikigeijyutugakugei: return ["--","未設定"]
        case .okayamagakuin: return ["--","未設定"]
        case .hiroshimakeizai: return ["--","未設定"]
        case .hiroshimatoshigakuen: return ["--","西風新都キャンパス","宇品キャンパス","未設定"]
        case .baikogakuin: return ["--","未設定"]
        case .kantaiheyo: return ["--","未設定"]
        case .nihonsekijyujikango: return ["--","広尾キャンパス","大宮キャンパス","未設定"]
        }
    }
}
