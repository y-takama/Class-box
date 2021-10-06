//
//  TohokuUniversity.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/23.
//

import SwiftUI

enum TohokuUniversity: String, CaseIterable {
    case Hirosaki // 弘前大学
    case Iwate // 岩手大学
    case Touhoku // 東北大学
    case Miyagikyouiku // 宮城教育大学
    case Akita // 秋田大学
    case Yamagata // 山形大学
    case Hukusima // 福島大学
    case Aomorikenrituhoken // 青森県立保健大学
    case Aomorikouritu // 青森公立大学
    case Iwatekenritu // 岩手県立大学
    case Miyagi // 宮城大学
    case Akitakenritu // 秋田県立大学
    case Akitakouritubijutu // 秋田公立美術大学
    case Kokusaikyouyou // 国際教養大学
    case Yamagatakenrituyonezawaeiyou // 山形県立米沢栄養大学
    case Yamagatahokeniryou // 山形保健医療大学
    case Aizu // 会津大学
    case Hukusimakenrituika // 福島県立医科大学
    case Aomori // 青森大学
    case Aomorityuuougakuin // 青森中央学院大学
    case Sibatagakuen // 柴田学園大学
    case Hatinohegakuin // 八戸学院大学
    case Hatinohekougyou // 八戸工業大学
    case Hirosakiiryouhukusi // 弘前医療福祉大学
    case Hirosakigakuin // 弘前学院大学
    case Iwateika // 岩手医科大学
    case Iwatehokeniryou // 岩手保健医療大学
    case Huji // 富士大学
    case Morioka // 盛岡大学
    case Isimakisensyuu // 石巻専修大学
    case Syoukeigakuin // 尚絅学院大学
    case Sendai // 仙台大学
    case Sendaisirayurijosi // 仙台白百合女子大学
    case Touhokuikayakka // 東北医科薬科大学
    case Touhokugakuin // 東北学院大学
    case Touhokukougyou // 東北工業大学
    case Touhokuseikatubunnka // 東北生活文化大学
    case Touhokuhukusi // 東北福祉大学
    case Touhokubunnkagakuenn // 東北文化学園大学
    case Miyagigakuinnjosi // 宮城学院女子大学
    case Akitakanngohukusi // 秋田看護福祉大学
    case Nihonnsekijuujiakitakanngo // 日本赤十字秋田看護大学
    case Nosuajia // ノースアジア大学
    case Touhokugeijutukouka // 東北芸術工科大学
    case Touhokukouekibunnka // 東北公益文科大学
    case Touhokubunnkyou // 東北文教大学
    case Iryousousei // 医療創生大学
    case Ouu // 奥羽大学
    case Kooriyamajosi // 郡山女子大学
    case Higasinipponnkokusai // 東日本国際大学
    case Hukusimagakuinn // 福島学院大学
    
    
    var name: String {
        switch self {
        case .Hirosaki: return "弘前大学"
        case .Iwate: return "岩手大学"
        case .Touhoku: return "東北大学"
        case .Miyagikyouiku: return "宮城教育大学"
        case .Akita: return "秋田大学"
        case .Yamagata: return "山形大学"
        case .Hukusima: return "福島大学"
        case .Aomorikenrituhoken: return "青森県立保健大学"
        case .Aomorikouritu: return "青森公立大学"
        case .Iwatekenritu: return "岩手県立大学"
        case .Miyagi: return "宮城大学"
        case .Akitakenritu: return "秋田県立大学"
        case .Akitakouritubijutu: return "秋田公立美術大学"
        case .Kokusaikyouyou: return "国際教養大学"
        case .Yamagatakenrituyonezawaeiyou: return "山形県立米沢栄養大学"
        case .Yamagatahokeniryou: return "山形保健医療大学"
        case .Aizu: return "会津大学"
        case .Hukusimakenrituika: return "福島県立医科大学"
        case .Aomori: return "青森大学"
        case .Aomorityuuougakuin: return "青森中央学院大学"
        case .Sibatagakuen: return "柴田学園大学"
        case .Hatinohegakuin: return "八戸学院大学"
        case .Hatinohekougyou: return "八戸工業大学"
        case .Hirosakiiryouhukusi: return "弘前医療福祉大学"
        case .Hirosakigakuin: return "弘前学院大学"
        case .Iwateika: return "岩手医科大学"
        case .Iwatehokeniryou: return "岩手保健医療大学"
        case .Huji: return "富士大学"
        case .Morioka: return "盛岡大学"
        case .Isimakisensyuu: return "石巻専修大学"
        case .Syoukeigakuin: return "尚絅学院大学"
        case .Sendai: return "仙台大学"
        case .Sendaisirayurijosi: return "仙台白百合女子大学"
        case .Touhokuikayakka: return "東北医科薬科大学"
        case .Touhokugakuin: return "東北学院大学"
        case .Touhokukougyou: return "東北工業大学"
        case .Touhokuseikatubunnka: return "東北生活文化大学"
        case .Touhokuhukusi: return "東北福祉大学"
        case .Touhokubunnkagakuenn: return "東北文化学園大学"
        case .Miyagigakuinnjosi: return "宮城学院女子大学"
        case .Akitakanngohukusi: return "秋田看護福祉大学"
        case .Nihonnsekijuujiakitakanngo: return "日本赤十字秋田看護大学"
        case .Nosuajia: return "ノースアジア大学"
        case .Touhokugeijutukouka: return "東北芸術工科大学"
        case .Touhokukouekibunnka: return "東北公益文科大学"
        case .Touhokubunnkyou: return "東北文教大学"
        case .Iryousousei: return "医療創生大学"
        case .Ouu: return "奥羽大学"
        case .Kooriyamajosi: return "郡山女子大学"
        case .Higasinipponnkokusai: return "東日本国際大学"
        case .Hukusimagakuinn: return "福島学院大学"
        }
    }
    
