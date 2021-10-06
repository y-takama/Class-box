//
//  SearchUniversityBar.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/21.
//

import SwiftUI

struct SearchUniversityBar: View {
    @Binding var text: String
    var body: some View {
        VStack {
            HStack {
                TextField("Search...", text: $text)
                    .padding(8)
                    .padding(.horizontal, 24)
                    .background(Color(.systemGray4).opacity(0.1))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                        })
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.7), lineWidth: 0.5)
                    )
            }
            .padding(.horizontal, 6)
        }
    }
}
