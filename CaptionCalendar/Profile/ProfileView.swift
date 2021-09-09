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
    let user: User
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        let width = UIScreen.main.bounds.width
//        let height = UIScreen.main.bounds.height
        ScrollView {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    ZStack(alignment: .topTrailing) {
                        Image("image1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: width,
                                   height: UIScreen.main.bounds.height/7+20, alignment: .top)
                            .clipped()
                        Button(action: { mode.wrappedValue.dismiss() }, label: {
                            Image(systemName: "multiply.circle.fill")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding(.top, 20)
                                .padding()
                        })
                    }
                        
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
                    }.padding(.bottom, 15)
                }
                
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
                                .frame(width: 20)
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
                                .frame(width: 20)
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
                                .frame(width: 20)
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
                                .frame(width: 20)
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
        }.ignoresSafeArea(.all)
    }
}
