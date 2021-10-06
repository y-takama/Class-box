//
//  ContentView.swift
//  ContentView
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI

struct ConnectView: View {
    @State var isLoading = false
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
                
                ZStack {
                    if let user = viewModel.currentUser {
                        MainTabView(user: user)
                            .navigationBarHidden(true)
                    }
                    if viewModel.loading {
                        ZStack {
                            Color("TintColor").ignoresSafeArea(.all)
                            VStack(spacing: 20) {
                                Image(systemName: "shippingbox")
                                    .font(Font.system(size: 55, weight: .bold))
                                    .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: Color("CaptionColor")))
                                    .scaleEffect(1)
                            }
                        }
                    }
                }
            }
        }.accentColor(Color("CaptionColor"))
    }
}
