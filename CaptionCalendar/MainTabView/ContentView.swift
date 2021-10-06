//
//  ContentView.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/25.
//

import SwiftUI
import Firebase
import GoogleMobileAds

@main
struct Connect: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ConnectView().environmentObject(AuthViewModel.shared)
//            InitialScreenView()
        }
        
    }
    
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
    
    
}
