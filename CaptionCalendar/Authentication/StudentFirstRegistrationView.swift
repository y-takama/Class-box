//
//  StudentFirstRegistrationView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/07.
//

import SwiftUI

struct StudentFirstRegistrationView: View {
    let location = ["北海道","東北","関東","中部","関西","中国","四国","九州"]
    @State private var favoriteColor = 4
    @State private var imagename = "japan_kansai"
    @State private var selectedlocation = "関西"
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init() {
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
        
        ZStack(alignment: .bottom) {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Image(imagename)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width-20)
                        
                    Spacer()
                    VStack {
//                        Picker(selection: $selectedlocation, label: Text("地方区分")) {
//                            ForEach(location, id: \.self) { units in
//                                Text(units)
//                                    .foregroundColor(.black)
//                            }
//                        }
                        Picker(selection: $favoriteColor.onChange(colorChange), label: Text("Color")) {
                            Text("北海道").tag(0)
                            Text("東北").tag(1)
                            Text("関東").tag(2)
                            Text("中部").tag(3)
                            Text("関西").tag(4)
                            Text("中国").tag(5)
                            Text("四国").tag(6)
                            Text("九州").tag(7)
                        }
                        
                    }.padding()
                    .pickerStyle(SegmentedPickerStyle())
                    NavigationLink(
                        destination:
                            StudentSecondRegistrationView(location: $imagename).navigationBarHidden(true),
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
                    NavigationLink(
                        destination:
                            SelectedScreenView().navigationBarHidden(true),
                        label: {
                            Text("Back")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(30)
        //                        .ignoresSafeArea()
                        })
                }.edgesIgnoringSafeArea(.bottom)
//                .background(Color.red)
            }
            
        }
    }
    func colorChange(_ tag: Int) {
        if tag == 0 {
            imagename = "japan_hokkaido"
        } else if tag == 1 {
            imagename = "japan_tohoku"
        } else if tag == 2 {
            imagename = "japan_kanto"
        } else if tag == 3 {
            imagename = "japan_tyubu"
        } else if tag == 4 {
            imagename = "japan_kansai"
        } else if tag == 5 {
            imagename = "japan_tyugoku"
        } else if tag == 6 {
            imagename = "japan_sikoku"
        } else if tag == 7 {
            imagename = "japan_kyusyu"
        }
    }
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}
