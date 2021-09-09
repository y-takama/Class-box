//
//  StudentFirstRegistrationView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/07.
//

import SwiftUI

struct StudentFirstRegistrationView: View {
    let location = ["北海道","東北","関東","中部","近畿","中国","四国","九州"]
    @State private var selectedlocation = "近畿"
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
        
        ZStack(alignment: .topLeading) {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack {
                    Picker(selection: $selectedlocation, label: Text("地方区分")) {
                        ForEach(location, id: \.self) { units in
                            Text(units)
                                .foregroundColor(.black)
                        }
                    }
                }.padding()
                .pickerStyle(SegmentedPickerStyle())
                NavigationLink(
                    destination:
                        StudentSecondRegistrationView(location: $selectedlocation).navigationBarHidden(true),
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
        //                                    .background(
        //                                        .white.opacity(1)
        //                                        ,in: Capsule()
        //                                    )
                                .padding(.horizontal)
                                .padding(.bottom, 50)
                        }
                    })
            }
            Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.backward.circle.fill")
                    .font(.system(size: 26))
                    .padding()
                    .foregroundColor(Color.black)
            })
        }
    }
}

struct StudentFirstRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        StudentFirstRegistrationView()
    }
}
