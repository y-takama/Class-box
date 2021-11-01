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
    @State private var coveredScreen = false
    @State private var isfalse = false
    @Binding var mailAddress: String
    @Binding var password: String
    @Binding var isShowingLogin: Bool
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Button(action: {
                        coveredScreen = true
                        signIn()
                    }, label: {
                        Text("LOG IN !!")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color.white)
                            .frame(width: 300, height: 50)
                            .background(Color(red: 104/255, green: 171/255, blue: 121/255))
                            .clipShape(Capsule())
                            .padding()
                    })
                    Text("登録したメールアドレスに届いているURLをクリックすることでログインすることができます")
                        .font(.caption)
                        .foregroundColor(Color.black)
                        .padding(.horizontal, 70)
                        .padding(.bottom, 70)
                    
                }.padding(.bottom, UIScreen.main.bounds.height/4)
                
                if coveredScreen {
                    Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
                }
                
                NavigationLink(destination: {
                    DifferentLoginView()
                }, label: {
                    Text("メールが届かない場合はこちら")
                        .foregroundColor(.gray)
                        .bold().font(.caption)
                        .padding()
                })
            }.navigationBarHidden(true)
        }
        .alert(isPresented: $isShowAlert) {
            Alert(title: Text(""), message: Text("登録したメールアドレスに送られたURLをクリックして承認を完了してください"), dismissButton: .default(Text("OK"),action: {
                coveredScreen = false
                isfalse = false
                isShowAlert = false
            }))
        }
    }
    
    func signIn() {
        Auth.auth().signIn(withEmail: self.mailAddress, password: self.password) { authResult, error in
            if let user = authResult?.user {
                if user.isEmailVerified {
                    isShowingLogin = false
                    viewModel.signin(result: authResult)
                } else {
                    isShowAlert = true
                }
            }
        }
    }
}
