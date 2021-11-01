//
//  WebView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/06.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var loadUrl:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: loadUrl)!))
    }
}
