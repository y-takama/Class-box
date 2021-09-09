//
//  ContentView.swift
//  ContentView
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI

struct ConnectView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    let coloredNavAppearance = UINavigationBarAppearance()
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = UIColor.init(Color("TintColor"))
        coloredNavAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
    }
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                InitialScreenView()
            } else {
                if let user = viewModel.currentUser {
                    MainTabView(user: user)
                }
            }
        }
        .accentColor(Color("CaptionColor"))
    }
}
