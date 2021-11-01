//
//  CalendarBellImage.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/08.
//

import SwiftUI

struct CalendarBellImage: View {
    @Binding var notificationButton: Bool
    let user: User
    var body: some View {
        Button(action: {
            readNotification()
            withAnimation() {
                notificationButton = true
            }
        }, label: {
            if user.notification! {
                ZStack(alignment: .bottomTrailing) {
                    Image(systemName: "bell")
                        .font(Font.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("TextColor"))
                    Image(systemName: "circle.fill")
                        .font(.system(size: 7))
                        .foregroundColor(.red)
                }
            } else {
                Image(systemName: "bell")
                    .font(Font.system(size: 16, weight: .semibold))
                    .foregroundColor(Color("TextColor"))
            }
        })
    }
    func readNotification() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let data = ["notification": false]
        let dogRef = COLLECTION_USERS.document(user.id!)
        dogRef.updateData(data) { _ in
            AuthViewModel.shared.fetchUserSetting()
        }
    }
}
