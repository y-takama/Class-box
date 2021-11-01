//
//  AuthEmailUpdateView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/11.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct AuthEmailUpdateView: View {
    @State private var mailAddress = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var oldPassword = ""
    @State private var isShowAlert = false
    @State private var isError = false
    @State private var isShowingLogin = false
    @State private var isShowingBackground = false
    @State private var isShowEmailUpdateAlert = false
//    @State private var isShowingLogin = false
    @State private var errorMessage = ""
    @Binding var universityName: String
    @Binding var campusName: String
    @Binding var emailUpdateView: Bool
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
                        Spacer()
                    }
                    CustomSecureField(text: $oldPassword, placeholder: Text("Password　(6-15文字)"))
                        .padding()
                        .background(Color(.init(white: 0, alpha: 0.05)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .padding(.bottom)
                }
                .padding(.horizontal, 25)
                .padding(.top, 15)
                .foregroundColor(.black)
                Spacer()
                Button(action: {
                    isShowingBackground = true
                    if self.mailAddress.isEmpty {
                        self.isShowEmailUpdateAlert = true
                        self.isError = true
                        self.errorMessage = "メールアドレスが入力されていません"
                    } else if self.mailAddress.contains("ac.jp") == false {
                        self.errorMessage = ".ac.jpドメインのメールアドレスを入力してください"
                        self.isError = true
                        self.isShowEmailUpdateAlert = true
                    } else {
                        if let user = Auth.auth().currentUser {
                            let credential = EmailAuthProvider.credential(withEmail: user.email ?? "", password: self.oldPassword)
                            user.reauthenticate(with: credential, completion: { authResult, error in
                                if error == nil {
                                    Auth.auth().currentUser?.updateEmail(to: self.mailAddress) { error in
                                        self.isShowEmailUpdateAlert = true
                                        if let error = error as NSError?, let errorCode = AuthErrorCode(rawValue: error.code) {
                                            switch errorCode {
                                            case .invalidEmail:
                                                self.errorMessage = "メールアドレスの形式が正しくありません"
                                            case .requiresRecentLogin:
                                                self.errorMessage = "登録されているメールアドレスです"
                                            default:
                                                self.errorMessage = error.localizedDescription
                                            }
                                            self.isError = true
                                        } else {
                                            self.isError = false
                                            viewModel.updateStudentUser(mailAddress: mailAddress,
                                                                        university: universityName,
                                                                        campus: campusName)
                                        }
                                    }
                                }
                            })
                        }
                        
                    }
                }, label: {
                    Text("登録")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color.white)
                        .frame(width: 300, height: 50)
                        .background(Color(red: 104/255, green: 171/255, blue: 121/255))
                        .clipShape(Capsule())
                        .padding(.horizontal)
                        .padding(.bottom, 50)
                })
                    .alert(isPresented: $isShowEmailUpdateAlert) {
                        if self.isError {
                            return Alert(title: Text(""),
                                  message: Text(self.errorMessage),
                                  dismissButton: .default(Text("OK"),
                                                          action: {
                                self.isShowingBackground = false
                            }))
                        } else {
                            return Alert(title: Text("メールアドレスの変更が完了しました。"),
                                         message: Text("学生アカウントにアップデートしました。アプリを再起動してください。"),
                                         dismissButton: .default(Text("OK"),
                                                                 action: {
                                self.isShowingBackground = false
                            }))
                        }
                    }
            }.foregroundColor(.black)
            
            if isShowingBackground {
                Color("TintColor").opacity(0.1).ignoresSafeArea()
            }
            HStack {
                if viewModel.complete {
                    Button(action: {
                        emailUpdateView = false
                    }, label: {
                        Image(systemName: "multiply.circle.fill")
                            .font(.system(size: 26))
                            .padding()
                            .foregroundColor(Color.black)
                    })
                } else {
                    Button(action: {
                        mode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward.circle.fill")
                            .font(.system(size: 26))
                            .padding()
                            .foregroundColor(Color.black)
                    })
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
    }
}
