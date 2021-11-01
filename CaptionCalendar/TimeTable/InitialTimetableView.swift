//
//  TimetableInitialView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/08.
//

import SwiftUI
import Firebase

struct InitialTimetableView: View {
    @State var count: Int = 1
    @State var time = Timer.publish(every: 1,on: .main, in: .common).autoconnect()
    @Binding var showingNotification: Bool
    let user: User
    var body: some View {
        if showingNotification && user.usedTmetable == false {
            ZStack {
                Color("TintColor")
                VStack(alignment: .center, spacing: 8) {
                    ZStack {
                        Color.white
                        VStack {
                            if count == 1 {
                                Image(systemName: "square.grid.3x3")
                                    .font(.system(size: 30))
                            } else if count == 2 {
                                Image(systemName: "square.grid.3x3.topmiddle.filled")
                                    .font(.system(size: 30))
                            } else if count == 3 {
                                Image(systemName: "square.grid.3x3.bottomleft.filled")
                                    .font(.system(size: 30))
                            } else {
                                Image(systemName: "square.grid.3x3.middleright.filled")
                                    .font(.system(size: 30))
                            }
                            
                            Text("TimeTable")
                                .font(.system(size: 11))
//                            Text("\(count)")
//                                .padding(.top, )
                        }.padding()
                            .foregroundColor(Color.black)
                    }.frame(height: 85)
                    Divider().padding(.top, -8)
                    VStack {
                        Text("TIMETABLE")
                            .bold()
                            .font(.system(size: 18))
                            .foregroundColor(Color("TextColor"))
                            .padding(.bottom, 8)
                            .frame(alignment: .center)
                        Text("数日から数週間で時間割が登録されます。")
                            .font(.system(size: 12))
                            .foregroundColor(.primary)
                            .frame(alignment: .center)
                        Text("自分で時間割を作ることもできます。")
                            .font(.system(size: 12))
                            .foregroundColor(.primary)
                            .frame(alignment: .center)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 8)
                    Divider()
                    Button (action: {
                        notificationNewUniversity()
                        showTimetableView()
                    }, label: {
                        Text("始める")
                            .bold()
                            .font(.system(size: 16))
                            .padding(8)
                            .padding(.bottom, 5)
                    })
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 0.2)
                )
                .background(Color("TextColor").opacity(0.1))
                .cornerRadius(20)
                .frame(width: getScreenBounds().width*2/3, alignment: .center)
            }
            .onReceive(self.time) { (_) in
                if count % 4 == 0 {
                    self.count = 1
                } else {
                    self.count += 1
                }
            }
        } else if user.usedTmetable == false {
            ZStack {
                Color("TintColor")
                VStack(alignment: .center, spacing: 8) {
                    ZStack {
                        Color.white
                        VStack {
                            if count == 1 {
                                Image(systemName: "square.grid.3x3")
                                    .font(.system(size: 30))
                            } else if count == 2 {
                                Image(systemName: "square.grid.3x3.topmiddle.filled")
                                    .font(.system(size: 30))
                            } else if count == 3 {
                                Image(systemName: "square.grid.3x3.bottomleft.filled")
                                    .font(.system(size: 30))
                            } else {
                                Image(systemName: "square.grid.3x3.middleright.filled")
                                    .font(.system(size: 30))
                            }
                            
                            Text("TimeTable")
                                .font(.system(size: 11))
                        }.padding()
                            .foregroundColor(Color.black)
                    }.frame(height: 85)
                    VStack {
                        Text("TIMETABLE")
                            .bold()
                            .font(.system(size: 18))
                            .foregroundColor(Color("TextColor"))
                            .padding(.bottom, 8)
                            .frame(alignment: .center)
                        Text("あなたの大学のシラバスは登録されています。")
                            .font(.system(size: 12))
                            .foregroundColor(.primary)
                            .frame(alignment: .center)
                        Text("時間割を作成してみましょう。")
                            .font(.system(size: 12))
                            .foregroundColor(.primary)
                            .frame(alignment: .center)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 8)
                    Divider()
                    Button (action: {
                        showTimetableView()
                    }, label: {
                        Text("始める")
                            .bold()
                            .font(.system(size: 16))
                            .padding(8)
                            .padding(.bottom, 5)
                    })
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 0.2)
                )
                .background(Color("TextColor").opacity(0.1))
                .cornerRadius(20)
                .frame(width: getScreenBounds().width*2/3, alignment: .center)
            }
            .onReceive(self.time) { (_) in
                if count % 4 == 0 {
                    self.count = 1
                } else {
                    self.count += 1
                }
            }
        }
    }
    func showTimetableView() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let data = ["usedTmetable": true]
        let dogRef = COLLECTION_USERS.document(user.id!)
        dogRef.updateData(data) { _ in
            AuthViewModel.shared.fetchUserSetting()
        }
    }
    func notificationNewUniversity() {
        let dogRef = COLLECTION_REPORT.document()
        let data = ["university": user.university!,
                    "uid": user.uid!,
                    "fullname": user.fullname!,
                    "content": "\(user.university!)の登録がされました。シラバスの作成をしてください。",
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        dogRef.setData(data) { _ in
        }
    }
}
