//
//  SideMenu.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/08.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    @State private var logoutButton = false
    let user: User
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 8) {
                        VStack(spacing: 5) {
                            Image(systemName: "shippingbox")
                                .font(Font.system(size: 45, weight: .bold))
                            Text("Class-box")
                                .bold()
                                .fontWeight(.black)
                                .font(.system(size: 25))
                        }
                        .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                        .padding(.bottom)
                        .padding(.trailing, 25)
                        .padding(.top, UIScreen.main.bounds.height/15)
                        
                        SideMenuHeaderView(user: user)
                        Divider()
                        SideMenuTabView()
                        Divider()
                        SideMenuButtomView()
                        Divider()
                        Button(action: {
                            logoutButton.toggle()
                        }, label: {
                            HStack(spacing: 16) {
                                Image(systemName: "arrow.backward.square")
                                    .font(.system(size: 20))
                                    .frame(width: 24)
                                Text("ログアウト")
                                    .font(.system(size: 15))
                                    .bold()
                                Spacer()
                            }
                            .frame(width: UIScreen.main.bounds.width-90,height: 45)
                            .foregroundColor(.red)
                            .padding(.vertical)
                        }).alert(isPresented: $logoutButton) {
                            Alert(title: Text("ログアウト"),
                                  message: Text("ログアウトしてもよろしいてすか？"),
                                  primaryButton: .cancel(Text("Calcel")),
                                  secondaryButton: .default(Text("OK"),
                                                            action: {
                                                                AuthViewModel.shared.signOut()
                                                            }))
                        }
                        VStack {
                            HStack {
                                Text("2021 Class-box")
                                    .font(.caption)
                                Spacer()
                            }
                            HStack {
                                Text("Version 0.0.1  Build 1.0.5")
                                    .font(.caption)
                                Spacer()
                            }
                        }.padding(.vertical)
                    }
                    
                }.padding(.leading, 30)
                VStack(spacing: 0) {
                    Divider()
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            Image("")
                                .frame(width: 22, height: 22)
                        })
                    }
                    .padding([.horizontal, .top], 27)
                    .foregroundColor(.primary)
                }
            }
            .padding(.top)
            .frame(width: getRect().width - 90)
            .frame(maxHeight: .infinity)
            .background(Color.primary.opacity(0.04).ignoresSafeArea(.container, edges: .vertical))
            .frame(maxWidth: .infinity, alignment: .leading)
            .ignoresSafeArea(edges: .top)
            .navigationBarHidden(true)
        }
        
    }
}
extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}
