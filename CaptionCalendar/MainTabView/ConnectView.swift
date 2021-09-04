//
//  ContentView.swift
//  ContentView
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI

struct ConnectView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    //    @State var isShowingNewCaptionView = false
    //    @State private var showingMenu = false
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                InitialScreenView()
            } else {
                
//                let user = viewModel.currentUser
//                Text(user)
//                MainTabView()
                if let user = viewModel.currentUser {
                    
                    MainTabView(user: user)
                }
            }
        }
        .accentColor(Color("CaptionColor"))
    }
}
