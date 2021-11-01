//
//  TyubuUniversity.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/17.
//

import SwiftUI

enum TyubuUniversity: String, CaseIterable {
    case Aichi // 愛知大学
    case Aichiika // 愛知医科大学
    case Aichigakusen // 愛知学泉大学
    case Aichigakuin // 愛知学院大学
    case Aichikyouiku // 愛知教育大学
    case Aichikenritsu // 愛知県立大学
    case Aichikenritugeijutsu // 愛知県立芸術大学
    case Aichikouka // 愛知工科大学
    case Aichikougyou // 愛知工業大学
    case Aichisangyou // 愛知産業大学
    case Aichisyukutoku // 愛知淑徳大学
    case Aichitouhou // 愛知東邦大学
    case Aichibunkyo // 愛知文教大学
    case Aichimizuho // 愛知みずほ大学
    case Asahi // 朝日大学
    case Isikawakennritu // 石川県立大学
    case isikawakennritukanngo // 石川県立看護大学
    case Itinomiyakennsinn // 一宮研伸大学
    case Oukagakuen // 桜花学園大学
    case Okazakijoshi // 岡崎女子大学
    case Kaisisennmonnsyoku // 開志専門職大学
    case Kanazawa // 金沢大学
    case Kanazawaika // 金沢医科大学
    case Kanazawagakuin // 金沢学院大学
    case Kanazawakougyou // 金沢工業大学
    case Kanazawasyokumanejimenntosennmonnsyoku // かなざわ食マネジメント専門職大学
    case Kanazawaseiryou // 金沢星稜大学
    case Kanazawabijutukougei // 金沢美術工芸大学
    case Gifu // 岐阜大学
    case Gifuiryokagaku // 岐阜医療科学大学
    case Gifukyouritsu // 岐阜協立大学
    case Gifukenritsukango // 岐阜県立看護大学
    case Gifujoshi // 岐阜女子大学
    case Gifuseitokugakuen // 岐阜聖徳学園大学
    case Gifuhokenn // 岐阜保健大学
    case Gihuyakka // 岐阜薬科大学
    case Kinjo // 金城大学
    case Kinjogakuin // 金城学院大学
    case Keiwagakuenn // 敬和学園大学
    case Kenkoukagaku // 健康科学大学
    case Kougakkan // 皇學館大学
    case Kouritukomatu // 公立小松大学
    case Saku // 佐久大学
    case Sanjouitiritu // 三条市立大学
    case Shigakukan // 至学館大学
    case Sizuoka // 静岡大学
    case Shizuokaeiwagakuin // 静岡英和学院大学
    case Shizuokakenritsu // 静岡県立大学
    case Sizuokakennritunourinnkannkyousennmonnsyoku // 静岡県立農林環境専門職大学
    case Shizuokasangyo // 静岡産業大学
    case Shizuokahukushi // 静岡福祉大学
    case Shizuokabunkageijutu // 静岡文化芸術大学
    case Shizuokarikouka // 静岡理工科大学
    case Syubun // 修文大学
    case Joetukyouiku // 上越教育大学
    case Sinnsyuu // 信州大学
    case Jinnai // 仁愛大学
    case Sugiyamajogakuen // 椙山女学園大学
    case Suwatoutoukyourika // 諏訪東京理科大学
    case Seijo // 星城大学
    case Seisennjogakuinn // 清泉女学院大学
    case Seireikurisutofa // 聖隷クリストファー大学
    case Daido // 大同大学
    case Takaokahouka // 高岡法科大学
    case Tyukyou // 中京大学
    case Tyukyogakuin // 中京学院大学
    case Tyubu // 中部大学
    case Tyubugakuin // 中部学院大学
    case Turugaitiritukanngo // 敦賀市立看護大学
    case Turubunnka // 都留文科大学
    case Doumei // 同盟大学
    case Tokaigakuin // 東海学院大学
    case Tokaigakuen // 東海学園大学
    case Tokoha // 常葉大学
    case Toyama // 富山大学
    case Toyamakennritu // 富山県立大学
    case Toyamakokusai // 富山国際大学
    case Toyotakougyou // 豊田工業大学
    case Toyohashigijutukagaku // 豊橋技術科学大学
    case Toyohashisouzou // 豊橋創造大学
    case Nagaoka // 長岡大学
    case Nagaokagijutukagaku // 長岡技術科学大学
    case Nagaokasutoku // 長岡崇徳大学
    case Nagaokazoukei // 長岡造形大学
    case Nagano // 長野大学
    case Naganokanngo // 長野看護大学
    case Naganokennritu // 長野県立大学
    case Naganohokenniryou // 長野保健医療大学
    case Nagoya // 名古屋大学
    case Nagoyaongaku // 名古屋音楽大学
    case Nagoyaichiritsu // 名古屋市立大学
    case Nagoyagaikokugo // 名古屋外国語大学
    case Nagoyagakuin // 名古屋学院大学
    case Nagoyagakugei // 名古屋学芸大学
    case Nagoyakeizai // 名古屋経済大学
    case Nagoyageijutsu // 名古屋芸術大学
    case Nagoyakougyou // 名古屋工業大学
    case Nagoyasangyo // 名古屋産業大学
    case Nagoyasyoka // 名古屋商科大学
    case Nagoyajoshi // 名古屋女子大学
    case Nagoyazoukei // 名古屋造形大学
    case Nagoyabunri // 名古屋文理大学
    case Nagoyaryuujoujosi // 名古屋柳城女子大学
    case Nanzan //南山大学
    case Niigata // 新潟大学
    case Niigatairyouhukusi // 新潟医療福祉大学
    case Niigatakeiei // 新潟経営大学
    case Niigatakennritu // 新潟県立大学
    case Niigatakennritukanngo // 新潟県立看護大学
    case Niigatakouka // 新潟工科大学
    case Niigatakokusaijouhou // 新潟国際情報大学
    case Niigatasanngyou // 新潟産業大学
    case Niigatasyokuryounougyou // 新潟食料農業大学
    case Niigataseiryou // 新潟青陵大学
    case Niigatayakka // 新潟薬科大学
    case Niigatarihabiritesyonn // 新潟リハビリテーション大学
    case Nihonsekijuujitoyotakango // 日本赤十字豊田看護大学
    case Nihonfukusi // 日本福祉大学
    case Ningenkankyo // 人間環境大学
    case Hamamatsuika // 浜松医科大学
    case Hamamatsugakuin // 浜松学院大学
    case Hukui // 福井大学
    case Hukuiiryou // 福井医療大学
    case Hukuikenritu // 福井県立大学
    case Hukuikougyou // 福井工業大学
    case Hujitaika // 藤田医科大学
    case Fujitahokeneisei // 藤田保健衛生大学
    case Hokuriku // 北陸大学
    case Hokurikugakuinn // 北陸学院大学
    case Matumoto // 松本大学
    case Matumotokanngo // 松本看護大学
    case Matumotosika // 松本歯科大学
    case Minobusann // 身延山大学
    case Meijo // 名城大学
    case Yamanasi // 山梨大学
    case Yamanasieiwa // 山梨英和大学
    case Yamanasigakuin // 山梨学院大学
    case Yamanasikennritu // 山梨県立大学
    case Yokkaichi // 四日市大学
    case Yokkaichikangoiryou // 四日市看護医療大学
    