    var description: [String] {
        switch self {
        case .Hirosaki: return ["--","文教町地区","富野町地区","学園町地区","本町地区","青森サテライト教室","八戸サテライト"]
        case .Iwate: return ["--","上田キャンパス","釜石キャンパス"]
        case .Touhoku: return ["--","片平キャンパス","川内キャンパス","青葉山キャンパス","星陵キャンパス"]
        case .Miyagikyouiku: return ["--","本校"]
        case .Akita: return ["--","手形キャンパス","本道キャンパス","保戸野キャンパス"]
        case .Yamagata: return ["--","小白川キャンパス","飯田キャンパス","米沢キャンパス","鶴岡キャンパス"]
        case .Hukusima: return ["--","本校"]
        case .Aomorikenrituhoken: return ["--","本校"]
        case .Aomorikouritu: return ["--","本校"]
        case .Iwatekenritu: return ["--","滝沢キャンパス","宮古キャンパス","アイーナキャンパス"]
        case .Miyagi: return ["--","大和キャンパス","太白キャンパス"]
        case .Akitakenritu: return ["--","秋田キャンパス","本荘キャンパス","大潟キャンパス"]
        case .Akitakouritubijutu: return ["--","本校"]
        case .Kokusaikyouyou: return ["--","本校"]
        case .Yamagatakenrituyonezawaeiyou: return ["--","本校"]
        case .Yamagatahokeniryou: return ["--","本校"]
        case .Aizu: return ["--","本校"]
        case .Hukusimakenrituika: return ["--","光が丘キャンパス","福島駅前キャンパス"]
        case .Aomori: return ["--","本校"]
        case .Aomorityuuougakuin: return ["--","本校"]
        case .Sibatagakuen: return ["--","本校"]
        case .Hatinohegakuin: return ["--","本校"]
        case .Hatinohekougyou: return ["--","   本校"]
        case .Hirosakiiryouhukusi: return ["--","本校"]
        case .Hirosakigakuin: return ["--","本校"]
        case .Iwateika: return ["--","矢巾キャンパス","内丸キャンパス"]
        case .Iwatehokeniryou: return ["--","本校"]
        case .Huji: return ["--","本校"]
        case .Morioka: return ["--","本校"]
        case .Isimakisensyuu: return ["--","本校"]
        case .Syoukeigakuin: return ["--","本校"]
        case .Sendai: return ["--","本校"]
        case .Sendaisirayurijosi: return ["--","本校"]
        case .Touhokuikayakka: return ["--","小松島キャンパス","福室キャンパス"]
        case .Touhokugakuin: return ["--","泉キャンパス","多賀城キャンパス","土樋キャンパス"]
        case .Touhokukougyou: return ["--","八木山キャンパス","長町キャンパス"]
        case .Touhokuseikatubunnka: return ["--","本校"]
        case .Touhokuhukusi: return ["--","国見キャンパス","仙台駅東口キャンパス","ステーションキャンパス","国見ケ丘第１キャンパス","国見ケ丘第２キャンパス","朴木山キャンパス","北山キャンパス"]
        case .Touhokubunnkagakuenn: return ["--","本校"]
        case .Miyagigakuinnjosi: return ["--","本校"]
        case .Akitakanngohukusi: return ["--","秋田キャンパス","大館キャンパス"]
        case .Nihonnsekijuujiakitakanngo: return ["--","本校"]
        case .Nosuajia: return ["--","本校"]
        case .Touhokugeijutukouka: return ["--","山形キャンパス","外苑キャンパス"]
        case .Touhokukouekibunnka: return ["--","酒田キャンパス","鶴岡キャンパス"]
        case .Touhokubunnkyou: return ["--","本校"]
        case .Iryousousei: return ["--","本校","柏キャンパス"]
        case .Ouu: return ["--","本校"]
        case .Kooriyamajosi: return ["--","本校"]
        case .Higasinipponnkokusai: return ["--","鎌田キャンパス"]
        case .Hukusimagakuinn: return ["--","宮代キャンパス","福島駅前キャンパス"]
        }
    }
}
