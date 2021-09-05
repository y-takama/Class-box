//
//  ProfileView.swift
//  ProfileView
//
//  Created by 髙間洋平 on 2021/08/19.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    let width = UIScreen.main.bounds.width
//    @EnvironmentObject var viewModel: AuthViewModel
    let user: User
    var body: some View {
        let width = UIScreen.main.bounds.width
//        let height = UIScreen.main.bounds.height
        ScrollView {
            VStack {
                ZStack(alignment: .leading) {
                    Image("image1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width,
                               height: UIScreen.main.bounds.height/8, alignment: .top)
                        .clipped()
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 60 ,height: 60)
                                .foregroundColor(Color(.systemGray3))
                            
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30 ,height: 30)
                                .foregroundColor(Color(.systemGray5))
                        }
                        .padding(.leading, 15)
                        Spacer()
                        VStack(spacing: 5) {
                            if user.fullname == "" {
                                Text("名前は設定されていません")
                            } else {
                                Text(user.fullname!)
                                    .bold()
                                    .foregroundColor(Color.black)
                            }
                            Text(user.uid!)
                                .foregroundColor(Color.gray)
                                .modifier(SecondaryCaptionTextStyle())
                            
                        }
                        Spacer()
                    }
                }
                ZStack {
                    if user.fullname == "" {
                        ZStack {
                            Rectangle()
                                .frame(width: width*2/3,
                                       height: 2)
                                .foregroundColor(.gray)
                            HStack {
                                Rectangle()
                                    .frame(width: width*1/2,
                                           height: 2, alignment: .leading)
                                    .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                                Spacer()
                            }
                            
                        }.frame(width: width*2/3,
                                height: 2, alignment: .center)
                        
                    } else {
                        Rectangle()
                            .frame(width: width*2/3,
                                   height: 2, alignment: .center)
                            .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                        
                    }
                    
                    HStack(spacing: width/6-12) {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(user.fullname != "" ? Color(red: 104/255, green: 171/255, blue: 121/255) : .gray)
                        
                    }
                }.padding()
                
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Text("基本情報")
                            .font(.title2)
                            .fontWeight(.black)
                            .kerning(0.8)
                    }
                    
                    
                    HStack(spacing: 9) {
                        HStack {
                            Image(systemName: "shippingbox")
                                .font(.system(size: 16))
                            Text("Plans")
                                .font(.system(size: 14))
                                .bold()
                            Spacer()
                        }.frame(width: width*2/5)
                        Text("Student")
                            .font(.system(size: 14))
                            .bold()
                        Spacer()
                        Image(systemName: "exclamationmark.circle")
                            .font(.system(size: 12))
                    }
                    
                    HStack(spacing: 9) {
                        HStack {
                            Image(systemName: "graduationcap")
                                .font(.system(size: 16))
                            Text("大学名")
                                .font(.system(size: 14))
                                .bold()
                            Spacer()
                        }.frame(width: width*2/5)
                        Text(user.university!)
                            .font(.system(size: 14))
                            .bold()
                    }
                    
                    HStack(spacing: 9) {
                        HStack {
                            Image(systemName: "location.viewfinder")
                                .font(.system(size: 16))
                            Text("キャンパス")
                                .font(.system(size: 14))
                                .bold()
                            Spacer()
                        }.frame(width: width*2/5)
                        Text(user.campus!)
                            .font(.system(size: 14))
                            .bold()
                    }
                    
                    HStack(spacing: 9) {
                        HStack {
                            Image(systemName: "envelope")
                                .font(.system(size: 16))
                             
                            
                            Text("メールアドレス")
                                .font(.system(size: 14))
                                .bold()
                            Spacer()
                        }.frame(width: width*2/5)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            Text(user.email)
                                .font(.system(size: 14))
                                .bold()
                        }
                        
                    }

                }.padding()
                
            }
            .navigationBarHidden(true)
        }
//        .onAppear {
//            viewModels.fetchUser()
//        }
        
    }
}
