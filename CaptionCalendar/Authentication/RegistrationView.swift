//
//  RegistrationView.swift
//  RegistrationView
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct RegistrationView: View {
//    @State var email = ""
//    @State var password = ""
//    @State var errormessage = ""
    @State private var mailAddress = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var fullname = ""
    @State private var isShowAlert = false
    @State private var isError = false
    @State private var isShowingLogin = false
    @State private var isShowingBackground = false
    @State private var errorMessage = ""
//    @Published var userSession: FirebaseAuth.User?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            self.backGroundColor().edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
            VStack {
                Spacer()
                VStack(spacing: 13) {
                    CustomRegistrationTextField(text: $mailAddress, placeholder: Text("Email"), imageName: "envelope")
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color(.init(white: 0, alpha: 0.05)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password　(半角英数字6-15文字)"))
                        .padding()
                        .background(Color(.init(white: 0, alpha: 0.05)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                    
                    CustomSecureField(text: $passwordConfirm, placeholder: Text("Password　確認"))
                        .padding()
                        .background(Color(.init(white: 0, alpha: 0.05)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                    
                    CustomRegistrationTextField(text: $fullname, placeholder: Text("名前"), imageName: "person")
                        .keyboardType(.namePhonePad)
                        .padding()
                        .background(Color(.init(white: 0, alpha: 0.05)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 50)
                
                Button(action: {
                    self.isShowingBackground = true
                    self.errorMessage = ""
                    if self.mailAddress.isEmpty {
                        self.errorMessage = "メールアドレスが入力されていません"
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
                    } else if self.password.compare(self.passwordConfirm) != .orderedSame {
                        self.errorMessage = "パスワードと確認パスワードが一致しません"
                        self.isError = true
                        self.isShowAlert = true
                    } else {
                        self.signUp()
//                        self.isShowingLogin = true
                    }
                }, label: {
                    Text("Sign Up")
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
                
//                Button(action: {
//
//                }, label: {
//                    Text("Sign Up せずに始める")
//                        .font(.system(size: 14, weight: .semibold))
//                        .foregroundColor(.black)
//                        .frame(width: 300, height: 50)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 25)
//                                .stroke(Color.black, lineWidth: 0.5)
//                        )
//                        .background(Color.white)
//                        .cornerRadius(25)
//                        .padding()
//                })
                
                HStack(alignment: .center) {
                    Spacer()
                    Text("登録をすることで")
                        .font(.caption)
                        .foregroundColor(.black)
                    Button(action: {
                        if let url = URL(string: "https://caption-service.com/terms.html") {
                            UIApplication.shared.open(url, options: [.universalLinksOnly: false], completionHandler: {completed in
                                print(completed)
                            })
                        }
                    }, label: {
                        Text("利用規約")
                            .font(.caption)
                            .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                    })
                    Text("に同意したことになります")
                        .font(.caption)
                        .foregroundColor(.black)
                    Spacer()
                }
            }
            
            
            if isShowingBackground {
                Color("TintColor").opacity(0.1).ignoresSafeArea()
            }
            HStack {
                NavigationLink(destination: InitialScreenView().navigationBarHidden(true), label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .padding(.leading, 10)
                })
                Spacer()
            }.padding(.horizontal)
        }
    }
    
    func signUp() {
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
                    viewModel.registerUser(email: mailAddress ,password: password, fullname: fullname, result: authResult)
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
