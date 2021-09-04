//
//  SettingCalendar.swift
//  SettingCalendar
//
//  Created by 髙間洋平 on 2021/08/17.
//

import SwiftUI


struct SettingCalendar: View {
    @State private var selectionValue = University.Ritumeikan
    @State private var showingAlert = false
    @State var tab1Text = "Tab1"
    @State var url1Text = "https://www.apple.com"
    @State private var calendarWeather = false
    @State private var calendarStart = false
    @State private var note = false
//    @State private var url1Text: String
//    @State private var tab1Text: String

    var body: some View {
//        NavigationView {
        Form{
            Picker("",selection: $selectionValue) {
                Text("立命館").tag(University.Ritumeikan)
                Text("同志社").tag(University.Dousisya)
                Text("関西大学").tag(University.Kansai)
                Text("関西学院大学").tag(University.Kansaigakuin)
            }
            if selectionValue.rawValue == "Ritumeikan" {
                if let url = URL(string: "webcal://p22-caldav.icloud.com/published/2/MTg1NjM3MTY4OTE4NTYzNwYemyYIaVCwsEqq8QsxIUHKFVxLpcNtcscwiNTguTHwJ52yzL7ONMgcEN8dwF0YTTGJtnelx18fB0232rXx0F4"){
                    Link("学年歴をダウンロードできます。",destination: url)
                }
                    
            }
            if selectionValue.rawValue == "Dousisya" {
                if let url = URL(string: "webcal://p22-caldav.icloud.com/published/2/MTg1NjM3MTY4OTE4NTYzNwYemyYIaVCwsEqq8QsxIUGtFXBVMILQPRvyzLBBjgO3Azzb9dTJDOpxHuoHErlwxZsejTOk_MOMvPfE0RMYq_k"){
                    Link("学年歴をダウンロードできます。",destination: url)
                }
                    
            }
            if selectionValue.rawValue == "Kansai" {
                if let url = URL(string: "webcal://p22-caldav.icloud.com/published/2/MTg1NjM3MTY4OTE4NTYzNwYemyYIaVCwsEqq8QsxIUHmEeYbJY_Rw0-lhU_2yDa82gvw_FQOGJO1WcYj1id7NfXGOZM1_9It7TmXWTmJiG4"){
                    Link("学年歴をダウンロードできます。",destination: url)
                }
                    
            }
            if selectionValue.rawValue == "Kansaigakuin" {
                if let url = URL(string: "webcal://p22-caldav.icloud.com/published/2/MTg1NjM3MTY4OTE4NTYzNwYemyYIaVCwsEqq8QsxIUHix7joj30ONNOpF7c3dh6O0-AxU8TVKGc05PCGGoN_6t21AR7DOF8j1lHJ-bYXHfs"){
                    Link("学年歴をダウンロードできます。",destination: url)
                }
                    
            }
            Section(header: Text("基本設定")){
                Toggle(isOn: $calendarWeather,
                       label: {
                           Text("天気を表示する")
                })
                
                Toggle(isOn: $calendarStart,
                       label: {
                           Text("月曜日始まりにする")
                })
            }
            
            
            
        }
        .navigationBarItems(trailing: registerButton)
        .navigationBarTitle("Calendar")
        .navigationBarTitleDisplayMode(.inline)
//        }
        
//        .padding()
//        .pickerStyle(SegmentedPickerStyle)
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

