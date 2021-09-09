//
//  InitialScreenView.swift
//  InitialScreenView
//
//  Created by 髙間洋平 on 2021/08/18.
//

import SwiftUI

struct InitialScreenView: View {
    
    @State var currentIndex: Int = 2
    @State var titleText: [TextAnimation] = []
    @State var subTitleAnimation: Bool = false
    @State var endAnimation = false
    @State var titles = [
        "Title here",
        "Title2 here",
        "Title3 here",
    ]
    @State var subtitle = [
        "Sub Title here",
        "Sub2 Title here",
        "Sub3 Title here"
    ]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
//                self.backGroundColor().edgesIgnoringSafeArea(.all)
//                    .onTapGesture {
//                        UIApplication.shared.closeKeyboard()
//                    }
                
                
                GeometryReader { proxy in
                    let size = proxy.size
                    Color.white
                    ForEach(1...3,id: \.self) { index in
                        Image("image\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width,
                                   height: size.height)
                            .opacity(currentIndex == (index - 1) ? 1 : 0)
                    }
//                    LinearGradient(colors: [
//                        .clear,
//                        .black.opacity(0.5),
//                        .black
//                    ], startPoint: .top, endPoint: .bottom)
                }
                
                VStack(spacing: 20) {
                    
                    HStack(spacing: 0){
                        ForEach(titleText) { text in
                            Text(text.text)
                                .font(.largeTitle.bold())
                                .offset(y: text.offset)

                        }
                    }
                    .offset(y: endAnimation ? -100 : 0)
                    .opacity(endAnimation ? 0 : 1)
                    
                    
                    Text(subtitle[currentIndex])
                        .offset(y: !subTitleAnimation ? 70 : 0)
                        .offset(y: endAnimation ? -100 : 0)
                        .opacity(endAnimation ? 0 : 1)
                    
                    NavigationLink(
                        destination:
                            SelectedScreenView().navigationBarHidden(true),
                        label: {
                            VStack {
                                Text("はじめる")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.black)
                                    .frame(width: 300, height: 50)
                                    .background(Color.white)
                                    .cornerRadius(25)
//                                    .background(
//                                        .white.opacity(1)
//                                        ,in: Capsule()
//                                    )
                                    .padding(.horizontal)
                            }
                        })
//                    Button(action: {
//                        AuthViewModel.shared.signOut()
//                    }, label: {
//                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//                    })
                    
                    NavigationLink(
                        destination:
                            LoginView().navigationBarHidden(true),
                        label: {
                            VStack {
                                Text("アカウントをお持ちの方はこちら")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                    .frame(width: 300, height: 50)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 25)
//                                            .stroke(Color.black, lineWidth: 1)
//                                    )
                                    .background(Color.black.opacity(0.2))
                                    .cornerRadius(25)
//                                    .background(
//                                        .black.opacity(0.2)
//                                        ,in: Capsule()
//                                    )
                                    .padding(.horizontal)
                            }
                        })
                }
                .foregroundColor(.white)
                .padding(.bottom, 70)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                
                Image(systemName: "shippingbox")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/3,
                           height: UIScreen.main.bounds.width/3,
                           alignment: .top)
                    .foregroundColor(Color(red: 104/255, green: 171/255, blue: 121/255))
                    .padding(.top, UIScreen.main.bounds.height/4)
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
    }
    
    func getSpilitedText(text: String, completion: @escaping()->()) {
        for (index,character) in text.enumerated(){
            titleText.append(TextAnimation(text: String(character)))
            
            DispatchQueue.main.asyncAfter(deadline: .now()+Double(index)*0.03) {
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

struct InitialScreenView_Previews: PreviewProvider {
    static var previews: some View {
        InitialScreenView()
    }
}
