//
//  NotificationCell.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/07.
//

import SwiftUI

struct NotificationCell: View {
    let notification: CNotification
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Image("classbox_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                Spacer()
            }.frame(width: 35)
            VStack(alignment: .leading) {
                Text(notification.name!)
                    .bold()
                    .font(.system(size: 14))
                    .padding(.vertical, 2)
                    .foregroundColor(Color("TextColor"))
                Text(notification.title!)
                    .font(.system(size: 13))
                    .foregroundColor(Color("TextColor"))
                Text(notification.content!)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            Spacer()
        }.padding(.horizontal)
    }
}
