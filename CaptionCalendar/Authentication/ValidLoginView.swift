//
//  ValidLoginView.swift
//  ValidLoginView
//
//  Created by 髙間洋平 on 2021/08/21.
//

import SwiftUI
import FirebaseAuth

struct ValidLoginView: View {
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
                    isShowingLogin = false
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
                Text("登録したメールアドレスに届いているURLをクリックすることでログインすることができます。")
                    .font(.caption)
                    .padding(.horizontal)
            }
            .padding(.bottom, UIScreen.main.bounds.height/4)
            
            
            
        }
    }
    
    private func signIn() {
            Auth.auth().signIn(withEmail: self.mailAddress, password: self.password) { authResult, error in
                viewModel.signin(result: authResult)
            }
        }
}
