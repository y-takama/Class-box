//
//  StudentSecondRegistrationView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/07.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct StudentSecondRegistrationView: View {
    @State private var selectionValue = KansaiUniversity.Ritumeikan
    @State private var selectionUniversityValue = "--"
    @State private var selectionCampusValue = "--"
    @State private var Universityname = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var isShowAlert = false
    @State private var isError = false
    @State private var errorMessage = ""
    @State private var campusname = ""
    @State private var inputText = ""
    @State private var searchUniversity: [String] = [""]
    @Binding var location: String
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 5) {
//                Spacer()
                HStack{
                    Text("大学名")
                    Text("必須")
                        .font(.system(size: 10, weight: .semibold))
                        .frame(width: 30, height: 14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 0.5)
                        )
                    Spacer()
                }.padding(.top, 60)
                
                if location == "japan_kansai" {
                    HStack {
                        SearchUniversityBar(text: $inputText)
                        Button(action: {
                            let index = self.find(value: self.inputText, in: self.kinkiuniversityname)!
                            var searchUniversity: [String]
                            searchUniversity = ["--"]
                            for val in index {
                                searchUniversity += ["\(self.kinkiuniversityname[val])"]
                            }
                            self.searchUniversity = searchUniversity
                            UIApplication.shared.closeKeyboard()
                        }) {
                            Text("検索")
                                .padding(.vertical, 7)
                                .padding(.horizontal, 8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 0.5)
                                )
                        }
                    }
                    Picker(selection: $selectionUniversityValue, label: Text("大学名")) {
                        if searchUniversity == [""] {
                            ForEach(kinkiuniversityname, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        } else {
                            ForEach(searchUniversity, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                else if location == "japan_hokkaido" {
                    HStack {
                        SearchUniversityBar(text: $inputText)
                        Button(action: {
                            let index = self.find(value: self.inputText, in: self.hokkaidouniversityname)!
                            var searchUniversity: [String]
                            searchUniversity = ["--"]
                            for val in index {
                                searchUniversity += ["\(self.hokkaidouniversityname[val])"]
                            }
                            self.searchUniversity = searchUniversity
                            UIApplication.shared.closeKeyboard()
                        }) {
                            Text("検索")
                                .padding(.vertical, 7)
                                .padding(.horizontal, 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 0.5)
                                )
                        }
                    }
                    Picker(selection: $selectionUniversityValue, label: Text("大学名")) {
                        if searchUniversity == [""] {
                            ForEach(hokkaidouniversityname, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        } else {
                            ForEach(searchUniversity, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                else if location == "japan_tohoku" {
                    HStack {
                        SearchUniversityBar(text: $inputText)
                        Button(action: {
                            let index = self.find(value: self.inputText, in: self.tohokuuniversityname)!
                            var searchUniversity: [String]
                            searchUniversity = ["--"]
                            for val in index {
                                searchUniversity += ["\(self.tohokuuniversityname[val])"]
                            }
                            self.searchUniversity = searchUniversity
                            UIApplication.shared.closeKeyboard()
                        }) {
                            Text("検索")
                                .padding(.vertical, 7)
                                .padding(.horizontal, 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 0.5)
                                )
                        }
                    }
                    Picker(selection: $selectionUniversityValue, label: Text("大学名")) {
                        if searchUniversity == [""] {
                            ForEach(tohokuuniversityname, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        } else {
                            ForEach(searchUniversity, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                else if location == "japan_kanto" {
                    HStack {
                        SearchUniversityBar(text: $inputText)
                        Button(action: {
                            let index = self.find(value: self.inputText, in: self.kantouniversityname)!
                            var searchUniversity: [String]
                            searchUniversity = ["--"]
                            for val in index {
                                searchUniversity += ["\(self.kantouniversityname[val])"]
                            }
                            self.searchUniversity = searchUniversity
                            UIApplication.shared.closeKeyboard()
                        }) {
                            Text("検索")
                                .padding(.vertical, 7)
                                .padding(.horizontal, 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 0.5)
                                )
                        }
                    }
                    Picker(selection: $selectionUniversityValue, label: Text("大学名")) {
                        if searchUniversity == [""] {
                            ForEach(kantouniversityname, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        } else {
                            ForEach(searchUniversity, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                else if location == "japan_tyubu" {
                    HStack {
                        SearchUniversityBar(text: $inputText)
                        Button(action: {
                            let index = self.find(value: self.inputText, in: self.tyubuuniversityname)!
                            var searchUniversity: [String]
                            searchUniversity = ["--"]
                            for val in index {
                                searchUniversity += ["\(self.tyubuuniversityname[val])"]
                            }
                            self.searchUniversity = searchUniversity
                            UIApplication.shared.closeKeyboard()
                        }) {
                            Text("検索")
                                .padding(.vertical, 7)
                                .padding(.horizontal, 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 0.5)
                                )
                        }
                    }
                    Picker(selection: $selectionUniversityValue, label: Text("大学名")) {
                        if searchUniversity == [""] {
                            ForEach(tyubuuniversityname, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        } else {
                            ForEach(searchUniversity, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                else if location == "japan_tyugoku" {
                    HStack {
                        SearchUniversityBar(text: $inputText)
                        Button(action: {
                            let index = self.find(value: self.inputText, in: self.tyugokuuniversityname)!
                            var searchUniversity: [String]
                            searchUniversity = ["--"]
                            for val in index {
                                searchUniversity += ["\(self.tyugokuuniversityname[val])"]
                            }
                            self.searchUniversity = searchUniversity
                            UIApplication.shared.closeKeyboard()
                        }) {
                            Text("検索")
                                .padding(.vertical, 7)
                                .padding(.horizontal, 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 0.5)
                                )
                        }
                    }
                    Picker(selection: $selectionUniversityValue, label: Text("大学名")) {
                        if searchUniversity == [""] {
                            ForEach(tyugokuuniversityname, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        } else {
                            ForEach(searchUniversity, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                else if location == "japan_sikoku" {
                    HStack {
                        SearchUniversityBar(text: $inputText)
                        Button(action: {
                            let index = self.find(value: self.inputText, in: self.sikokuuniversityname)!
                            var searchUniversity: [String]
                            searchUniversity = ["--"]
                            for val in index {
                                searchUniversity += ["\(self.sikokuuniversityname[val])"]
                            }
                            self.searchUniversity = searchUniversity
                            UIApplication.shared.closeKeyboard()
                        }) {
                            Text("検索")
                                .padding(.vertical, 7)
                                .padding(.horizontal, 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 0.5)
                                )
                        }
                    }
                    Picker(selection: $selectionUniversityValue, label: Text("大学名")) {
                        if searchUniversity == [""] {
                            ForEach(sikokuuniversityname, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        } else {
                            ForEach(searchUniversity, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                else if location == "japan_kyusyu" {
                    HStack {
                        SearchUniversityBar(text: $inputText)
                        Button(action: {
                            let index = self.find(value: self.inputText, in: self.kyusyuuniversityname)!
                            var searchUniversity: [String]
                            searchUniversity = ["--"]
                            for val in index {
                                searchUniversity += ["\(self.kyusyuuniversityname[val])"]
                            }
                            self.searchUniversity = searchUniversity
                            UIApplication.shared.closeKeyboard()
                        }) {
                            Text("検索")
                                .padding(.vertical, 7)
                                .padding(.horizontal, 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 0.5)
                                )
                        }
                    }
                    Picker(selection: $selectionUniversityValue, label: Text("大学名")) {
                        if searchUniversity == [""] {
                            ForEach(kyusyuuniversityname, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        } else {
                            ForEach(searchUniversity, id: \.self) { option in
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                
                if selectionUniversityValue != "--" {
                    HStack{
                        Text("キャンパス")
                        Text("必須")
                            .font(.system(size: 10, weight: .semibold))
                            .frame(width: 30, height: 14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                        Spacer()
                    }.foregroundColor(.black)
                    Picker("",selection: $selectionCampusValue) {
                        if location == "japan_kansai" {
                            ForEach(KansaiUniversity.allCases, id: \.self) { option in
                                if option.name == selectionUniversityValue {
                                    let campus = option.description
                                    ForEach(campus , id: \.self) { i in
                                        Text(i).foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        else if location == "japan_hokkaido" {
                            ForEach(HokkaidoUniversity.allCases, id: \.self) { option in
                                if option.name == selectionUniversityValue {
                                    let campus = option.description
                                    ForEach(campus , id: \.self) { i in
                                        Text(i).foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        else if location == "japan_tohoku" {
                            ForEach(TohokuUniversity.allCases, id: \.self) { option in
                                if option.name == selectionUniversityValue {
                                    let campus = option.description
                                    ForEach(campus , id: \.self) { i in
                                        Text(i).foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        else if location == "japan_kanto" {
                            ForEach(KantoUniversity.allCases, id: \.self) { option in
                                if option.name == selectionUniversityValue {
                                    let campus = option.description
                                    ForEach(campus , id: \.self) { i in
                                        Text(i).foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        else if location == "japan_tyubu" {
                            ForEach(TyubuUniversity.allCases, id: \.self) { option in
                                if option.name == selectionUniversityValue {
                                    let campus = option.description
                                    ForEach(campus , id: \.self) { i in
                                        Text(i).foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        else if location == "japan_tyugoku" {
                            ForEach(TyugokuUniversity.allCases, id: \.self) { option in
                                if option.name == selectionUniversityValue {
                                    let campus = option.description
                                    ForEach(campus , id: \.self) { i in
                                        Text(i).foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        else if location == "japan_sikoku" {
                            ForEach(SikokuUniversity.allCases, id: \.self) { option in
                                if option.name == selectionUniversityValue {
                                    let campus = option.description
                                    ForEach(campus , id: \.self) { i in
                                        Text(i).foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        else if location == "japan_kyusyu" {
                            ForEach(KyusyuUniversity.allCases, id: \.self) { option in
                                if option.name == selectionUniversityValue {
                                    let campus = option.description
                                    ForEach(campus , id: \.self) { i in
                                        Text(i).foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        
                    }.pickerStyle(WheelPickerStyle())
                }
                Spacer()
                if selectionUniversityValue != "--" {
                    if selectionCampusValue != "--"  {
                        NavigationLink(
                            destination:
                                StudentThirdRegistrationView(universityName: $selectionUniversityValue,
                                                              campusName:$selectionCampusValue).navigationBarHidden(true),
                            label: {
                                VStack {
                                    Text("Next!")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.black)
                                        .frame(width: 300, height: 50)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(Color.black, lineWidth: 0.5)
                                        )
                                        .cornerRadius(25)
                                        .padding(.horizontal)
                                        .padding(.bottom, 50)
                                }
                            })
                    } else {
                        VStack {
                            Text("キャンパスを選択してください")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                                .frame(width: 300, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.gray, lineWidth: 0.5)
                                )
                                .cornerRadius(25)
                                .padding(.horizontal)
                                .padding(.bottom, 50)
                        }
                    }
                } else {
                    VStack {
                        Text("大学を選択してください")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                            .frame(width: 300, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            )
                            .cornerRadius(25)
                            .padding(.horizontal)
                            .padding(.bottom, 50)
                    }
                }
            }
            .padding(.horizontal, 25)
            .foregroundColor(.black)
            Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.backward.circle.fill")
                    .font(.system(size: 26))
                    .padding()
                    .foregroundColor(Color.black)
            })
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
    }
    
    func find(value searchText: String, in array: [String]) -> Array<Int>? {
        var arr:Array<Int> = []
        for (index, value) in array.enumerated() {
            if value.localizedStandardContains(searchText) {
                arr.append(index)
            }
        }
        return arr
    }
    let kantouniversityname = ["--","愛国学園大学","青山学院大学","麻布大学","亜細亜大学","足利大学","跡見学園女子大学","育英大学","茨城大学","茨城キリスト教大学","茨城県立医療大学","植草学園大学","宇都宮大学","宇都宮共和大学","浦和大学","江戸川大学","桜美林大学","大妻女子大学","お茶の水女子大学","開智国際大学","嘉悦大学","学習院大学","学習院女子大学","神奈川大学","神奈川県立保健福祉大学","神奈川工科大学","神奈川歯科大学","鎌倉女子大学","亀田医療大学","川崎市立看護大学","川村学園女子大学","関東学院大学","神田外国語大学","関東学園大学","北里大学","桐生大学","共愛学園前橋国際大学","共栄大学","共立女子大学","杏林大学","群馬大学","群馬医療福祉大学","群馬健康科学大学","群馬県立女子大学","群馬パース大学","敬愛大学","慶応大学","恵泉女学園大学","工学院大学","国際医療福祉大学","國學院大学","国際基督大学","国際武道大学","国士舘大学","こども教育宝仙大学","駒澤大学","駒沢女子大学","国立音楽大学","埼玉大学","埼玉医科大学","埼玉学園大学","埼玉県立大学","埼玉工業大学","相模女子大学","作新学院大学","三育学院大学","産業能率大学","実践女子大学","自治医科大学","芝浦工業大学","白梅学園大学","白百合女子大学","淑徳大学","秀明大学","十文字学園女子大学","順天堂大学","上智大学","情報経営イノベーション大学","松蔭大学","尚美学園大学","昭和大学","昭和女子大学","城西大学","城西国際大学","上武大学","昭和薬科大学","女子栄養大学","女子美術大学","杉野服飾大学","駿河台大学","聖学院大学","成蹊大学","成城大学","聖心女子大学","清泉女子大学","聖徳大学","西武文理大学","聖路加国際大学","清和大学","専修大学","創価大学","大正大学","大東文化大学","高崎経済大学","高千穂大学","高崎健康福祉大学","高崎商科大学","拓殖大学","多摩大学","玉川大学","多摩美術大学","千葉大学","千葉科学大学","千葉経済大学","千葉県立保健医療大学","千葉工業大学","千葉商科大学","中央大学","中央学院大学","筑波大学","筑波学院大学","筑波技術大学","つくば国際大学","津田塾大学","帝京大学","帝京科学大学","帝京平成大学","デジタルハリウッド大学","電気通信大学","東海大学","東京大学","東京有明医療大学","東京医科大学","東京医科歯科大学","東京医療学院大学","東京医療保健大学","東京音楽大学","東京海洋大学","東京外国語大学","東京学芸大学","東京家政大学","東京家政学院大学","東京基督教大学","東京経済大学","東京藝術大学","東京工科大学","東京工業大学","東京工芸大学","東京国際大学","東京歯科大学","東京慈恵大会医科学","東京純心大学","東京女子大学","東京女子医科大学","東京女子体育大学","東京神学大学","東京聖栄大学","東京成徳大学","東京情報大学","東京造形大学","東京電機大学","東京都市大学","東京都立大学","東京農業大学","東京農工大学","東京福祉大学","東京富士大学","東京保健医療専門職大学","東京未来大学","東京薬科大学","東京理科大学","東都大学","東邦大学","東邦音楽大学","東朋学園大学","東洋大学","東洋英和女学院大学","常磐大学","獨協大学","獨協医科大学","二松学舎大学","日本大学","日本医科大学","日本医療科学大学","日本ウェルネススポーツ大学","日本映画大学","日本工業大学","日本歯科大学","日本社会事業大学","日本獣医生命科学医大学","日本女子大学","日本女子体育大学","日本赤十字看護大学","日本体育大学","日本文化大学","日本保健医療大学","日本薬科大学","人間総合科学大学","白鴎大学","一橋大学","フェリス女学院大学","文化学園大学","文教大学","文京学院大学","文星芸術大学","平成国際大学","法政大学","星薬科大学","前橋工科大学","武蔵野学","武蔵野大学","武蔵野音楽大学","武蔵野学院大学","武蔵野美術大学","明海大学","明治大学","明治学院大学","明治薬科大学","明星大学","ものつくり大学","ヤマザキ動物看護大学","横浜市立大学","横浜国立大学","横浜商科大学","横浜創英大学","横浜美術大学","横浜薬科大学","立教大学","立正大学","流通経済大学","ルーテル学院大学","了徳寺大学","麗澤大学","和洋女子大学","和光大学","早稲田大学"]
    
    let hokkaidouniversityname = ["--","旭川医科大学","旭川大学","育英館大学","小樽商科大学","帯広畜産大学","北見工業大学","釧路公立大学","札幌医科大学","札幌市立大学","札幌大谷大学","札幌国際大学","札幌保健医療大学","札幌大学","札幌学院大学","星槎道都大学","千歳科学技術大学","天使大学","名寄市立大学","日本医療大学","日本赤十字北海道看護大学","函館大学","はこだて未来大学","藤女子大学","北海商科大学","北翔大学","北星学園大学","北洋大学","北海学園大学","北海道医療大学","北海道科学大学","北海道教育大学旭川校","北海道教育大学岩見沢校","北海道教育大学釧路校","北海道教育大学札幌校","北海道教育大学函館校","北海道千歳リハビリテーション大学","北海道情報大学","北海道大学","北海道文教大学","室蘭工業大学","酪農学園大学"]
    
    let tohokuuniversityname = ["-","会津大学","青森大学","青森県立保健大学","青森公立大学","青森中央学院大学","秋田大学","秋田看護福祉大学","秋田県立大学","秋田公立美術大学","石巻専修大学","医療創生大学","岩手大学","岩手医科大学","岩手県立大学","岩手保健医療大学","奥羽大学","郡山女子大学","国際教養大学","柴田学園大学","尚絅学院大学","仙台大学","仙台白百合女子大学","東北大学","東北医科薬科大学","東北学院大学","東北芸術工科大学","東北公益文科大学","東北工業大学","東北生活文化大学","東北福祉大学","東北文化学園大学","東北文教大学","日本赤十字秋田看護大学","ノースアジア大学","八戸工業大学","八戸学院大学","弘前大学","弘前医療福祉大学","弘前学院大学","東日本国際大学","福島大学","福島学院大学","福島県立医科大学","富士大学","宮城大学","宮城学院女子大学","宮城教育大学","盛岡大学","山形大学","山形県立米沢栄養大学","山形保健医療大学"]
    
    let tyubuuniversityname = ["--","愛知大学","愛知医科大学","愛知学泉大学","愛知学院大学","愛知教育大学","愛知県立大学","愛知県立芸術大学","愛知工科大学","愛知工業大学","愛知産業大学","愛知淑徳大学","愛知東邦大学","愛知文教大学","愛知みずほ大学","朝日大学","石川県立大学","石川県立看護大学","一宮研伸大学","桜花学園大学","岡崎女子大学","開志専門職大学","金沢大学","金沢医科大学","金沢学院大学","金沢工業大学","かなざわ食マネジメント専門職大学","金沢星稜大学","金沢美術工芸大学","岐阜大学","岐阜医療科学大学","岐阜協立大学","岐阜県立看護大学","岐阜女子大学","岐阜成徳学園大学","岐阜保健大学","岐阜薬科大学","金城大学","金城学院大学","金城学院大学","敬和学園大学","健康科学大学","皇学館大学","公立小松大学","佐久大学","三条市立大学","志學館大学","静岡大学","静岡英和学院大学","静岡県立大学","静岡県立農林環境専門職大学","静岡産業大学","静岡福祉大学","静岡文化芸術大学","静岡理工科大学","修文大学","上越教育大学","信州大学","仁愛大学","椙山女学園大学","諏訪東京理科大学","星城大学","清泉女学院大学","聖隷クリストファー大学","大同大学","高岡法科大学","中京大学","中京学院大学","中部大学","中部学院大学","敦賀市立看護大学","都留文科大学","同盟大学","東海学院大学","東海学園大学","常葉大学","富山大学","富山県立大学","富山国際大学","豊田工業大学","豊橋技術科学大学","豊橋創造大学","長岡大学","長岡技術科学大学","長岡崇徳大学","長岡造形大学","長野大学","長野看護大学","長野県立大学","長野保健医療大学","名古屋大学","名古屋音楽大学","名古屋市立大学","名古屋外国語大学","名古屋学院大学","名古屋学芸大学","名古屋経済大学","名古屋芸術大学","名古屋工業大学","名古屋産業大学","名古屋産業大学","名古屋商科大学","名古屋女子大学","名古屋造形大学","名古屋文理大学","名古屋柳城女子大学","南山大学","新潟大学","新潟医療福祉大学","新潟経営大学","新潟県立大学","新潟県立看護大学","新潟工科大学","新潟国際情報大学","新潟産業大学","新潟食料農業大学","新潟青陵大学","新潟薬科大学","新潟リハビリテーション大学","日本赤十字豊田看護大学","日本福祉大学","人間環境大学","浜松医科大学","浜松学院大学","福井大学","福井医療大学","福井県立大学","福井工業大学","藤田医科大学","北陸大学","北陸学院大学","松本大学","松本看護大学","松本歯科大学","身延山大学","名城大学","山梨大学","山梨英和大学","山梨学院大学","山梨県立大学","四日市大学","四日市看護医療大学"]
    
    let kinkiuniversityname = ["--","大阪大学","大阪大谷大学","大阪教育大学","大阪経済大学","大阪経済法科大学","大阪工業大学","大阪公立大学","大阪国際大学","大阪産業大学","大阪松陰大学","大阪商業大学","大阪総合保育大学","大阪体育大学","大手前大学","追手門大学","関西大学","関西外国語大学","関西学院大学","関西福祉大学","畿央大学","京都大学","京都市立芸術大学","京都外国語大学","京都教育大学","京都芸術大学","京都芸術工芸大学","京都光華女子大学","京都工芸繊維大学","京都産業大学","京都女子大学","京都精華大学","京都先端科学大学","京都橘大学","京都ノートルダム大学","京都府立大学","京都府立医科大学","京都文教大学","近畿大学","芸術文化観光専門職大学","甲子園大学","甲南大学","甲南女子大学","神戸大学","神戸学院大学","神戸市立看護大学","神戸市外国語大学","神戸女子大学","神戸松蔭女子学院大学","神戸親和女子大学","神戸常盤大学","滋賀大学","滋賀医科大学","滋賀県立大学","摂南大学","園田学院女子大学","帝塚山大学","天理大学","同志社大学","名古屋大学","名古屋工業大学","奈良大学","奈良学園大学","奈良教育大学","奈良県立大学","奈良県立医科大学","奈良女子大学","梅花女子大学","兵庫教育大学","兵庫県立大学","福知山公立大学","佛教大学","阪南大学","武庫川女子大学","桃山学院大学","桃山学院教育大学","大和大学","立命館大学","龍谷大学","流通科大学","和歌山大学","和歌山県立医科大学","和歌山信愛大学"]
    
    let tyugokuuniversityname = ["--","叡啓大学","岡山大学","岡山県立大学","岡山学院大学","岡山商科大学","岡山理科大学","尾道私立大学","川崎医療福祉大学","環太平洋大学","吉備国際大学","倉敷芸術学芸大学","くらしき作陽大学","県立広島大学","公立鳥取環境大学","山陽学園大学","島根大学","島根県立大学","下関市立大学","就実大学","私立山口東京理科大学","中国学園大学","鳥取大学","新見公立大学","日本赤十字看護大学","ノートルダム清心女子大学","梅光学院大学","美作大学","比治山大学","広島大学","広島市立大学","広島経済大学","広島国際大学","広島修道大学","広島女学院大学","広島都市学園大学","広島文化学園大学","広島文教大学","福山市立大学","安田女子大学","山口大学","山口学芸大学","山口県立大学"]
    
    let sikokuuniversityname = ["--","愛媛大学","香川大学","高知大学","高知学園大学","高知県立大学","高知工科大学","四国大学","四国学院大学","聖カタリナ大学","高松大学","松島大学","徳島大学","徳島文理大学","鳴門教育大学","松山大学","松山東雲女子大学"]
    
    let kyusyuuniversityname = ["-","大分大学","沖縄大学","沖縄県立芸術大学","沖縄国際大学","鹿児島大学","活水女子大学","鹿屋体育大学","北九州市立大学","九州大学","九州栄養福祉大学","九州共立大学","九州産業大学","九州女子大学","九州ルーテル大学","熊本大学","熊本学園大学","熊本県立大学","久留米大学","佐賀大学","志学園大学","尚絅大学","西南学院大学","西南女学院大学","筑紫女学園大学","長崎大学","長崎県立大学","中村学院大学","西九州大学","福岡大学","福岡教育大学","福岡県立大学","福岡工業大学","福岡女学院大学","福岡女子大学","別府大学","宮崎大学","宮崎国際大学","宮崎産業経営大学","名桜大学","立命館アジア太平洋大学","琉球大学"]
}

