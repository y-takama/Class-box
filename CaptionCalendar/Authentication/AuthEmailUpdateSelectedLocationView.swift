//
//  AuthEmailUpdateSelectedLocationView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/11.
//

import SwiftUI

struct AuthEmailUpdateSelectedLocationView: View {
    @State private var favoriteColor = 3
    @State private var imagename = "japan_kansai"
    @State private var selectedlocation = "関西"
    @Binding var emailUpdateView: Bool
    
    init(emailUpdateView: Binding<Bool>) {
        self._emailUpdateView = emailUpdateView
        let foregroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
//        let backgroundColor = UIColor(white: 1, alpha: 0.5)
        UISegmentedControl.appearance().selectedSegmentTintColor = foregroundColor
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([
            .foregroundColor: foregroundColor,
        ], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([
            .foregroundColor: UIColor.white,
        ], for: .selected)
    }
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottom) {
                ZStack {
                    Color.white.edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        Image(imagename)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width-20)
                        
                        Spacer()
                        VStack {
                            Picker(selection: $favoriteColor.onChange(colorChange), label: Text("Color")) {
                                Text("九州").tag(0)
                                Text("四国").tag(1)
                                Text("中国").tag(2)
                                Text("関西").tag(3)
                                Text("中部").tag(4)
                                Text("関東").tag(5)
                                Text("東北").tag(6)
                                Text("北海道").tag(7)
                            }
                        }.padding()
                            .pickerStyle(SegmentedPickerStyle())
                        NavigationLink(
                            destination:
                                AuthEmailUpdateSelectedUniversityView(location: $imagename, emailUpdateView: $emailUpdateView).navigationBarHidden(true),
                            label: {
                                VStack {
                                    Text("Next!")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.black)
                                        .frame(width: 300, height: 50)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(Color.black, lineWidth: 0.5)
                                        )
                                        .cornerRadius(25)
                                        .padding(.horizontal)
                                        .padding(.bottom, 50)
                                }
                            })
                    }.edgesIgnoringSafeArea(.bottom)
                }
                
            }.navigationBarHidden(true)
        }
    }
    func colorChange(_ tag: Int) {
        if tag == 0 {
            imagename = "japan_kyusyu"
        } else if tag == 1 {
            imagename = "japan_sikoku"
        } else if tag == 2 {
            imagename = "japan_tyugoku"
        } else if tag == 3 {
            imagename = "japan_kansai"
        } else if tag == 4 {
            imagename = "japan_tyubu"
        } else if tag == 5 {
            imagename = "japan_kanto"
        } else if tag == 6 {
            imagename = "japan_tohoku"
        } else if tag == 7 {
            imagename = "japan_hokkaido"
        }
    }
}
