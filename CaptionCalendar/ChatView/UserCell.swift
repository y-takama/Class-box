//
//  UserCell.swift
//  UserCell
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
import Kingfisher
//import KingfisherSwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                if user.profileImageUrl == "" {
                    let username = user.fullname!
                    let start = String(username.prefix(2))
                    Text(start)
                        .font(.system(size: 17, weight: .semibold))
                        .frame(width: 42, height: 42)
                        .padding(4)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                        
                } else {
                    KFImage(URL(string: user.profileImageUrl!))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .background(Color("TintColor"))
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.fullname!)
                        .font(.system(size: 13, weight: .semibold))
                    Text(user.username!)
                        .font(.system(size: 11))
                        .foregroundColor(.primary)
                }
                .padding(.trailing,8)
                Spacer()
            }.foregroundColor(Color("TextColor"))
        }
    }
}
