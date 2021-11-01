//
//  KyusyuUniversity.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/24.
//

import SwiftUI

enum KyusyuUniversity: String, CaseIterable {
    case oita // 大分大学
    case Ooitakanngokagaku // 大分看護科学大学
    case okinawa // 沖縄大学
    case okinawakirisutokyougakuinn // 沖縄キリスト教学院大学
    case Okinawakennritukanngo // 沖縄県立看護大学
    case okinawakenritugeijyutu // 沖縄県立芸術大学
    case okinawakokusai // 沖縄国際大学
    case kagoshima // 鹿児島大学
    case kagosimakokusai // 鹿児島国際大学
    case kagosimajunnsinnnjosi // 鹿児島純心女子大学
    case kassuijyoshi // 活水女子大学
    case kanoyataiku // 鹿屋体育大学
    case kitakyusyusiritu // 北九州市立大学
    case kyusyu // 九州大学
    case kyusyueiyohukushi // 九州栄養福祉大学
    case kyuusyuukanngohukusi // 九州看護福祉大学
    case kyusyukyouritu // 九州共立大学
    case Kyuusyuukougyou // 九州工業大学
    case Kyuusyuukokusai // 九州国際大学
    case kyusyusangyo // 九州産業大学
    case Kyuusyuusika // 九州歯科大学
    case Kyuusyuujouhou // 九州情報大学
    case kyusyujyoshi // 九州女子大学
    case kyuusyuuhokennhukusi // 九州保健福祉大学
    case kyusyuruteru // 九州ルーテル大学
    case kumamoto // 熊本大学
    case kumamotogakuen // 熊本学園大学
    case kumamotokenritu // 熊本県立大学
    case kumamotohokennkagaku // 熊本保健科学大学
    case kurume // 久留米大学
    case Kurumekougyou // 久留米工業大学
    case saga // 佐賀大学
    case Sangyouika // 産業医科大学
    case Sigakukann // 志學館大学
    case Junnsinngakuenn // 純真学園大学
    case syokei // 尚絅大学
    case seinangakuin // 西南学院大学
    case seinaijyogakuin // 西南女学院大学
    case Seimariagakuin // 聖マリア学院大学
    case soujou // 崇城大学
    case daiitikouka // 第一工科大学
    case Daiitiyakka // 第一薬科大学
    case tinnzeigakuin // 鎮西学院大学
    case tukushijyogakuen // 筑紫女学園大学
    case nagasaki // 長崎大学
    case nagasakigaikokugo // 長崎外国語大学
    case nagasakikenritu // 長崎県立大学
    case nagasakikokusai // 長崎国際大学
    case nagasakijunnsinn // 長崎純心大学
    case nagaskaisougoukagaku // 長崎総合科学大学
    case nakamuragakuen // 中村学園大学
    case nishikyusyu // 西九州大学
    case Nisinipponnkougyou // 西日本工業大学
    case Nihonnkeizai // 日本経済大学
    case Nihonnsekijuujisyakyuusyuukanngo // 日本赤十字社九州看護大学
    case nihonnbunnri // 日本文理大学
    case hukuoka // 福岡大学
    case Hukuokakanngo // 福岡看護大学
    case hukuokakyoiku // 福岡教育大学
    case hukuokakenritu // 福岡県立大学
    case hukuokakogyo // 福岡工業大学
    case Hukuokokusaiiryouhukusi // 福岡国際医療福祉大学
    case hukuokasika // 福岡歯科大学
    case hukuokajyogakuin // 福岡女学院大学
    case hukuokajogakuinkanngo // 福岡女学院看護大学
    case hukuokajyoshi // 福岡女子大学
    case heiseionngaku // 平成音楽大学
    case beppu // 別府大学
    case minamikyuusyuu // 南九州大学
    case miyazaki // 宮崎大学
    case Miyazakikennritukanngo // 宮崎県立看護大学
    case Miyazakikouritu // 宮崎公立大学
    case miyazakikokusai // 宮崎国際大学
    case miyazakisangyokeiei // 宮崎産業経営大学
    case meio // 名桜大学
    case ritumeikanajiataiheyo // 立命館アジア太平洋大学
    case ryukyu // 琉球大学
    case reiwakennkoukagaku // 令和健康科学大学
    
    
    var name: String {
        switch self {
        case .oita: return "大分大学"
        case .Ooitakanngokagaku: return "大分看護科学大学"
        case .okinawa: return "沖縄大学"
        case .okinawakirisutokyougakuinn: return "沖縄キリスト教学院大学"
        case .Okinawakennritukanngo: return "沖縄県立看護大学"
        case .okinawakenritugeijyutu: return "沖縄県立芸術大学"
        case .okinawakokusai: return "沖縄国際大学"
        case .kagoshima: return "鹿児島大学"
        case .kagosimakokusai: return "鹿児島国際大学"
        case .kagosimajunnsinnnjosi: return "鹿児島純心女子大学"
        case .kanoyataiku: return "鹿屋体育大学"
        case .kassuijyoshi: return "活水女子大学"
        case .kitakyusyusiritu: return "北九州市立大学"
        case .kyusyu: return "九州大学"
        case .kyusyueiyohukushi: return "九州栄養福祉大学"
        case .kyuusyuukanngohukusi: return "九州看護福祉大学"
        case .kyusyukyouritu: return "九州共立大学"
        case .Kyuusyuukougyou: return "九州工業大学"
        case .Kyuusyuukokusai: return "九州国際大学"
        case .kyusyusangyo: return "九州産業大学"
        case .Kyuusyuusika: return "九州歯科大学"
        case .Kyuusyuujouhou: return "九州情報大学"
        case .kyusyujyoshi: return "九州女子大学"
        case .kyuusyuuhokennhukusi: return "九州保健福祉大学"
        case .kyusyuruteru: return "九州ルーテル大学"
        case .kumamoto: return "熊本大学"
        case .kumamotogakuen: return "熊本学園大学"
        case .kumamotokenritu: return "熊本県立大学"
        case .kumamotohokennkagaku: return "熊本保健科学大学"
        case .kurume: return "久留米大学"
        case .Kurumekougyou: return "久留米工業大学"
        case .saga: return "佐賀大学"
        case .Sangyouika: return "産業医科大学"
        case .Sigakukann: return "志學館大学"
        case .Junnsinngakuenn: return "純真学園大学"
        case .syokei: return "尚絅大学"
        case .seinangakuin: return "西南学院大学"
        case .seinaijyogakuin: return "西南女学院大学"
        case .Seimariagakuin: return "聖マリア学院大学"
        case .soujou: return "崇城大学"
        case .daiitikouka: return "第一工科大学"
        case .Daiitiyakka: return "第一薬科大学"
        case .tinnzeigakuin: return "鎮西学院大学"
        case .tukushijyogakuen: return "筑紫女学園大学"
        case .nagasaki: return "長崎大学"
        case .nagasakigaikokugo: return "長崎外国語大学"
        case .nagasakikenritu: return "長崎県立大学"
        case .nagasakikokusai: return "長崎国際大学"
        case .nagasakijunnsinn: return "長崎純心大学"
        case .nagaskaisougoukagaku: return "長崎総合科学大学"
        case .nakamuragakuen: return "中村学園大学"
        case .nishikyusyu: return "西九州大学"
        case .Nisinipponnkougyou: return "西日本工業大学"
        case .Nihonnkeizai: return "日本経済大学"
        case .Nihonnsekijuujisyakyuusyuukanngo: return "日本赤十字九州看護大学"
        case .nihonnbunnri: return "日本文理大学"
        case .hukuoka: return "福岡大学"
        case .Hukuokakanngo: return "福岡看護大学"
        case .hukuokakyoiku: return "福岡教育大学"
        case .hukuokakenritu: return "福岡県立大学"
        case .hukuokakogyo: return "福岡工業大学"
        case .Hukuokokusaiiryouhukusi: return "福岡国際医療福祉大学"
        case .hukuokasika: return "福岡歯科大学"
        case .hukuokajyogakuin: return "福岡女学院大学"
        case .hukuokajogakuinkanngo: return "福岡女学院看護大学"
        case .hukuokajyoshi: return "福岡女子大学"
        case .heiseionngaku: return "平成音楽大学"
        case .beppu: return "別府大学"
        case .minamikyuusyuu: return "南九州大学"
        case .miyazaki: return "宮崎大学"
        case .Miyazakikouritu: return "宮崎公立大学"
        case .miyazakikokusai: return "宮崎国際大学"
        case .miyazakisangyokeiei: return "宮崎産業経営大学"
        case .meio: return "名桜大学"
        case .ritumeikanajiataiheyo: return "立命館アジア太平洋大学"
        case .ryukyu: return "琉球大学"
        case .reiwakennkoukagaku: return "令和健康科学大学"
        case .Miyazakikennritukanngo: return "宮崎県立看護大学"
        }
    }
    