    var name: String {
        switch self {
        case .Aichi: return "愛知大学"
        case .Aichigakuin: return "愛知学院大学"
        case .Aichigakusen: return "愛知学泉大学"
        case .Aichikenritsu: return "愛知県立大学"
        case .Aichikenritugeijutsu: return "愛知県立芸術大学"
        case .Aichikougyou: return "愛知工業大学"
        case .Aichisangyou: return "愛知産業大学"
        case .Tyukyou: return "中京大学"
        case .Nanzan: return "南山大学"
        case .Meijo: return "名城大学"
        case .Nagoya: return "名古屋大学"
        case .Sizuoka: return "静岡大学"
        case .Tyubu: return "中部大学"
//        case .Mie: return "三重大学"
        case .Gifu: return "岐阜大学"
        case .Aichisyukutoku: return "愛知淑徳大学"
        case .Nagoyakougyou: return "名古屋工業大学"
        case .Nagoyagakuin: return "名古屋学院大学"
        case .Kinjo: return "金城大学"
        case .Nihonfukusi: return "日本福祉大学"
        case .Nagoyagaikokugo: return "名古屋外国語大学"
        case .Sugiyamajogakuen: return "椙山女学園大学"
        case .Fujitahokeneisei: return "藤田保健衛生大学"
        case .Aichikyouiku: return "愛知教育大学"
        case .Nagoyaichiritsu: return "名古屋市立大学"
        case .Daido: return "大同大学"
        case .Shizuokakenritsu: return "静岡県立大学"
        case .Tokoha: return "常葉大学"
        case .Tokaigakuen: return "東海学園大学"
        case .Nagoyajoshi: return "名古屋女子大学"
        case .Nagoyasyoka: return "名古屋商科大学"
//        case .Suzukairyoukagaku: return "鈴鹿医療科学大学"
        case .Gifuseitokugakuen: return "岐阜聖徳学園大学"
        case .Kougakkan: return "皇學館大学"
        case .Asahi: return "朝日大学"
        case .Nagoyagakugei: return "名古屋学芸大学"
        case .Gifuiryokagaku: return "岐阜医療科学大学"
        case .Toyohashigijutukagaku: return "豊橋技術科学大学"
        case .Aichiika: return "愛知医科大学"
        case .Shizuokabunkageijutu: return "静岡文化芸術大学"
        case .Seireikurisutofa: return "聖隷クリストファー大学"
        case .Hamamatsuika: return "浜松医科大学"
        case .Nagoyakeizai: return "名古屋経済大学"
        case .Shizuokarikouka: return "静岡理工科大学"
        case .Nagoyageijutsu: return "名古屋芸術大学"
        case .Gifukyouritsu: return "岐阜協立大学"
        case .Gifujoshi: return "岐阜女子大学"
        case .Tyubugakuin: return "中部学院大学"
        case .Tokaigakuin: return "東海学院大学"
        case .Shizuokasangyo: return "静岡産業大学"
        case .Seijo: return "星城大学"
        case .Doumei: return "同盟大学"
        case .Nagoyabunri: return "名古屋文理大学"
        case .Yokkaichi: return "四日市大学"
        case .Aichikouka: return "愛知工科大学"
        case .Aichitouhou: return "愛知東邦大学"
        case .Shigakukan: return "至学館大学"
        case .Toyohashisouzou: return "豊橋創造大学"
        case .Nagoyaongaku: return "名古屋音楽大学"
        case .Ningenkankyo: return "人間環境大学"
        case .Gifukenritsukango: return "岐阜県立看護大学"
        case .Tyukyogakuin: return "中京学院大学"
        case .Shizuokahukushi: return "静岡福祉大学"
        case .Hamamatsugakuin: return "浜松学院大学"
        case .Aichibunkyo: return "愛知文教大学"
        case .Aichimizuho: return "愛知みずほ大学"
        case .Oukagakuen: return "桜花学園大学"
        case .Syubun: return "修文大学"
        case .Nagoyasangyo: return "名古屋産業大学"
        case .Nagoyazoukei: return "名古屋造形大学"
        case .Nihonsekijuujitoyotakango: return "日本赤十字豊田看護大学"
//        case .Miekenritsukango: return "三重県立看護大学"
//        case .Suzuka: return "鈴鹿大学"
        case .Yokkaichikangoiryou: return "四日市看護医療大学"
        case .Shizuokaeiwagakuin: return "静岡英和学院大学"
        case .Okazakijoshi: return "岡崎女子大学"
        case .Joetukyouiku: return "上越教育大学"
        case .Nagaokagijutukagaku: return "長岡技術科学大学"
        case .Niigata: return "新潟大学"
        case .Toyama: return "富山大学"
        case .Kanazawa: return "金沢大学"
        case .Hukui: return "福井大学"
        case .Yamanasi: return "山梨大学"
        case .Sinnsyuu: return "信州大学"
        case .Turubunnka: return "都留文科大学"
        case .Yamanasikennritu: return "山梨県立大学"
        case .Suwatoutoukyourika: return "諏訪東京理科大学"
        case .Nagano: return "長野大学"
        case .Naganokanngo: return "長野看護大学"
        case .Naganokennritu: return "長野県立大学"
        case .Gihuyakka: return "岐阜薬科大学"
        case .Sizuokakennritunourinnkannkyousennmonnsyoku: return "静岡県立農林環境専門職大学"
        case .Kaisisennmonnsyoku: return "開志専門職大学"
        case .Keiwagakuenn: return "敬和学園大学"
        case .Nagaoka: return "長岡大学"
        case .Nagaokasutoku: return "長岡崇徳大学"
        case .Niigatairyouhukusi: return "新潟医療福祉大学"
        case .Niigatakeiei: return "新潟経営大学"
        case .Niigatakouka: return "新潟工科大学"
        case .Niigatakokusaijouhou: return "新潟国際情報大学"
        case .Niigatasanngyou: return "新潟産業大学"
        case .Niigatasyokuryounougyou: return "新潟食料農業大学"
        case .Niigataseiryou: return "新潟青陵大学"
        case .Niigatayakka: return "新潟薬科大学"
        case .Niigatarihabiritesyonn: return "新潟リハビリテーション大学"
        case .Takaokahouka: return "高岡法科大学"
        case .Toyamakokusai: return "富山国際大学"
        case .Kanazawaika: return "金沢医科大学"
        case .Kanazawagakuin: return "金沢学院大学"
        case .Kanazawakougyou: return "金沢工業大学"
        case .Kanazawasyokumanejimenntosennmonnsyoku: return "かなざわ食マネジメント専門職大学"
        case .Kanazawaseiryou: return "金沢星稜大学"
        case .Hokuriku: return "北陸大学"
        case .Hokurikugakuinn: return "北陸学院大学"
        case .Jinnai: return "仁愛大学"
        case .Hukuiiryou: return "福井医療大学"
        case .Hukuikougyou: return "福井工業大学"
        case .Kenkoukagaku: return "健康科学大学"
        case .Minobusann: return "身延山大学"
        case .Yamanasieiwa: return "山梨英和大学"
        case .Yamanasigakuin: return "山梨学院大学"
        case .Saku: return "佐久大学"
        case .Seisennjogakuinn: return "清泉女学院大学"
        case .Naganohokenniryou: return "長野保健医療大学"
        case .Matumoto: return "松本大学"
        case .Matumotokanngo: return "松本看護大学"
        case .Matumotosika: return "松本歯科大学"
        case .Gifuhokenn: return "岐阜保健大学"
        case .Itinomiyakennsinn: return "一宮研伸大学"
        case .Kinjogakuin: return "金城学院大学"
        case .Toyotakougyou: return "豊田工業大学"
        case .Nagoyaryuujoujosi: return "名古屋柳城女子大学"
        case .Hujitaika: return "藤田医科大学"
        case .Sanjouitiritu: return "三条市立大学"
        case .Nagaokazoukei: return "長岡造形大学"
        case .Niigatakennritu: return "新潟県立大学"
        case .Niigatakennritukanngo: return "新潟県立看護大学"
        case .Toyamakennritu: return "富山県立看護大学"
        case .Isikawakennritu: return "石川県立大学"
        case .isikawakennritukanngo: return "石川県立看護大学"
        case .Kanazawabijutukougei: return "金沢美術工芸大学"
        case .Kouritukomatu: return "公立小松大学"
        case .Turugaitiritukanngo: return "敦賀市立看護大学"
        case .Hukuikenritu: return "福井県立大学"

        }
    }
    var description: [String] {
        switch self {
        case .Aichi: return ["--","名古屋校舎","豊橋校舎","車道校舎"]
        case .Aichigakuin: return ["--","日進キャンパス","名城公園キャンパス","楠元キャンパス","末盛キャンパス"]
        case .Aichigakusen: return ["--","岡崎キャンパス"]
        case .Aichikenritsu: return ["--","長久手キャンパス","守山キャンパス"]
        case .Aichikenritugeijutsu: return ["--","本校"]
        case .Aichikougyou: return ["--","八草キャンパス","自由ヶ丘キャンパス","本山キャンパス"]
        case .Aichisangyou: return ["--","本校"]
        case .Tyukyou: return ["--","名古屋キャンパス","豊田キャンパス"]
        case .Nanzan: return ["--","本校"]
        case .Meijo: return ["--","天白キャンパス","八事キャンパス","ナゴヤドーム前キャンパス","春日井(鷹来)キャンパス附属農場","日進キャンパス(総合グラウンド)"]
        case .Nagoya: return ["--","東山キャンパス","鶴舞キャンパス","大幸キャンパス"]
        case .Sizuoka: return ["--","本校"]
        case .Tyubu: return ["--","春日井キャンパス","恵那キャンパス"]
//        case .Mie: return ["--","上浜キャンパス"]
        case .Gifu: return ["--","柳戸キャンパス","サテライトキャンパス"]
        case .Aichisyukutoku: return ["--","長手久キャンパス","星が丘キャンパス"]
        case .Nagoyakougyou: return ["--","御器所キャンパス","多治見キャンパス"]
        case .Nagoyagakuin: return ["--","名古屋キャンパス","瀬戸キャンパス","丸の内サテライト"]
        case .Kinjo: return ["--","笠間キャンパス","松任キャンパス"]
        case .Nihonfukusi: return ["--","美浜キャンパス","半田キャンパス","東海キャンパス","名古屋キャンパス"]
        case .Nagoyagaikokugo: return ["--","本校"]
        case .Sugiyamajogakuen: return ["--","星が丘キャンパス","日進キャンパス"]
        case .Fujitahokeneisei: return ["--","本校"]
        case .Aichikyouiku: return ["--","本校"]
        case .Nagoyaichiritsu: return ["--","北千種キャンパス","桜山(川澄)キャンパス","滝子(山の畑)キャンパス","田辺通キャンパス"]
        case .Daido: return ["--","滝春キャンパス"]
        case .Shizuokakenritsu: return ["--","草薙キャンパス","小鹿キャンパス"]
        case .Tokoha: return ["--","静岡草薙キャンパス","静岡瀬名キャンパス","静岡水落キャンパス","浜松キャンパス"]
        case .Tokaigakuen: return ["--","三好キャンパス","名古屋キャンパス"]
        case .Nagoyajoshi: return ["--","汐路学舎","天白学舎"]
        case .Nagoyasyoka: return ["--","日進/長久手キャンパス","名古屋キャンパス"]
//        case .Suzukairyoukagaku: return ["--","千代崎キャンパス","白子キャンパス"]
        case .Gifuseitokugakuen: return ["--","羽鳥キャンパス","岐阜キャンパス"]
        case .Kougakkan: return ["--","本学キャンパス"]
        case .Asahi: return ["--","穂積キャンパス","名古屋キャンパス"]
        case .Nagoyagakugei: return ["--","日進キャンパス","名城前医療キャンパス"]
        case .Gifuiryokagaku: return ["--","可児キャンパス","関キャンパス"]
        case .Toyohashigijutukagaku: return ["--","本校"]
        case .Aichiika: return ["--","本校"]
        case .Shizuokabunkageijutu: return ["--","本校"]
        case .Seireikurisutofa: return ["--","本校"]
        case .Hamamatsuika: return ["--","本校"]
        case .Nagoyakeizai: return ["--","犬山キャンパス","名駅サテライトキャンパス"]
        case .Shizuokarikouka: return ["--","本校"]
        case .Nagoyageijutsu: return ["--","東キャンパス","西キャンパス"]
        case .Gifukyouritsu: return ["--","北方キャンパス","西之川キャンパス"]
        case .Gifujoshi: return ["--","本校"]
        case .Tyubugakuin: return ["--","関キャンパス","各務原キャンパス"]
        case .Tokaigakuin: return ["--","本校"]
        case .Shizuokasangyo: return ["--","磐田キャンパス","藤枝キャンパス","藤枝駅前サテライトキャンパス"]
        case .Seijo: return ["--","名古屋丸の内キャンパス","大学院・名古屋丸の内サテライトキャンパス"]
        case .Doumei: return ["--","本校"]
        case .Nagoyabunri: return ["--","稲沢キャンパス","名古屋キャンパス"]
        case .Yokkaichi: return ["--","本校"]
        case .Aichitouhou: return ["--","本校"]
        case .Shigakukan: return ["--","本校"]
        case .Toyohashisouzou: return ["--","本校"]
        case .Nagoyaongaku: return ["--","本校"]
        case .Ningenkankyo: return ["--","岡崎キャンパス","大府キャンパス","松山キャンパス"]
        case .Gifukenritsukango: return ["--","本校"]
        case .Tyukyogakuin: return ["--","中津川キャンパス","端浪キャンパス"]
        case .Shizuokahukushi: return ["--","本校"]
        case .Hamamatsugakuin: return ["--","布橋キャンパス","住吉キャンパス"]
        case .Aichibunkyo: return ["--","本校"]
        case .Aichimizuho: return ["--","名古屋キャンパス","豊田キャンパス"]
        case .Oukagakuen: return ["--","本校"]
        case .Syubun: return ["--","本校"]
        case .Nagoyasangyo: return ["--","本校","サテライトキャンパス"]
        case .Nagoyazoukei: return ["--","本校"]
        case .Nihonsekijuujitoyotakango: return ["--","大宮キャンパス","広尾キャンパス","武蔵野キャンパス"]
//        case .Miekenritsukango: return ["--","本校"]
//        case .Suzuka: return ["--","本校"]
        case .Yokkaichikangoiryou: return ["--","本校"]
        case .Shizuokaeiwagakuin: return ["--","本校"]
        case .Okazakijoshi: return ["--","本校"]
        case .Joetukyouiku: return ["--","本校"]
        case .Nagaokagijutukagaku: return ["--","本校"]
        case .Niigata: return ["--","五十嵐キャンパス","旭町・西大畑キャンパス"]
        case .Toyama: return ["--","五福キャンパス","杉谷キャンパス","高岡キャパス"]
        case .Kanazawa: return ["--","角間キャンパス","宝町・鶴間キャンパス"]
        case .Hukui: return ["--","文教キャンパス","松岡キャンパス","敦賀キャンパス"]
        case .Yamanasi: return ["--","甲府キャンパス","医学部キャンパス"]
        case .Sinnsyuu: return ["--","松本キャンパス","長野(教育)キャンパス","長野(工学)キャンパス","伊那キャンパス","上田キャンパス"]
        case .Turubunnka: return ["--","本校"]
        case .Yamanasikennritu: return ["--","飯田キャンパス","池田キャンパス"]
        case .Suwatoutoukyourika: return ["--","本校"]
        case .Nagano: return ["--","本校"]
        case .Naganokanngo: return ["--","本校"]
        case .Naganokennritu: return ["--","三輪キャンパス","後町キャンパス"]
//        case .Gifukenritsukango: return ["--","本校"]
        case .Gihuyakka: return ["--","本校","三田洞キャンパス"]
        case .Sizuokakennritunourinnkannkyousennmonnsyoku: return ["--","本校"]
        case .Kaisisennmonnsyoku: return ["--","紫竹山キャンパス","米山キャンパス","古町ルフルキャンパス"]
        case .Keiwagakuenn: return ["--","本校"]
        case .Nagaoka: return ["--","本校"]
        case .Nagaokasutoku: return ["--","本校"]
        case .Niigatairyouhukusi: return ["--","本校"]
        case .Niigatakeiei: return ["--","本校"]
        case .Niigatakouka: return ["--","本校"]
        case .Niigatakokusaijouhou: return ["--","みずき野キャンパス","新潟中央キャンパス"]
        case .Niigatasanngyou: return ["--","本校"]
        case .Niigatasyokuryounougyou: return ["--","胎内キャンパス","新潟キャンパス"]
        case .Niigataseiryou: return ["--","本校"]
        case .Niigatayakka: return ["--","新津キャンパス","新津駅東キャンパス"]
        case .Niigatarihabiritesyonn: return ["--","本校"]
        case .Takaokahouka: return ["--","本校"]
        case .Toyamakokusai: return ["--","東黒牧キャンパス","呉羽キャンパス"]
        case .Kanazawaika: return ["--","本校"]
        case .Kanazawagakuin: return ["--","本校"]
        case .Kanazawakougyou: return ["--","扇が丘キャンパス","奴菓舗リサーチキャンパス","白山麓キャンパス","虎ノ門キャンパス"]
        case .Kanazawasyokumanejimenntosennmonnsyoku: return ["--","白山キャンパス","金沢マチナカキャンパス","福井キャンパス"]
        case .Kanazawaseiryou: return ["--","本校"]
        case .Hokuriku: return ["--","太陽が丘キャンパス","薬学キャンパス"]
        case .Hokurikugakuinn: return ["--","本校"]
        case .Jinnai: return ["--","本校"]
        case .Hukuiiryou: return ["--","本校"]
        case .Hukuikougyou: return ["--","福井キャンパス","あわらキャンパス"]
        case .Kenkoukagaku: return ["--","富士山キャンパス","桂川キャンパス"]
        case .Minobusann: return ["--","本校"]
        case .Yamanasieiwa: return ["--","本校"]
        case .Yamanasigakuin: return ["--","本校"]
        case .Saku: return ["--","本校"]
        case .Seisennjogakuinn: return ["--","上野キャンパス","長野駅東口キャンパス"]
        case .Naganohokenniryou: return ["--","本校"]
        case .Matumoto: return ["--","本校"]
        case .Matumotokanngo: return ["--","本校"]
        case .Matumotosika: return ["--","本校"]
        case .Gifuhokenn: return ["--","本校"]
        case .Itinomiyakennsinn: return ["--","本校"]
        case .Kinjogakuin: return ["--","本校"]
        case .Toyotakougyou: return ["--","本校"]
        case .Nagoyaryuujoujosi: return ["--","本校"]
        case .Hujitaika: return ["--","本校"]
        case .Sanjouitiritu: return ["--","本校"]
        case .Nagaokazoukei: return ["--","本校"]
        case .Niigatakennritu: return ["--","本校"]
        case .Niigatakennritukanngo: return ["--","本校"]
        case .Toyamakennritu: return ["--","射水キャンパス","富山キャンパス"]
        case .Isikawakennritu: return ["--","本校"]
        case .isikawakennritukanngo: return ["--","本校"]
        case .Kanazawabijutukougei: return ["--","本校"]
        case .Kouritukomatu: return ["--","粟津キャンパス","末広キャンパス","中央キャンパス"]
        case .Turugaitiritukanngo: return ["--","本校"]
        case .Hukuikenritu: return ["--","永平寺キャンパス","小浜キャンパス","あわらキャンパス"]
        case .Aichikouka: return ["--","本校"]
        }
    }
}
