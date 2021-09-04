//
//  ClassColorView.swift
//  ClassColorView
//
//  Created by 髙間洋平 on 2021/08/28.
//

import SwiftUI

struct ClassColorView: View {
    let width = UIScreen.main.bounds.width
    @ObservedObject var viewModel: ClassDetailViewModel
    var body: some View {
        Rectangle()
            .frame(width:width/6,height:80)
            .foregroundColor(Color("\(viewModel.classInfo.color!)"))
            .cornerRadius(5)
    }
}
