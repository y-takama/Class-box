//
//  RefreshableScrollView.swift
//  RefreshableScrollView
//
//  Created by 髙間洋平 on 2021/08/25.
//

import SwiftUI

import SwiftUI

struct RefreshableScrollView<Content: View>: UIViewRepresentable {
    var content: Content
    var onRefresh: (UIRefreshControl) -> ()
    var refreshControl = UIRefreshControl()

    init(@ViewBuilder content: @escaping ()-> Content,onRefresh: @escaping (UIRefreshControl) -> ()) {
        self.content = content()
        self.onRefresh = onRefresh
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    

    func makeUIView(context: Context) -> UIScrollView {
        let uiscrollView = UIScrollView()
        refreshControl.tintColor = UIColor(named: "TextColor")
        refreshControl.addTarget(context.coordinator, action: #selector(context.coordinator.onRefresh), for: .valueChanged)
        setUpView(uiscrollView: uiscrollView)
        
        uiscrollView.refreshControl = refreshControl
        return uiscrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        setUpView(uiscrollView: uiView)
    }
    
    func setUpView(uiscrollView: UIScrollView) {
        let hostView = UIHostingController(rootView: content)
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: uiscrollView.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: uiscrollView.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: uiscrollView.trailingAnchor),
            hostView.view.widthAnchor.constraint(equalTo: uiscrollView.widthAnchor),
            hostView.view.heightAnchor.constraint(greaterThanOrEqualTo: uiscrollView.heightAnchor, constant: -8)
        ]
        uiscrollView.subviews.last?.removeFromSuperview()
        uiscrollView.addSubview(hostView.view)
        uiscrollView.addConstraints(constraints)
    }
    
    class Coordinator: NSObject {
        var parent: RefreshableScrollView
        
        init(parent: RefreshableScrollView) {
            self.parent = parent
        }
        
        @objc func onRefresh() {
            parent.onRefresh(parent.refreshControl)
        }
    }
}
