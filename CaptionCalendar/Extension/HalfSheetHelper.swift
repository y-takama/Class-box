//
//  HalfSheetHelper.swift
//  HalfSheetHelper
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI

//struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
//    var sheetView: SheetView
//    let controller = UIViewController()
//    @Binding var showingSetting: Bool
//    
//    func makeUIViewController(context: Context) -> UIViewController {
//        controller.view.backgroundColor = .clear
//        return controller
//    }
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        if showingSetting {
//            
//            let sheetController = CustomHostingController(rootView: sheetView)
//            
//            uiViewController.present(sheetController, animated: true) {
//                DispatchQueue.main.async {
//                    self.showingSetting.toggle()
//                }
//            }
//        }
//    }
//}
//
//class CustomHostingController<Content: View>: UIHostingController<Content> {
//    override func viewDidLoad() {
//        if let presentationController = presentationController as?
//            UISheetPresentationController{
//            presentationController.detents = [
//                .medium(),
//                .large()
//            ]
//            presentationController.prefersGrabberVisible = true
//        }
//    }
//}
