//
//  NotificationMainView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/05.
//

import SwiftUI

struct NotificationMainView: View {
    @State var post = false
    @Binding var notificationButton: Bool
    @ObservedObject var viewModel = NotificationViewModel()
    let user: User
    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 0) {
                    ScrollView {
                        VStack {
                            ForEach(viewModel.notification) { notification in
                                NavigationLink(destination: {
                                    NotificationDetailView(notification: notification)
                                }, label: {
                                    NotificationCell(notification: notification)
                                })
                                
                                Divider()
                            }
                        }.padding(.top)
                        
                    }
                    //TestAD
//                    AdView(adUnitID: "ca-app-pub-3940256099942544/2934735716")
                    
                    AdView(adUnitID: "ca-app-pub-6537638223494633/8896214833")
                        .frame(width: UIScreen.main.bounds.width,
                               height: UIScreen.main.bounds.width*5/32,
                               alignment: .bottom)
                        .ignoresSafeArea()
                }
                .navigationTitle("お知らせ")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: user.admin! == "0" ? postButton : nil, trailing: backButton)
            }
            if viewModel.loading {
                ZStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("CaptionColor")))
                        .scaleEffect(1)
                }
            }
        }
        
        .fullScreenCover(isPresented: $post) {
            NotificationPostView(user: user, post: $post)
        }
    }
    var backButton: some View {
        Button(action: {
            withAnimation() {
                notificationButton = false
            }
        }, label: {
            Image(systemName: "multiply.circle.fill")
                .font(Font.system(size: 16, weight: .semibold))
                .foregroundColor(Color("TextColor"))
        })
    }
    var postButton: some View {
        Button(action: {
            post.toggle()
        }, label: {
            Image(systemName: "pencil.circle")
                .font(Font.system(size: 16, weight: .semibold))
                .foregroundColor(Color("TextColor"))
        })
    }
}
