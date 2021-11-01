//
//  StudentFirstRegistrationView.swift
//  StudentFirstRegistrationView
//
//  Created by 髙間洋平 on 2021/08/20.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct StudentThirdRegistrationView: View {
    @State private var mailAddress = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var fullname = ""
    @State private var isShowAlert = false
    @State private var isError = false
    @State private var isShowingLogin = false
    @State private var isShowingBackground = false
//    @State private var isShowingLogin = false
    @State private var errorMessage = ""
    @Binding var universityName: String
    @Binding var campusName: String
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white.edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
                
            VStack {
                Spacer()
                VStack(spacing: 6) {
                    HStack{
                        Text(universityName)
                        Text("のメールアドレス")
                        Text("必須")
                            .font(.system(size: 10, weight: .semibold))
                            .frame(width: 30, height: 14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                        
                        Spacer()
                    }
                    CustomRegistrationTextField(text: $mailAddress, placeholder: Text("大学メールアドレス/ .ac.jp"), imageName: "envelope")
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.init(white: 0, alpha: 0.05)))
                        .cornerRadius(10)
                        .padding(.bottom)
                    
                    HStack{
                        Text("Password")
                        Text("必須")
                            .font(.system(size: 10, weight: .semibold))
                            .frame(width: 30, height: 14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                        
                        Text("※学内のパスワードは入力しないでください")
                            .font(.system(size: 10, weight: .semibold))
                        Spacer()
                    }
                    CustomSecureField(text: $password, placeholder: Text("Password　(6-15文字)"))
                        .padding()
                        .background(Color(.init(white: 0, alpha: 0.05)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .padding(.bottom)
                    CustomSecureField(text: $passwordConfirm, placeholder: Text("Password　確認"))
                        .padding()
                        .background(Color(.init(white: 0, alpha: 0.05)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .padding(.bottom)
                    HStack{
                        Text("名前")
                        Text("必須")
                            .font(.system(size: 10, weight: .semibold))
                            .frame(width: 30, height: 14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
//
//                        Text("※")
//                            .font(.system(size: 10, weight: .semibold))
                        Spacer()
                    }
                    CustomRegistrationTextField(text: $fullname, placeholder: Text("名前"), imageName: "person")
                        .keyboardType(.namePhonePad)
                        .padding()
                        .background(Color(.init(white: 0, alpha: 0.05)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .padding(.bottom)
                }
                .padding(.horizontal, 25)
                .padding(.top, 15)
                .foregroundColor(.black)
                
                Button(action: {
                    self.isShowingBackground = true
                    self.errorMessage = ""
                    if self.mailAddress.isEmpty {
                        self.errorMessage = "メールアドレスが入力されていません"
                        self.isError = true
                        self.isShowAlert = true
                    } else if self.mailAddress.contains("ac.jp") == false {
                        self.errorMessage = ".ac.jpドメインのメールアドレスを入力してください"
                        self.isError = true
                        self.isShowAlert = true
                    } else if self.password.isEmpty {
                        self.errorMessage = "パスワードが入力されていません"
                        self.isError = true
                        self.isShowAlert = true
                    } else if self.passwordConfirm.isEmpty {
                        self.errorMessage = "確認パスワードが入力されていません"
                        self.isError = true
                        self.isShowAlert = true
                    } else if self.fullname.isEmpty {
                        self.errorMessage = "名前が入力されていません"
                        self.isError = true
                        self.isShowAlert = true
                    } else if self.password.compare(self.passwordConfirm) != .orderedSame {
                        self.errorMessage = "パスワードと確認パスワードが一致しません"
                        self.isError = true
                        self.isShowAlert = true
                    } else {
                        self.signUp()
                    }
                }, label: {
                    Text("登録")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color.white)
                        .frame(width: 300, height: 50)
                        .background(Color(red: 104/255, green: 171/255, blue: 121/255))
                        .clipShape(Capsule())
                        .padding()
                })
                    .alert(isPresented: $isShowAlert) {
                        if self.isError {
                            return Alert(title: Text(""),
                                  message: Text(self.errorMessage),
                                  dismissButton: .default(Text("OK"),
                                                          action: {
                                self.isShowingBackground = false
                            }))
                        } else {
                            return Alert(title: Text(""),
                                         message: Text("登録が完了しました。"),
                                         dismissButton: .default(Text("OK"),
                                                                 action: {
//                                self.isShowingLogin = true
                                self.isShowingBackground = false
                            }))
                        }
                    }
                
                Spacer()
                
                HStack(alignment: .center) {
                    Spacer()
                    Text("登録をすることで")
                        .font(.caption)
                    Button(action: {
                        if let url = URL(string: "https://caption-service.com/terms.html") {
                            UIApplication.shared.open(url, options: [.universalLinksOnly: false], completionHandler: {completed in
                                print(completed)
                            })
                        }
                    }, label: {
                        Text("利用規約")
                            .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                            .font(.caption)
                    })
                    Text("に同意したことになります")
                        .font(.caption)
                    Spacer()
                }
            }.foregroundColor(.black)
            
            if isShowingBackground {
                Color("TintColor").opacity(0.1).ignoresSafeArea()
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
//        .fullScreenCover(isPresented: $isShowingLogin) {
//            ValidLoginView(mailAddress: $mailAddress, password: $password, isShowingLogin: $isShowingLogin)
//        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
    }
    
    private func signUp() {
            Auth.auth().createUser(withEmail: self.mailAddress, password: self.password) { authResult, error in
                if let error = error as NSError?, let errorCode = AuthErrorCode(rawValue: error.code) {
                    switch errorCode {
                    case .invalidEmail:
                        self.errorMessage = "メールアドレスの形式が正しくありません"
                    case .emailAlreadyInUse:
                        self.errorMessage = "このメールアドレスは既に登録されています"
                    case .weakPassword:
                        self.errorMessage = "パスワードは６文字以上で入力してください"
                    default:
                        self.errorMessage = error.domain
                    }
                    
                    self.isError = true
                    self.isShowAlert = true
                }
                
                if let user = authResult?.user {
                    Auth.auth().languageCode = "ja_JP"
                    user.sendEmailVerification(completion: { error in
                        if error == nil {
                            print("Send Email Success")
                        }
                    })
                    self.isError = false
                    self.isShowAlert = true
                    viewModel.registerStudentUser(email: mailAddress,
                                                  fullname: fullname,
                                                  password: password,
                                                  university: universityName,
                                                  campus: campusName,
                                                  result: authResult)
                }
            }
        }
    private func backGroundColor() -> LinearGradient {
        let start = UnitPoint.init(x: 1, y: 1)
        let end = UnitPoint.init(x: 0, y: 0)
        let colors = Gradient(colors: [Color(red: 255/255, green: 255/255, blue: 255/255), Color(red: 255/255, green: 255/255, blue: 255/255)])
//        let colors = Gradient(colors: [Color(red: 174/255, green: 206/255, blue: 191/255), Color(red: 93/255, green: 126/255, blue: 111/255)])
        let gradientColor = LinearGradient(gradient: colors, startPoint: start, endPoint: end)
        return gradientColor
    }
}
