//
//  ProfileView.swift
//  ProfileView
//
//  Created by 髙間洋平 on 2021/08/19.
//

import SwiftUI
//import Firebase
import Kingfisher


struct ProfileView: View {
    @State var showImagePicker = false
    @State var showsafari = false
    @State var profileURL = ""
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Binding var profileToggle: Bool
    let width = UIScreen.main.bounds.width
    @Binding var user: User
    @ObservedObject var viewModel: ProfileViewModel
    var body: some View {
        NavigationView {
            ZStack {
                RefreshableScrollView(content: {
                    VStack {
                        ZStack(alignment: .bottomLeading) {
                            if user.backImageUrl == "" {
                                Image("image1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: getScreenBounds().width,
                                           height: 140)
                                    .clipped()
                            } else {
                                KFImage(URL(string: user.backImageUrl!))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: getScreenBounds().width,
                                           height: 140)
                                    .clipped()
                            }
                            
                            
                            HStack(spacing: 20) {
                                if user.profileImageUrl == "" {
                                    let username = user.fullname
                                    let start = String(username!.prefix(2))
                                    Text(start)
                                        .font(.system(size: 24, weight: .semibold))
                                        .frame(width: 50, height: 50)
                                        .padding(5)
                                        .background(Color("TintColor").opacity(0.8))
                                        .clipShape(Circle())
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(Color.gray, lineWidth: 0.3)
                                        )
                                        .foregroundColor(Color("TextColor"))
                                        .padding(.leading, 20)
                                } else {
                                    KFImage(URL(string: user.profileImageUrl!))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .background(Color("TintColor"))
                                        .clipShape(Circle())
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 60)
                                                .stroke(Color.gray, lineWidth: 0.3)
                                        )
                                        .padding(.leading, 20)
                                    
                                }
                                
                                
                                VStack(alignment: .leading, spacing: 5) {
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
                            .frame(width: getScreenBounds().width,
                                   height: 55)
                            .padding(.bottom)
                        }
                        
                        VStack(alignment: .leading, spacing: 18) {
                            
                            HStack {
                                NavigationLink(destination: {
                                    ProfileEditView(user: $user)
                                        .navigationBarBackButtonHidden(true)
                                }, label: {
                                    Text("プロフィールを編集")
                                        .font(.system(size: 14))
                                        .frame(width: getScreenBounds().width - 40, height: 32)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color("TextColor"), lineWidth: 0.3)
                                        )
                                })
                            }
                            
                            HStack {
                                Text("基本情報")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .kerning(0.8)
                            }
                            
                            HStack(spacing: 9) {
                                HStack {
                                    Image(systemName: "person")
                                        .font(.system(size: 16))
                                        .frame(width: 20)
                                    Text("Name")
                                        .font(.system(size: 14))
                                        .bold()
                                    Spacer()
                                }.frame(width: width*2/5)
                                Text(user.fullname!)
                                    .font(.system(size: 14))
                                    .bold()
                                Spacer()
                            }
                            
                            HStack(spacing: 9) {
                                HStack {
                                    Image(systemName: "barcode")
                                        .font(.system(size: 16))
                                        .frame(width: 20)
                                    Text("ID")
                                        .font(.system(size: 14))
                                        .bold()
                                    Spacer()
                                }.frame(width: width*2/5)
                                Text(user.username!)
                                    .font(.system(size: 12))
                                    .bold()
                                Spacer()
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
                                Text(user.userStats!)
                                    .font(.system(size: 14))
                                    .bold()
                                Spacer()
                                Image(systemName: "exclamationmark.circle")
                                    .font(.system(size: 12))
                            }
                            
                            if user.userStats == "student" {
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
                        }.padding(20)
                    }
                    
                    Spacer()
                }, onRefresh: { control in
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                        AuthViewModel.shared.fetchUserSetting()
                        control.endRefreshing()
                    }
                })
                
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: profileButton, trailing: backButton)
                
//                if viewModel.loading {
//                    ProgressView()
//                        .progressViewStyle(CircularProgressViewStyle(tint: Color("CaptionColor")))
//                        .scaleEffect(0.5)
//                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        if user.instagramText! == "" || user.instagramText == nil {
                            
                        } else {
                            NavigationLink(destination: {
                                WebView(loadUrl: "https://www.instagram.com/" + String(user.instagramText!))
                            }, label: {
                                Image("instagram_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                    .clipped()
                                    .padding(10)
                            })
                        }
                        if user.twitterText! == "" || user.twitterText == nil {
                            
                        } else {
                            NavigationLink(destination: {
                                WebView(loadUrl: "https://twitter.com/" + String(user.twitterText!))
                            }, label: {
                                Image("twitter_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                    .clipped()
                                    .padding(10)
                            })
                        }
                        Spacer()
                    }
                }
            }
            NavigationLink(isActive: $showsafari, destination: {
                WebView(loadUrl: profileURL)
            }, label: {})
        }
    }
    var backButton: some View {
        Button(action: {
            profileToggle.toggle()
        }, label: {
            Image(systemName: "multiply.circle.fill")
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }
    var profileButton: some View {
        Button(action: {
        }, label: {
            HStack {
                let fullname = user.fullname
                if user.profileImageUrl == "" {
                    let start = String(fullname!.prefix(2))
                    Text(start)
                        .font(.system(size: 12, weight: .semibold))
                        .frame(width: 22, height: 22)
                        .padding(4)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                        .foregroundColor(Color("TextColor"))
                    
                } else {
                    KFImage(URL(string: user.profileImageUrl!))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .background(Color("TintColor"))
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                }
                Text(fullname!)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Color("TextColor"))
            }
        })
    }
    
}
