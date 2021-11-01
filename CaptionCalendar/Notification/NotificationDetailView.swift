//
//  NotificationDetailView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/07.
//

import SwiftUI

struct NotificationDetailView: View {
    let notification: CNotification
    var body: some View {
        VStack {
            ScrollView {
                Text(notification.title!)
                    .bold()
                    .font(.system(size: 15))
                    .padding(.vertical, 7)
                VStack(alignment: .leading) {
                    Text(notification.content!)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: getScreenBounds().width - 40)
            }
            //TestAD
//            AdView(adUnitID: "ca-app-pub-3940256099942544/2934735716")
            
            AdView(adUnitID: "ca-app-pub-6537638223494633/5871430392")
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.width*5/32,
                       alignment: .bottom)
                .ignoresSafeArea()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(notification.name!)
        .navigationBarItems(leading: HStack {
            profileButton
        })
    }
    var profileButton: some View {
        Button(action: {
        }, label: {
            Image("classbox_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 35)
                .clipShape(Circle())
                .padding(.trailing, getScreenBounds().width/5)
        })
    }
}
