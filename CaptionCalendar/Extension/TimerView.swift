//
//  TimerView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/20.
//

import SwiftUI

struct TimerView: View {
    @State var start = false
    
    @State var to: CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1,on: .main, in: .common).autoconnect()
    @Binding var isShowAlert: Bool
    @Binding var isShowNext: Bool
    let timer: Int
    var body: some View {
        ZStack {
//            Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
            ZStack {
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color("TextColor").opacity(0.05), style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .frame(width: 40, height: 40)
                Circle()
                    .trim(from: 0, to: self.to)
                    .stroke(Color("CaptionColor"), style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .frame(width: 40, height: 40)
                
            }
            .rotationEffect(.init(degrees: -90))
            .frame(width: 50, height: 50)
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text(""), message: Text("制限時間になりました。"), dismissButton: .destructive(Text("OK")))
            }
            Text("\(count)").foregroundColor(.primary).font(.caption)
        }.onReceive(self.time) { (_) in
            if self.count != timer {
                self.count += 1
//                print("Hello")
                withAnimation(.default) {
                    self.to = CGFloat(self.count) / CGFloat(timer)
                }
            } else {
                withAnimation(.default) {
                    if self.count == timer && isShowNext == false {
                        ShowAlert()
                        self.count += 1
                    } else {
                        self.count += 1
//                        self.to = 0
                        
                    }
                }
            }
        }
    }
    func ShowAlert() {
        isShowAlert = true
    }
}
