//
//  LoginView.swift
//  LoginView
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State private var errorMessage = ""
//    @State private var isSignedIn = false
    @State private var isShowAlert = false
    @State private var isError = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            self.backGroundColor().edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
            VStack {
                Spacer()
                Image(systemName: "shippingbox")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/4,
                           height: UIScreen.main.bounds.width/4)
                    .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                    .padding(.top)
                Text("Classbox")
                    .fontWeight(.black)
                    .font(.system(size: 25))
                    .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                Spacer()
                
                VStack(spacing: 20) {
                    CustomRegistrationTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 0, alpha: 0.05)))
//                        .background(Color("TextColor").opacity(0.1))
                        .cornerRadius(10)
                        .foregroundColor(Color.black)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 0, alpha: 0.05)))
//                        .background(Color("TextColor").opacity(0.1))
                        .cornerRadius(10)
                        .foregroundColor(Color.black)
                }
                .padding(.horizontal, 32)
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.black)
                            .padding(.top, 16)
                            .padding(.trailing, 32)
                    })
                }
                
                Button(action: {
                    self.errorMessage = ""
                    if self.email.isEmpty {
                        self.errorMessage = "メールアドレスが入力されていません"
                        self.isError = true
                        self.isShowAlert = true
                    } else if self.password.isEmpty {
                        self.errorMessage = "パスワードが入力されていません"
                        self.isError = true
                        self.isShowAlert = true
                    } else {
//                        viewModel.login(withEmail: email, password: password)
                        self.signIn()
                    }
                    
                    //                        AuthViewModel.shared.signOut()
                }, label: {
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color.white)
//                        .foregroundColor(Color(red: 240/255, green: 236/255, blue: 228/255))
                        .frame(width: 300, height: 50)
                        .background(Color(red: 104/255, green: 171/255, blue: 121/255))
                        .clipShape(Capsule())
                        .padding()
                })
                    .alert(isPresented: $isShowAlert) {
                        if self.isError {
                            return Alert(title: Text(""), message: Text(self.errorMessage), dismissButton: .destructive(Text("OK"))
                            )
                        } else {
                            return Alert(title: Text(""), message: Text("ログインしました"), dismissButton: .default(Text("OK")))
                        }
                    }
                Spacer()
                
                NavigationLink(destination: InitialScreenView().navigationBarHidden(true), label: {
                    Text("Back")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                })
            }
        }
    }
    
    private func backGroundColor() -> LinearGradient {
        let start = UnitPoint.init(x: 0, y: 1)
        let end = UnitPoint.init(x: 1, y: 0)
        let colors = Gradient(colors: [Color(red: 255/255, green: 255/255, blue: 255/255), Color(red: 255/255, green: 255/255, blue: 255/255)])
        let gradientColor = LinearGradient(gradient: colors, startPoint: start, endPoint: end)
        return gradientColor
    }
    
    private func signIn() {
            Auth.auth().signIn(withEmail: self.email, password: self.password) { authResult, error in
                if let error = error as NSError?, let errorCode = AuthErrorCode(rawValue: error.code) {
                    switch errorCode {
                    case .invalidEmail:
                        self.errorMessage = "メールアドレスの形式が正しくありません"
                    case .userNotFound, .wrongPassword:
                        self.errorMessage = "メールアドレス、またはパスワードが間違っています"
                    case .userDisabled:
                        self.errorMessage = "このユーザーアカウントは無効化されています"
                    default:
                        self.errorMessage = error.domain
                    }
                    
                    self.isError = true
                    self.isShowAlert = true
                    return
                }
                viewModel.signin(result: authResult)
            }
        }

}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
