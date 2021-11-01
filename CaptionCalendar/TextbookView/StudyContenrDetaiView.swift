//
//  StudyContenrDetaiView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/18.
//

import SwiftUI

struct StudyContenrDetaiView: View {
    @State private var number1 = 10
    @State private var number2 = 10
//    @State private var selected = false
    @State private var isShowAlert = false
    @State private var isShowTimerAlert = false
    @State private var isShowNext = false
    @Binding var showStudyView: Bool
    @Binding var showQuestion: Bool
    let content: Textbook
    let user: User
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 0) {
                
                //Header
                HStack {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 10) {
                        HStack {
                            Spacer()
                            Text(content.title!).bold().font(.system(size: 18))
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            if content.choice2_1 == "" {
                                Text("全1問")
                            } else {
                                Text("全2問")
                            }
                            Text("/")
                            Text("\(content.timer!) seconds")
                        }.foregroundColor(.primary).font(.caption)
                    }.frame(width: getScreenBounds().width*2/3)
                    Spacer()
                    TimerView(isShowAlert: $isShowTimerAlert, isShowNext: $isShowNext, timer: content.timer!)
                        .padding(.horizontal)
                }.padding(.horizontal)
                Divider().padding(.top, 5)
                
                //QuestionView
                ScrollView(showsIndicators: false) {
                    VStack {
                        VStack(alignment: .leading, spacing: 12) {
                            if content.questionTop != "" {
                                Text(content.questionTop!)
                            }
                            if content.question != "" {
                                Text(content.question!.replacingOccurrences(of: "\\n", with: "\n")).bold().padding(.leading)
                            }
                            if content.questionBottom != "" {
                                Text(content.questionBottom!)
                            }
                        }.padding(.top)
    //                    Divider()
                        VStack(alignment: .leading, spacing: 12) {
                            if content.choice2_1 != "" {
                                Text("問1").bold()
                            }
                            Text(content.questionTop1!)
                            Text(content.question1!.replacingOccurrences(of: "\\n", with: "\n")).bold().padding(.leading)
                            Text(content.questionBottom1!)
                        }.padding(.top)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 10) {
                                VStack(spacing: 12) {
                                    ForEach(0..<content.choice1!) { num in
                                        CheckBox(answer: $number1, number: num).frame(height: 20)
                                    }
                                }
    //                            Text("\(number1)")
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("A").bold().frame(height: 20)
                                    Text("B").bold().frame(height: 20)
                                    Text("C").bold().frame(height: 20)
                                    Text("D").bold().frame(height: 20)
                                    if content.choice1_5 != ""{
                                        Text("E").bold().frame(height: 20)
                                    }
                                    if content.choice1_6 != ""{
                                        Text("F").bold().frame(height: 20)
                                    }
                                    if content.choice1_7 != ""{
                                        Text("G").bold().frame(height: 20)
                                    }
                                    if content.choice1_8 != ""{
                                        Text("H").bold().frame(height: 20)
                                    }
                                    if content.choice1_9 != ""{
                                        Text("I").bold().frame(height: 20)
                                    }
                                    if content.choice1_10 != ""{
                                        Text("J").bold().frame(height: 20)
                                    }
                                }
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(content.choice1_1!).bold().frame(height: 20)
                                    Text(content.choice1_2!).bold().frame(height: 20)
                                    Text(content.choice1_3!).bold().frame(height: 20)
                                    Text(content.choice1_4!).bold().frame(height: 20)
                                    if content.choice1_5 != ""{
                                        Text(content.choice1_5!).bold().frame(height: 20)
                                    }
                                    if content.choice1_6 != ""{
                                        Text(content.choice1_6!).bold().frame(height: 20)
                                    }
                                    if content.choice1_7 != ""{
                                        Text(content.choice1_7!).bold().frame(height: 20)
                                    }
                                    if content.choice1_8 != ""{
                                        Text(content.choice1_8!).bold().frame(height: 20)
                                    }
                                    if content.choice1_9 != ""{
                                        Text(content.choice1_9!).bold().frame(height: 20)
                                    }
                                    if content.choice1_10 != ""{
                                        Text(content.choice1_10!).bold().frame(height: 20)
                                    }
                                }.padding(.leading)
                                Spacer()
                            }
                        }.padding(.leading)
                        
                        if content.choice2_1 != "" {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("問2").bold()
                                Text(content.questionTop2!)
                                Text(content.question2!.replacingOccurrences(of: "\\n", with: "\n")).bold().padding(.leading)
                                Text(content.questionBottom2!)
                                HStack(spacing: 10) {
                                    VStack(spacing: 12) {
                                        ForEach(0..<content.choice2!) { num in
                                            CheckBox(answer: $number2, number: num).frame(height: 20)
                                        }
                                    }
    //                                Text("\(number2)")
                                    VStack(alignment: .leading, spacing: 12) {
                                        Text("A").bold().frame(height: 20)
                                        Text("B").bold().frame(height: 20)
                                        Text("C").bold().frame(height: 20)
                                        Text("D").bold().frame(height: 20)
                                        if content.choice2_5 != ""{
                                            Text("E").bold().frame(height: 20)
                                        }
                                        if content.choice2_6 != ""{
                                            Text("F").bold().frame(height: 20)
                                        }
                                        if content.choice2_7 != ""{
                                            Text("G").bold().frame(height: 20)
                                        }
                                        if content.choice2_8 != ""{
                                            Text("H").bold().frame(height: 20)
                                        }
                                        if content.choice2_9 != ""{
                                            Text("I").bold().frame(height: 20)
                                        }
                                        if content.choice2_10 != ""{
                                            Text("J").bold().frame(height: 20)
                                        }
                                    }
                                    VStack(alignment: .leading, spacing: 12) {
                                        Text(content.choice2_1!).bold().frame(height: 20)
                                        Text(content.choice2_2!).bold().frame(height: 20)
                                        Text(content.choice2_3!).bold().frame(height: 20)
                                        Text(content.choice2_4!).bold().frame(height: 20)
                                        if content.choice2_5 != ""{
                                            Text(content.choice2_5!).bold().frame(height: 20)
                                        }
                                        if content.choice2_6 != ""{
                                            Text(content.choice2_6!).bold().frame(height: 20)
                                        }
                                        if content.choice2_7 != ""{
                                            Text(content.choice2_7!).bold().frame(height: 20)
                                        }
                                        if content.choice2_8 != ""{
                                            Text(content.choice2_8!).bold().frame(height: 20)
                                        }
                                        if content.choice2_9 != ""{
                                            Text(content.choice2_9!).bold().frame(height: 20)
                                        }
                                        if content.choice2_10 != ""{
                                            Text(content.choice2_10!).bold().frame(height: 20)
                                        }
                                    }.padding(.leading)
                                    Spacer()
                                }.padding(.horizontal)
                            }.padding(.top, 50)
                        }
                        Spacer()
                    }.padding(.horizontal)
                    //TestAD
