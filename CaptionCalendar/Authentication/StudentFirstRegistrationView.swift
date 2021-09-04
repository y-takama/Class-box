//
//  StudentFirstRegistrationView.swift
//  StudentFirstRegistrationView
//
//  Created by 髙間洋平 on 2021/08/21.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct StudentFirstRegistrationView: View {
    @State private var selectionValue = University.Ritumeikan
    @State private var selectionUniversityValue = "立命館大学"
    @State private var selectionCampusValue = "未設定"
    @State private var Universityname = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var isShowAlert = false
    @State private var isError = false
    @State private var errorMessage = ""
//    @State private var universityname = ""
    @State private var campusname = ""
    @EnvironmentObject var viewModel: AuthViewModel
    let universityname = ["立命館大学","同志社大学","関西大学","関西学院大学"]
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 5) {
                Spacer()
                HStack{
                    Text("大学名")
                    Text("必須")
                        .font(.system(size: 10, weight: .semibold))
                        .frame(width: 30, height: 14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 0.5)
                        )
                    Spacer()
                }
                Picker(selection: $selectionUniversityValue, label: Text("大学名")) {
                    ForEach(universityname, id: \.self) { option in
                        Text(option)
                            .foregroundColor(.black)
                    }
                }
                .pickerStyle(WheelPickerStyle())
//                Text("\(selectionValue.rawValue)")
                HStack{
                    Text("キャンパス")
                    Text("必須")
                        .font(.system(size: 10, weight: .semibold))
                        .frame(width: 30, height: 14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 0.5)
                        )
                    Spacer()
                }.foregroundColor(.black)
                
                Picker("",selection: $selectionCampusValue) {
                    ForEach(University.allCases, id: \.self) { option in
                        if option.name == selectionUniversityValue {
                            let campus = option.description
                            ForEach(campus , id: \.self) { i in
                                Text(i).foregroundColor(.black)
                            }
                        }
                    }
                }.pickerStyle(WheelPickerStyle())
                Spacer()
//                Text("\(selectionCampusValue)")
                
                NavigationLink(
                    destination:
                        StudentSecondRegistrationView(universityName: $selectionUniversityValue,
                                                      campusName:$selectionCampusValue).navigationBarHidden(true),
                    label: {
                        VStack {
                            Text("進む")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color.white)
                                .frame(width: 300, height: 50)
                                .background(Color(red: 104/255, green: 171/255, blue: 121/255))
                                .clipShape(Capsule())
                                .padding()
                        }
                    })
                
                Spacer()
                
                NavigationLink(destination: InitialScreenView().navigationBarHidden(true), label: {
                    Text("Back")
                        .font(.system(size: 14, weight: .semibold))
                })
            }
            .padding(.horizontal, 25)
            .foregroundColor(.black)
//            .background(Color.red)
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
    }
}
