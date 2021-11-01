//
//  InterstitialView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/12.
//

import GoogleMobileAds
import SwiftUI
import UIKit

final class Interstitial:NSObject, GADFullScreenContentDelegate {
  var interstitial:GADInterstitialAd?

  override init() {
    super.init()
    self.loadInterstitial()
  }

    func loadInterstitial(){
        let request = GADRequest()
        
//        ca-app-pub-6537638223494633/3531674689
        
        //TestAds
//        ca-app-pub-3940256099942544/4411468910

        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-6537638223494633/3531674689",
                               request: request,
                               completionHandler: { [self] ad, error in
                                if let error = error {
                                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                    return
                                }
                                interstitial = ad
                                interstitial?.fullScreenContentDelegate = self
                               })
    }

    func showAd(){
        if self.interstitial != nil {
            let root = UIApplication.shared.windows.first?.rootViewController
            self.interstitial?.present(fromRootViewController: root!)
        }
        else{
            print("Not Ready")
        }
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
        self.loadInterstitial()
    }
    // Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    // Tells the delegate that the ad presented full screen content.
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did present full screen content.")
    }
}
