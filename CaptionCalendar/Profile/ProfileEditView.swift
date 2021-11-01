//
//  ProfileEditView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/30.
//

import SwiftUI
import Kingfisher

struct ProfileEditView: View {
    @State var showImagePicker = false
    @State var showBackgroundImagePicker = false
    @State var showSaveAlert = false
    @State var updating = false
    @State var selectedUIImage: UIImage?
    @State var selectedBackgroundUIImage: UIImage?
    @State var image: Image?
    @State var backgroundImage: Image?
    @State private var fullnameText: String = ""
    @State private var usernameText: String = ""
    @State private var instagramText: String = ""
    @State private var instagramCommentary = false
    @State private var twitterText: String = ""
    @State private var twitterCommentar = false
    @Binding var user: User
    @ObservedObject var viewModel: EditProfileViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(user: Binding<User>){
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._fullnameText = State(initialValue: _user.wrappedValue.fullname ?? "")
        self._usernameText = State(initialValue: _user.wrappedValue.username ?? "")
        self._instagramText = State(initialValue: _user.wrappedValue.instagramText ?? "")
        self._twitterText = State(initialValue: _user.wrappedValue.twitterText ?? "")
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    ZStack(alignment: .bottomLeading) {
                        if let backgroundImage = backgroundImage {
                            backgroundImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: getScreenBounds().width,
                                       height: 140)
                                .clipped()
                            
                        } else {
                            if viewModel.user.backImageUrl! == "" {
                                Image("image1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: getScreenBounds().width,
                                           height: 140)
                                    .clipped()
                            } else {
                                KFImage(URL(string: viewModel.user.backImageUrl!))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: getScreenBounds().width,
                                           height: 140)
                                    .clipped()
                            }
                        }
                        HStack(spacing: 20) {
                            
                            Button(action: {
                                showImagePicker.toggle()
                            }, label: {
                                ZStack(alignment: .bottomTrailing) {
                                    if let image = image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .clipped()
                                            .cornerRadius(30)
                                    } else {
                                        if viewModel.user.profileImageUrl! == "" {
                                            let username = user.fullname
                                            let start = String(username!.prefix(2))
                                            ZStack {
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
                                            }
                                        } else {
                                            KFImage(URL(string: viewModel.user.profileImageUrl!))
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 60, height: 60)
                                                .background(Color("TintColor"))
                                                .clipShape(Circle())
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 60)
                                                        .stroke(Color.blue, lineWidth: 0.8)
                                                )
                                        }
                                    }
                                }
                            })
                            
                            .padding(.leading, 20)
                            VStack(alignment: .leading, spacing: 5) {
                                ZStack {
                                    
                                    if user.fullname == "" {
                                        Text("名前は設定されていません")
                                    } else {
                                        Text(user.fullname!)
                                            .bold()
                                            .foregroundColor(Color.black)
                                    }
                                }
                                
                                Text(user.uid!)
                                    .foregroundColor(Color.gray)
                                    .modifier(SecondaryCaptionTextStyle())
                                
                            }
                            Spacer()
                            VStack {
                                Spacer()
                                Button(action: { showBackgroundImagePicker.toggle() }, label: {
                                    Image(systemName: "plus.app.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color.blue)
                                        .padding(.trailing, 20)
                                }).sheet(isPresented: $showBackgroundImagePicker, onDismiss: loadBackgroundImage, content: {
                                    ImagePicker(image: $selectedBackgroundUIImage)
                                })
                            }
                            
                            
                        }
                        .frame(width: getScreenBounds().width,
                                height: 55)
                        .padding(.bottom)
                    }
                    
                    VStack(alignment: .leading, spacing: 18) {
                        HStack(spacing: 9) {
                            HStack {
                                Image(systemName: "person")
                                    .font(.system(size: 16))
                                    .frame(width: 20)
                                Text("Name")
                                    .bold()
                                    .font(.system(size: 14))
                                Spacer()
                            }.frame(width: getScreenBounds().width*2/5)
                            TextField("name", text: $fullnameText)
                                .foregroundColor(Color.blue)
                                .font(.system(size: 14))
    //                            .bold()
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
                            }.frame(width: getScreenBounds().width*2/5)
                            TextField("ID", text: $usernameText)
                                .foregroundColor(Color.blue)
                                .font(.system(size: 14))
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
                            }.frame(width: getScreenBounds().width*2/5)
                            Text(user.userStats!)
                                .font(.system(size: 12))
                                .foregroundColor(Color.gray)
                            Spacer()
                            
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
                                }.frame(width: getScreenBounds().width*2/5)
                                Text(user.university!)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
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
                                }.frame(width: getScreenBounds().width*2/5)
                                Text(user.campus!)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
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
                            }.frame(width: getScreenBounds().width*2/5)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                Text(user.email)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }.padding(20)
                    
                    VStack(alignment: .leading, spacing: 18) {
                        HStack(spacing: 9) {
                            HStack {
                                Image("instagram_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .clipped()
                                
                                Text("Instagram")
                                    .bold()
                                    .font(.system(size: 14))
    //
                                Spacer()
                            }.frame(width: getScreenBounds().width*2/5)
                            TextField("ユーザーネーム", text: $instagramText)
                                .foregroundColor(Color.blue)
                                .font(.system(size: 14))
    //                            .bold()
                            Spacer()
                            Button(action: {
                                instagramCommentary.toggle()
                            }, label: {
                                Image(systemName: "exclamationmark.circle")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("TextColor"))
                            })
                        }
                        
                        if instagramCommentary {
                            VStack(alignment: .leading) {
                                Text("Instagramのユーザーネームを入力してください。")
                                    .font(.system(size: 11))
                                    .foregroundColor(.primary)
                                Text("ユーザーネームはInstagramアプリのプロフィール画面上部に表示されます。")
                                    .font(.system(size: 11))
                                    .foregroundColor(.primary)
                                Text("プロフィール画面 > プロフィールを編集 > ユーザーネーム からコピーすることができます。")
                                    .font(.system(size: 11))
                                    .foregroundColor(.primary)
                            }
                            .padding(20)
                            .background(Color("TextColor").opacity(0.1))
                            .cornerRadius(10)
                            .onTapGesture(perform: {
                                instagramCommentary.toggle()
                            })
                        }
                        
                        HStack(spacing: 9) {
                            HStack {
                                Image("twitter_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .clipped()
                                Text("Twitter")
                                    .font(.system(size: 14))
                                    .bold()
                                Spacer()
                            }.frame(width: getScreenBounds().width*2/5)
                            TextField("ユーザー名 / @...", text: $twitterText)
                                .foregroundColor(Color.blue)
                                .font(.system(size: 14))
                            Spacer()
                            Button(action: {
                                twitterCommentar.toggle()
                            }, label: {
                                Image(systemName: "exclamationmark.circle")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("TextColor"))
                            })
                        }
                        if twitterCommentar {
                            VStack(alignment: .leading) {
                                Text("Twitterのユーザー名を入力してください。")
                                    .font(.system(size: 11))
                                    .foregroundColor(.primary)
                                Text("ユーザー名は＠から始まる英数字または_で構成される名前です。")
                                    .font(.system(size: 11))
                                    .foregroundColor(.primary)
                                Text("Twitterアプリのプロフィール画面から確認することができます。")
                                    .font(.system(size: 11))
                                    .foregroundColor(.primary)
                                Text("＠以降の英数字または_で構成される名前を入力してください")
                                    .bold()
                                    .font(.system(size: 11))
                                    .foregroundColor(.primary)
                                    .padding(.top, 5)
                            }
                            .padding(20)
                            .background(Color("TextColor").opacity(0.1))
                            .cornerRadius(10)
                            .onTapGesture(perform: {
                                twitterCommentar.toggle()
                            })
                        }
                    }.padding(20)
                }
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
                .alert(isPresented: $showSaveAlert) {
                    Alert(title: Text("プロフィールの編集"),
                          message: Text("変更を保存してもよろしいてしょうか？"),
                          primaryButton: .cancel(Text("Calcel")),
                          secondaryButton: .default(Text("OK"),
                                                    action: {
                        viewModel.saveUserInfo(fullname: fullnameText, username: usernameText, instagramText: instagramText, twitterText: twitterText)
                        if let image = selectedUIImage {
                            viewModel.saveUserImage(profileImage: image)
                        }
                        if let backgroundimage = selectedBackgroundUIImage {
                            viewModel.saveBackImage(backImage: backgroundimage)
                        }
                        self.updating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.updating = false
                            mode.wrappedValue.dismiss()
                        }
                    }))
                }
                if updating {
                    ZStack {
                        Color.clear.ignoresSafeArea(.all)
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("CaptionColor")))
                            .scaleEffect(1)
                    }
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedUIImage)
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("編集")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: backButton, trailing: saveButton)
    }
    
    var backButton: some View {
        Button(action: {
            mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.backward")
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }
    var saveButton: some View {
        Button(action: {
            showSaveAlert.toggle()
        }, label: {
            Text("保存")
                .font(.system(size: 15))
                .foregroundColor(Color("TextColor"))
        })
    }
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    func loadBackgroundImage() {
        guard let selectedImage = selectedBackgroundUIImage else { return }
        backgroundImage = Image(uiImage: selectedImage)
    }
}
