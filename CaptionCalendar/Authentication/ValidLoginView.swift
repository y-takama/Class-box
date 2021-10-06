//
//  ValidLoginView.swift
//  ValidLoginView
//
//  Created by 髙間洋平 on 2021/08/21.
//

import SwiftUI
import FirebaseAuth

struct ValidLoginView: View {
    @State private var isShowAlert = false
    @State private var isMain = false
    @Binding var mailAddress: String
    @Binding var password: String
    @Binding  var isShowingLogin: Bool
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                Button(action: {
                    self.signIn()
                    
                    //                    viewModel.login(withEmail: mailAddress, password: password)
                }, label: {
                    Text("LOG IN !!")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color.white)
                        .frame(width: 300, height: 50)
                        .background(Color(red: 104/255, green: 171/255, blue: 121/255))
                        .clipShape(Capsule())
                        .padding()
                    
                })
                    .alert(isPresented: $isMain) {
                        Alert(title: Text(""),
                              message:Text("登録が完了しました。"),
                              dismissButton: .default(Text("OK"),action: {
                            isShowingLogin = false
                        }))
                    }
                Text("登録したメールアドレスに届いているURLをクリックすることでログインすることができます")
                    .font(.caption)
                    .padding(.horizontal)
            }
            
            .padding(.bottom, UIScreen.main.bounds.height/4)
        }.alert(isPresented: $isShowAlert) {
            Alert(title: Text(""), message: Text("登録したメールアドレスに送られたURLをクリックして承認を完了してください"), dismissButton: .destructive(Text("OK")))
        }
    }
    
    private func signIn() {
        Auth.auth().signIn(withEmail: self.mailAddress, password: self.password) { authResult, error in
            if let user = authResult?.user {
                if user.isEmailVerified {
                    isMain = true
                    viewModel.signin(result: authResult)
                } else {
                    isShowAlert.toggle()
                }
            }
            
        }
    }
}
