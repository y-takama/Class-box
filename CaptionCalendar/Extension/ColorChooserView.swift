//
//  ColorChooserView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/02.
//

import SwiftUI

struct ColorChooserView: View {
    @Binding var color: String
    @Binding var coloropacity: Double
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(0..<12){ num in
                    Button(action: {
                        color = "Color\(num)"
                        coloropacity = 1
                    }, label: {
                        ZStack {
                            Rectangle()
                                .fill(Color("Color\(num)"))
                                .frame(width: (getScreenBounds().width-40)/12-2, height: (getScreenBounds().width-40)/12-2)
                                .padding(1)
                            if color == "Color\(num)" && coloropacity == 1 {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: (getScreenBounds().width-40)/12, height: (getScreenBounds().width-40)/12)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    })
                }
            }
            HStack(spacing: 0) {
                ForEach(0..<12){ num in
                    Button(action: {
                        color = "Color\(num)"
                        coloropacity = 0.8
                    }, label: {
                        ZStack {
                            Rectangle()
                                .fill(Color("Color\(num)"))
                                .opacity(0.8)
                                .frame(width: (getScreenBounds().width-40)/12-2, height: (getScreenBounds().width-40)/12-2)
                                .padding(1)
                            if color == "Color\(num)" && coloropacity == 0.8 {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: (getScreenBounds().width-40)/12, height: (getScreenBounds().width-40)/12)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    })
                }
            }
            HStack(spacing: 0) {
                ForEach(0..<12){ num in
                    Button(action: {
                        color = "Color\(num)"
                        coloropacity = 0.6
                    }, label: {
                        ZStack {
                            Rectangle()
                                .fill(Color("Color\(num)"))
                                .opacity(0.6)
                                .frame(width: (getScreenBounds().width-40)/12-2, height: (getScreenBounds().width-40)/12-2)
                                .padding(1)
                            if color == "Color\(num)" && coloropacity == 0.6 {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: (getScreenBounds().width-40)/12, height: (getScreenBounds().width-40)/12)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    })
                }
            }
            HStack(spacing: 0) {
                ForEach(0..<12){ num in
                    Button(action: {
                        color = "Color\(num)"
                        coloropacity = 0.4
                    }, label: {
                        ZStack {
                            Rectangle()
                                .fill(Color("Color\(num)"))
                                .opacity(0.4)
                                .frame(width: (getScreenBounds().width-40)/12-2, height: (getScreenBounds().width-40)/12-2)
                                .padding(1)
                            if color == "Color\(num)" && coloropacity == 0.4 {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: (getScreenBounds().width-40)/12, height: (getScreenBounds().width-40)/12)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    })
                }
            }
        }.frame(width: getScreenBounds().width-40, height: 160)
    }
}
