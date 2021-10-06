//
//  BannerView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/07/26.
//

import SwiftUI
import GoogleMobileAds
import UIKit

struct AdView: UIViewRepresentable {
    let adUnitID: String
    func makeUIView(context: UIViewRepresentableContext<AdView>) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
//        let viewController = UIViewController()
//        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        banner.adUnitID = adUnitID
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
//        viewController.view.addSubview(view)
//        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        banner.load(GADRequest())
        return banner
    }
    func updateUIView(_ uiView: GADBannerView, context: UIViewRepresentableContext<AdView>) {
        
    }
}
