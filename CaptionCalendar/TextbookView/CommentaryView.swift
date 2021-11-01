//
//  Commentary View.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/19.
//

import SwiftUI
import GoogleMobileAds

struct CommentaryView: View {
    @State private var isShowingNext = false
    @State private var isShowingNextPart = false
    @State private var isShowingReportView = false
    @State private var useranswer1 = false
    @State private var useranswer2 = false
    @Binding var showStudyView: Bool
    @Binding var showQuestion: Bool
    @Binding var answer1: Int
    @Binding var answer2: Int
    private var fullScreenAd: Interstitial?
    let content: Textbook
    let user: User
    
    init(showStudyView: Binding<Bool>,
         showQuestion: Binding<Bool>,
         answer1: Binding<Int>,
         answer2: Binding<Int>,
         content: Textbook,
         user: User) {
        self._showStudyView = showStudyView
        self._showQuestion = showQuestion
        self._answer1 = answer1
        self._answer2 = answer2
        self.content = content
        self.user = user
        fullScreenAd = Interstitial()
        }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 20) {
                        Text("問1").frame(width: 30)
                        if content.answer1! - 1 == answer1 {
                            Text("正解").bold().onAppear(perform: {
                                useranswer1 = true
                            })
                        } else {
                            Text("不正解").bold()
                        }
                        Spacer()
                    }
                    if answer2 != 10 {
                        HStack(spacing: 20) {
                            Text("問2").frame(width: 30)
                            if content.answer2! - 1 == answer2 {
                                Text("正解").bold().onAppear(perform: {
                                    useranswer2 = true
                                })
                            } else {
                                Text("不正解").bold()
                            }
                            Spacer()
                        }
                    }
                    Divider()
                    Text("解説").bold()
                }.padding()
                //TestAD
//                AdView(adUnitID: "ca-app-pub-3940256099942544/2934735716")
                
                AdView(adUnitID: "ca-app-pub-6537638223494633/8236867147")
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.width*5/16)
                    .padding(.top, 80)
            }
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("後で確認する")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color("TextColor"))
                        .frame(width: getScreenBounds().width/3, height: 50)
                        .background(Color("TintColor"))
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color("TextColor"), lineWidth: 0.5)
                        )
                        .padding(.horizontal)
                })
                Spacer()
                if content.nextID! == "" {
                    Button(action: {
                        registration()
                        showStudyView = false
                    }, label: {
                        Text("次の章へ")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color("TintColor"))
                            .frame(width: getScreenBounds().width/3, height: 50)
                            .background(Color("TextColor"))
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                            .padding(.horizontal)
                    })
                } else {
                    Button(action: {
                        registration()
                        isShowingNext.toggle()
                    }, label: {
                        Text("次へ")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color("TintColor"))
                            .frame(width: getScreenBounds().width/3, height: 50)
                            .background(Color("TextColor"))
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                            .padding(.horizontal)
                    })
                }
                Spacer()
            }.padding()
            VStack {
                Spacer()
                ZStack {
                    StudyReportView(showMenu: $isShowingReportView, user: user)
                        .offset(y: self.isShowingReportView ? 0 : UIScreen.main.bounds.height)
                }
            }
            .background((self.isShowingReportView  ? Color("TextColor").opacity(0.2) : Color.clear)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                self.isShowingReportView = false
            })
            .ignoresSafeArea(edges: .bottom)
            .animation(.default)
        }
        .navigationBarItems(trailing: HStack(spacing: 10){
            endButton
            reportButton
        })
        NavigationLink(destination: NextQuestionView(showStudyView: $showStudyView, showQuestion: $showQuestion, viewModel: StudyNextContentView(detail: content), content: content, user: user).navigationBarBackButtonHidden(true), isActive: $isShowingNext) {}
    }
    var reportButton: some View {
        Button(action: {
            isShowingReportView.toggle()
        }, label: {
            Image(systemName: "exclamationmark.circle")
                .font(Font.system(size: 16, weight: .bold))
                .foregroundColor(Color("TextColor"))
        })
    }
    var endButton: some View {
        Button(action: {
            registration()
            fullScreenAd?.showAd()
            showQuestion = false
        }, label: {
            Image(systemName: "multiply.circle")
                .font(Font.system(size: 16, weight: .bold))
                .foregroundColor(Color("TextColor"))
        })
    }
    func registration() {
        let docRef = COLLECTION_USERS.document(user.uid!).collection("textbook").document(content.textbookID!).collection(content.courseID!).document(content.questionID!)
        let data = ["textbookID": content.textbookID!,
                    "courseID": content.courseID!,
                    "questionID": content.questionID!,
                    "useranswer1": useranswer1,
                    "useranswer2": useranswer2] as [String : Any]
        docRef.setData(data){ _ in
        }
    }
}
