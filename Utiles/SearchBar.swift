//
//  SearchBar.swift
//  SearchBar
//
//  Created by 髙間洋平 on 2021/08/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        VStack {
            HStack {
                TextField("Search...", text: $text)
                    .padding(8)
                    .padding(.horizontal, 24)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                        })
            }
//            .padding(.horizontal, 6)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."))
    }
}
