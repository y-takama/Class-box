//
//  SafariView.swift
//  SafariView
//
//  Created by 髙間洋平 on 2021/08/08.
//

import SwiftUI
import SafariServices



struct safari: UIViewControllerRepresentable {
    var urlString: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<safari>) -> SFSafariViewController {
        let controller = SFSafariViewController(url: URL(string: urlString)!)
        controller.preferredBarTintColor = UIColor(named: "TintColor")
        controller.preferredControlTintColor = UIColor(named: "CaptionColor")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<safari>) {
    }
}
