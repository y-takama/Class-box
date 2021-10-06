//
//  SelectedScreenView.swift
//  SelectedScreenView
//
//  Created by 髙間洋平 on 2021/08/20.
//

import SwiftUI

struct SelectedScreenView: View {
    
    @State var currentIndex: Int = 1
    @State var titleText: [TextAnimation] = []
    @State var subTitleAnimation: Bool = false
    @State var endAnimation = false
    @State var titles = [
        "Standard",
        "Student"
    ]
    @State var titlesRuby = [
        "スタンダード",
        "学生向け"
    ]
    @State var subtitle = [
        "Standard では就職活動関連やTIMETABLE以外の機能(BASE)を使うことができます。",
        "学生の方は Standard より多くの機能(BASE)を使うことができます。学内のメールアドレスを登録することで利用することができます"
    ]
    var body: some View {
        ZStack(alignment: .top) {
            
            GeometryReader { proxy in
                Color.white.ignoresSafeArea(.all)
//                    if #available(iOS 15.0, *) {
//                        LinearGradient(colors: [
//                            .clear,
//                            Color(red: 104/255, green: 171/255, blue: 121/255).opacity(0.25),
//                            Color(red: 104/255, green: 171/255, blue: 121/255).opacity(0.5)
//                        ], startPoint: .top, endPoint: .bottom)
//                            .onTapGesture {
//                                UIApplication.shared.closeKeyboard()
//                            }
//                    } else {
//                    }
            }
            VStack(spacing: 20) {
                if #available(iOS 15.0, *) {
                    HStack(spacing: 0){
                        ForEach(titleText) { text in
                            Text(text.text)
                                .fontWeight(.black)
                                .font(.largeTitle)
                                .offset(y: text.offset)
                                .foregroundColor(.black)
                        }
                    }
                    .offset(y: endAnimation ? -80 : 0)
                    .opacity(endAnimation ? 0 : 1)
//                        .padding(.bottom, 20)

                    Text(subtitle[currentIndex])
                        .offset(y: !subTitleAnimation ? 100 : 0)
                        .offset(y: endAnimation ? -70 : 0)
                        .opacity(endAnimation ? 0 : 1)
                        .font(.system(size: 12, weight: .semibold))
                        .padding(.horizontal, 30)
                        .foregroundColor(.black)
                        .padding(.bottom, 40)
                } else {
                }
               
                
                NavigationLink(
                    destination:
                        StudentFirstRegistrationView().navigationBarHidden(true),
                    label: {
                        VStack {
                            Text("Student Here!")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(width: 300, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.black, lineWidth: 0.5)
                                )
                                .background(Color.white)
                                .cornerRadius(25)
//                                    .background(
//                                        .white.opacity(1)
//                                        ,in: Capsule()
//                                    )
                                .padding(.horizontal)
                        }
                    })
                Text("TIMETABLE,就活関連の機能を利用することができます")
                    .font(.system(size: 9))
                    .padding(.top, -10)
                    .foregroundColor(.black)
                
                NavigationLink(
                    destination:
                        RegistrationView().navigationBarHidden(true),
                    label: {
                        VStack {
                            Text("Standard")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(width: 300, height: 50)
                                .background(Color.black.opacity(0.2))
                                .cornerRadius(25)
//                                    .background(
//                                        .black.opacity(0.2)
//                                        ,in: Capsule()
//                                    )
                                .padding(.horizontal)
                                .padding(.bottom, 20)
                        }
                    })
                
                NavigationLink(destination: InitialScreenView().navigationBarHidden(true), label: {
                    Text("Back")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(30)
                })
            }
            .foregroundColor(.white)
//            .background(Color.red)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            currentIndex = 0
        })
        .onChange(of: currentIndex) { newValue in
            getSpilitedText(text: titles[currentIndex]){
                withAnimation(.easeInOut(duration: 1)) {
                    endAnimation.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    titleText.removeAll()
                    subTitleAnimation.toggle()
                    endAnimation.toggle()
                    withAnimation(.easeIn(duration: 0.6)){
                        if currentIndex < (titles.count - 1) {
                            currentIndex += 1
                        } else {
                            currentIndex = 0
                        }
                    }
                }
            }
        }
    }
    
    func getSpilitedText(text: String, completion: @escaping()->()) {
        for (index,character) in text.enumerated(){
            titleText.append(TextAnimation(text: String(character)))

            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    titleText[index].offset = 0
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+Double(text.count)*0.02){
            withAnimation(.easeInOut(duration: 0.5)){
                subTitleAnimation.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+5) {
                completion()
            }
            
        }
    }
}