    var description: [String] {
        switch self {
        case .oita: return ["--","旦野原キャンパス","挟間キャンパス"]
        case .Ooitakanngokagaku: return ["--","本校"]
        case .okinawa: return ["--","未設定"]
        case .okinawakirisutokyougakuinn: return ["--","本校"]
        case .Okinawakennritukanngo: return ["--","本校"]
        case .okinawakenritugeijyutu: return ["--","首里崎山キャンパス","首里当蔵キャンパス"]
        case .okinawakokusai: return ["--","本校"]
        case .kassuijyoshi: return ["--","東山手キャンパス","大村キャンパス"]
        case .kagoshima: return ["--","下荒田キャンパス","郡元キャンパス","桜ヶ丘キャンパス"]
        case .kagosimakokusai: return ["--","本校"]
        case .kagosimajunnsinnnjosi: return ["--","本校"]
        case .kanoyataiku: return ["--","本校"]
        case .kitakyusyusiritu: return ["--","北片キャンパス","ひびきのキャンパス"]
        case .kyusyu: return ["--","病院キャンパス","大橋キャンパス","筑紫キャンパス","伊都キャンパス"]
        case .kyusyueiyohukushi: return ["--","小倉南区キャンパス","小倉北区キャンパス"]
        case .kyuusyuukanngohukusi: return ["--","本校"]
        case .kyusyukyouritu: return ["--","本校"]
        case .Kyuusyuukougyou: return ["--","戸畑キャンパス","飯塚キャンパス","若松キャンパス"]
        case .Kyuusyuukokusai: return ["--","本校"]
        case .kyusyusangyo: return ["--","本校"]
        case .Kyuusyuusika: return ["--","本校"]
        case .Kyuusyuujouhou: return ["--","大宰府キャンパス","博多駅前・博多駅東サテライトキャンパス"]
        case .kyusyujyoshi: return ["--","本校"]
        case .kyuusyuuhokennhukusi: return ["--","本校"]
        case .kyusyuruteru: return ["--","本校"]
        case .kumamoto: return ["--","黒髪地区","本荘地区","大江地区","本荘南地区"]
        case .kumamotogakuen: return ["--","本校"]
        case .kumamotokenritu: return ["--","本校"]
        case .kumamotohokennkagaku: return ["--","本校"]
        case .kurume: return ["--","旭町キャンパス","御井キャンパス"]
        case .Kurumekougyou: return ["--","中尾山キャンパス","向野キャンパス"]
        case .saga: return ["--","本庄キャンパス","鍋島キャンパス"]
        case .Sangyouika: return ["--","本校"]
        case .Sigakukann: return ["--","本校"]
        case .Junnsinngakuenn: return ["--","筑紫丘キャンパス","百道浜キャンパス"]
        case .syokei: return ["--","本校"]
        case .seinangakuin: return ["--","本校"]
        case .seinaijyogakuin: return ["--","本校"]
        case .Seimariagakuin: return ["--","本校"]
        case .soujou: return ["--","メインキャンパス","空港キャンパス"]
        case .daiitikouka: return ["--","東京上野キャンパス","鹿児島キャンパス"]
        case .Daiitiyakka: return ["--","本校"]
        case .tinnzeigakuin: return ["--","本校"]
        case .tukushijyogakuen: return ["--","本校"]
        case .nakamuragakuen: return ["--","本校"]
        case .nagasaki: return ["--","片渕地区キャンパス","坂本地区","キャンパス","文教地区キャンパス"]
        case .nagasakigaikokugo: return ["--","本校"]
        case .nagasakikenritu: return ["--","シーボルト校","佐世保"]
        case .nagasakikokusai: return ["--","本校"]
        case .nagasakijunnsinn: return ["--","本校"]
        case .nagaskaisougoukagaku: return ["--","本校"]
        case .nishikyusyu: return ["--","佐賀キャンパス","神崎キャンパス","小城キャンパス"]
        case .Nisinipponnkougyou: return ["--","おばせキャンパス","小倉キャンパス"]
        case .Nihonnsekijuujisyakyuusyuukanngo: return ["--","本校"]
        case .Nihonnkeizai: return ["--","福岡キャンパス","神戸三宮キャンパス","東京渋谷キャンパス"]
        case .nihonnbunnri: return ["--","本校"]
        case .hukuoka: return ["--","本校"]
        case .Hukuokakanngo: return ["--","本校"]
        case .hukuokakyoiku: return ["--","本校"]
        case .hukuokakenritu: return ["--","本校"]
        case .hukuokakogyo: return ["--","本校"]
        case .Hukuokokusaiiryouhukusi: return ["--","大田原キャンパス","小田原キャンパス","成田キャンパス","東京赤坂キャンパス","大川キャンパス"]
        case .hukuokasika: return ["--","本校"]
        case .hukuokajyogakuin: return ["--","本校"]
        case .hukuokajogakuinkanngo: return ["--","本校"]
        case .hukuokajyoshi: return ["--","本校"]
        case .heiseionngaku: return ["--","本校"]
        case .beppu: return ["--","本校"]
        case .minamikyuusyuu: return ["--","宮崎キャンパス","都城キャンパス"]
        case .miyazaki: return ["--","清武キャンパス","木花キャンパス","本校"]
        case .Miyazakikouritu: return ["--","本校"]
        case .miyazakikokusai: return ["--","本校"]
        case .miyazakisangyokeiei: return ["--","本校"]
        case .meio: return ["--","本校"]
        case .ritumeikanajiataiheyo: return ["--","本校"]
        case .ryukyu: return ["--","千原キャンパス","上原キャンパス"]
        case .reiwakennkoukagaku: return ["--","本校"]
        case .Miyazakikennritukanngo: return ["--","本校"]
        }
    }
}
