//
//  SettingTabView1.swift
//  SettingTabView1
//
//  Created by 髙間洋平 on 2021/08/17.
//

import SwiftUI

enum Tab: String {
    case calendar
    case calendar2
    case WebView
    case WebView2
}

struct SettingTabView1: View {
    @State private var selectionValue = Tab.calendar
    @State private var showingAlert = false
    @State var tab1Text = "Tab1"
    @State var url1Text = "https://www.apple.com"
    @State private var calendarDetail = false
    @State private var calendarChart = false
    @State private var note = false
//    @State private var url1Text: String
//    @State private var tab1Text: String

    var body: some View {
//        NavigationView {
        Form{
            Picker("",selection: $selectionValue) {
                HStack {
                    Image(systemName: "calendar")
                    Text("カレンダー")
                }.tag(Tab.calendar)
                HStack {
                    Image(systemName: "calendar")
                    Text("カレンダー2")
                }.tag(Tab.calendar2)
                HStack {
                    Image(systemName: "text.justify")
                    Text("カレンダーリスト")
                }.tag(Tab.WebView2)
                HStack {
                    Image(systemName: "text.justify")
                    Text("カレンダーリスト2")
                }.tag(Tab.WebView2)
                HStack {
                    Image(systemName: "list.bullet")
                    Text("リマインダー")
                }.tag(Tab.WebView2)
                HStack {
                    Image(systemName: "list.bullet")
                    Text("リマインダー2")
                }.tag(Tab.WebView2)
                HStack {
                    Image(systemName: "safari")
                    Text("safari")
                }.tag(Tab.WebView)
                HStack {
                    Image(systemName: "safari")
                    Text("safari2")
                }.tag(Tab.WebView2)
            }
            
            Section (header: Text("Tabの設定")){
                TextField("Tabの名前を設定してください", text: $tab1Text)
            }
            
            Section (header: Text("背景の設定")){
                TextField("Tabの名前を設定してください", text: $tab1Text)
            }
            
            if selectionValue.rawValue == "WebView" {
                TextField("URLを入力してください", text: $url1Text)
            }
            
            if selectionValue.rawValue == "calendar" {
                Toggle(isOn: $calendarDetail,
                       label: {
                           Text("一日の詳細")
                })
                
                Toggle(isOn: $note,
                       label: {
                           Text("一ヶ月の詳細")
                })
            }
            
            Toggle(isOn: $calendarChart,
                   label: {
                       Text("メモ")
            })
        }
        .navigationBarItems(trailing: registerButton)
        .navigationBarTitle("Tab 1")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var registerButton: some View {
        Button(action: {
            self.showingAlert = true
        }, label: {
            Image(systemName: "externaldrive.badge.icloud")
                .foregroundColor(Color("TextColor"))
        }).alert(isPresented: $showingAlert) {
            Alert(title: Text("設定を保存する"),
                  message: Text("設定したページに切り替わらない場合は、アプリケーションを再起動することで解決されます。"),
                  primaryButton: .cancel(Text("Cancel")),
                  secondaryButton: .default((Text("保存する").foregroundColor(Color("CaptionColor"))),
                                            action: {
                UserDefaults.standard.set(self.url1Text, forKey: "URL1")
                UserDefaults.standard.set(self.tab1Text, forKey: "TAB1")
            })
            )
        }
    }
}

