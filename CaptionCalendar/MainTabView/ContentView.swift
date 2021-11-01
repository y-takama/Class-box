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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ConnectView().environmentObject(AuthViewModel.shared)
//            InitialScreenView()
        }
    }
}

class Appdelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    let gcmMessageIDKey = "gcm.message_id"
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        // Setting up Cloud Messaging
        Messaging.messaging().delegate = self
        
        // Setting up Notification
        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
          )
        } else {
          let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()

        
        
        return true
    }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult)
                       -> Void) {
      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }

      // Print full message.
      print(userInfo)

      completionHandler(UIBackgroundFetchResult.newData)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    }
}

@available(iOS 10, *)
extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
                              withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions)
                                -> Void) {
    let userInfo = notification.request.content.userInfo

    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }
    print(userInfo)

      completionHandler([[.banner,.badge, .sound]])
  }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo

    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }
    print(userInfo)

    completionHandler()
  }
}
