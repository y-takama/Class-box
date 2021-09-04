//
//  UserCell.swift
//  UserCell
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI
//import KingfisherSwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemGray5))
                
                VStack(alignment: .leading, spacing: 4) {
                    if user.username == nil {
                        
                    } else {
                        Text(user.fullname!)
                            .font(.system(size: 14, weight: .semibold))
                    }
                    
                    
//                    Text(user.username!)
//                        .font(.system(size: 14))
                    
                }
                .foregroundColor(Color("TextColor"))
                Spacer()
            }
        }
    }
}
