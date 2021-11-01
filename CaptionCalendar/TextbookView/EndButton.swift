//
//  EndButton.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/12.
//

import SwiftUI

struct EndButton: View {
    private var fullScreenAd: Interstitial?
    init() {
        fullScreenAd = Interstitial()
    }
    var body: some View {
            Button(action: {
    //            registration()
                fullScreenAd?.showAd()
    //            isShowingNextPart.toggle()
                
            }, label: {
                Image(systemName: "multiply.circle")
                    .font(Font.system(size: 16, weight: .bold))
                    .foregroundColor(Color("TextColor"))
            })
    }
//    func registration() {
//        let docRef = COLLECTION_USERS.document(user.uid!).collection("textbook").document(content.textbookID!).collection("1")
//        let data = ["textbookID": content.textbookID!,
//                    "courseID": content.courseID!,
//                    "useranswer1": useranswer1,
//                    "useranswer1": useranswer2] as [String : Any]
////        docRef.setData(data){ _ in
////        }
//    }
}
