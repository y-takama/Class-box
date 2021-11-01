//
//  ClassCell.swift
//  ClassCell
//
//  Created by 髙間洋平 on 2021/08/23.
//

import SwiftUI

struct ClassCell: View {
    let classes: TimeTable
    var body: some View {
        HStack {
            let classvalues = classes.courseName
            let start = String(classvalues.prefix(1))
            Text(start)
                .font(.system(size: 20, weight: .semibold))
                .frame(width: 26, height: 26)
                .padding(10)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 23)
                        .stroke(Color.gray, lineWidth: 0.3)
                )
                .foregroundColor(Color("TextColor"))
            VStack(alignment: .leading) {
                Text(classes.courseName)
                    .bold()
                    .foregroundColor(Color("TextColor"))
                Text(classes.classCode!)
                    .font(.system(size: 10))
                    .modifier(SecondaryCaptionTextStyle())
                    
            }
            .padding(.leading)
            Spacer()
            Image(systemName: "chevron.right")
//                .modifier(SecondaryCaptionTextStyle())
                
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width)
    }
}