//                    AdView(adUnitID: "ca-app-pub-3940256099942544/2934735716")
                    
                    AdView(adUnitID: "ca-app-pub-6537638223494633/7573779906")
                        .frame(width: UIScreen.main.bounds.width,
                               height: UIScreen.main.bounds.width*5/32)
                        .padding(.top, 80)
                }
            }
            
            if number1 == 10 {
                Button(action: { isShowAlert.toggle() }, label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color("TintColor"))
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .padding(15)
                })
                    .background(Color.gray)
                    .cornerRadius(26)
                    .padding()
            } else if number2 == 10 && content.choice2_1 != "" {
                Button(action: { isShowAlert.toggle() }, label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color("TintColor"))
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .padding(15)
                })
                    .background(Color.gray)
                    .cornerRadius(26)
                    .padding()
            }
            else {
                Button(action: { isShowNext.toggle() }, label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color("TintColor"))
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .padding(15)
                })
                    .background(Color("CaptionColor"))
                    .cornerRadius(26)
                    .padding()
            }
            
        }.alert(isPresented: $isShowAlert) {
            Alert(title: Text(""), message: Text("設問の答えをクリックしてください。"), dismissButton: .destructive(Text("OK")))
        }
        .alert(isPresented: $isShowTimerAlert) {
            Alert(title: Text(""), message: Text("制限時間になりました。"), dismissButton: .destructive(Text("OK")))
        }
        NavigationLink(destination: CommentaryView(showStudyView: $showStudyView, showQuestion: $showQuestion, answer1: $number1, answer2: $number2, content: content, user: user), isActive: $isShowNext) {}
    }
}

