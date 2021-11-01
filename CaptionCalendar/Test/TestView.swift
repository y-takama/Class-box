//
//  TestView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/12.
//

import SwiftUI
import GoogleMobileAds

struct TestView: View {
    private var fullScreenAd: Interstitial?
    init() {
        fullScreenAd = Interstitial()
    }
    var body: some View {
//        NavigationView {
            Button(action: {
                fullScreenAd?.showAd()
            }, label: {
                Text("ads")
            })
//        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
