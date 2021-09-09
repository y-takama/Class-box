//
//  StudentSecondRegistrationView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/07.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct StudentSecondRegistrationView: View {
    @State private var selectionValue = University.Ritumeikan
    @State private var selectionUniversityValue = "--"
    @State private var selectionCampusValue = "--"
    @State private var Universityname = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var isShowAlert = false
    @State private var isError = false
    @State private var errorMessage = ""
    @State private var campusname = ""
    @Binding var location: String
    @EnvironmentObject var viewModel: AuthViewModel
    let kinkiuniversityname = ["--","立命館大学","同志社大学","関西大学","関西学院大学","京都産業大学","近畿大学","甲南大学","龍谷大学"]
    let toukaiuniversityname = ["--","名古屋大学","名古屋工業大学"]
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .topLeading) {
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
                if location == "近畿" {
                    Picker(selection: $selectionUniversityValue, label: Text("大学名")) {
                        ForEach(kinkiuniversityname, id: \.self) { option in
                            Text(option)
                                .foregroundColor(.black)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                } else if location == "中部" {
                    Picker(selection: $selectionUniversityValue, label: Text("大学名")) {
                        ForEach(toukaiuniversityname, id: \.self) { option in
                            Text(option)
                                .foregroundColor(.black)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                
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
                
                if selectionUniversityValue != "--" {
                    if selectionCampusValue != "--"  {
                        NavigationLink(
                            destination:
                                StudentThirdRegistrationView(universityName: $selectionUniversityValue,
                                                              campusName:$selectionCampusValue).navigationBarHidden(true),
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
                    } else {
                        VStack {
                            Text("キャンパスを選択してください")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                                .frame(width: 300, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.gray, lineWidth: 0.5)
                                )
                                .cornerRadius(25)
        //                                    .background(
        //                                        .white.opacity(1)
        //                                        ,in: Capsule()
        //                                    )
                                .padding(.horizontal)
                                .padding(.bottom, 50)
                        }
                    }
                } else {
                    VStack {
                        Text("大学を選択してください")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                            .frame(width: 300, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            )
                            .cornerRadius(25)
    //                                    .background(
    //                                        .white.opacity(1)
    //                                        ,in: Capsule()
    //                                    )
                            .padding(.horizontal)
                            .padding(.bottom, 50)
                    }
                }
            }
            .padding(.horizontal, 25)
            .foregroundColor(.black)
//            .background(Color.red)
            
            Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.backward.circle.fill")
                    .font(.system(size: 26))
                    .padding()
                    .foregroundColor(Color.black)
            })
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
    }
}

