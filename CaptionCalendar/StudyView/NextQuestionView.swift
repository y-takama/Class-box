//
//  NextQuestionView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/19.
//

import SwiftUI

struct NextQuestionView: View {
    @State private var number1 = 10
    @State private var number2 = 10
    @State private var selected = false
    @State private var isShowAlert = false
    @State private var isShowTimerAlert = false
    @State private var isShowNext = false
    @Binding var showStudyView: Bool
    @ObservedObject var viewModel: StudyNextContentView
    let content: Study
    let user: User
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 10) {
                        HStack {
                            Spacer()
                            Text(viewModel.detail.title!).bold().font(.system(size: 18))
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            if viewModel.detail.choice2_1 == "" {
                                Text("全1問")
                            } else {
                                Text("全2問")
                            }
                            Text("/")
                            Text("\(viewModel.detail.timer!) seconds")
                        }.foregroundColor(.primary).font(.caption)
                    }.frame(width: getScreenBounds().width*2/3)
                    Spacer()
                    TimerView(isShowAlert: $isShowTimerAlert, isShowNext: $isShowNext, timer: viewModel.detail.timer!)
                        .padding(.horizontal)
                }.padding(.horizontal)
                Divider().padding(.top, 5)
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 12) {
                        if viewModel.detail.questionTop != "" {
                            Text(viewModel.detail.questionTop!)
                        }
                        if viewModel.detail.question != "" {
                            Text(viewModel.detail.question!.replacingOccurrences(of: "\\n", with: "\n")).bold().padding(.leading)
                        }
                        if viewModel.detail.questionBottom != "" {
                            Text(viewModel.detail.questionBottom!)
                        }
                    }.padding(.top)
//                    Divider()
                    VStack(alignment: .leading, spacing: 12) {
                        if viewModel.detail.choice2_1 != "" {
                            Text("問1").bold()
                        }
                        Text(viewModel.detail.questionTop1!)
                        Text(viewModel.detail.question1!.replacingOccurrences(of: "\\n", with: "\n")).bold().padding(.leading)
                        Text(viewModel.detail.questionBottom1!)
                    }.padding(.top)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 10) {
                            VStack(spacing: 12) {
                                ForEach(0..<viewModel.detail.choice1!) { num in
                                    CheckBox(answer: $number1, number: num).frame(height: 20)
                                }
                            }
//                            Text("\(number1)")
                            VStack(alignment: .leading, spacing: 12) {
                                Text("A").bold().frame(height: 20)
                                Text("B").bold().frame(height: 20)
                                Text("C").bold().frame(height: 20)
                                Text("D").bold().frame(height: 20)
                                if viewModel.detail.choice1_5 != ""{
                                    Text("E").bold().frame(height: 20)
                                }
                                if viewModel.detail.choice1_6 != ""{
                                    Text("F").bold().frame(height: 20)
                                }
                                if viewModel.detail.choice1_7 != ""{
                                    Text("G").bold().frame(height: 20)
                                }
                                if viewModel.detail.choice1_8 != ""{
                                    Text("H").bold().frame(height: 20)
                                }
                                if viewModel.detail.choice1_9 != ""{
                                    Text("I").bold().frame(height: 20)
                                }
                                if viewModel.detail.choice1_10 != ""{
                                    Text("J").bold().frame(height: 20)
                                }
                            }
                            VStack(alignment: .leading, spacing: 12) {
                                Text(viewModel.detail.choice1_1!).bold().frame(height: 20)
                                Text(viewModel.detail.choice1_2!).bold().frame(height: 20)
                                Text(viewModel.detail.choice1_3!).bold().frame(height: 20)
                                Text(viewModel.detail.choice1_4!).bold().frame(height: 20)
                                if viewModel.detail.choice1_5 != ""{
                                    Text(viewModel.detail.choice1_5!).bold().frame(height: 20)
                                }
                                if viewModel.detail.choice1_6 != ""{
                                    Text(viewModel.detail.choice1_6!).bold().frame(height: 20)
                                }
                                if viewModel.detail.choice1_7 != ""{
                                    Text(viewModel.detail.choice1_7!).bold().frame(height: 20)
                                }
                                if viewModel.detail.choice1_8 != ""{
                                    Text(viewModel.detail.choice1_8!).bold().frame(height: 20)
                                }
                                if viewModel.detail.choice1_9 != ""{
                                    Text(viewModel.detail.choice1_9!).bold().frame(height: 20)
                                }
                                if viewModel.detail.choice1_10 != ""{
                                    Text(viewModel.detail.choice1_10!).bold().frame(height: 20)
                                }
                            }.padding(.leading)
                            Spacer()
                        }
                    }.padding(.leading)
                    
                    if viewModel.detail.choice2_1 != "" {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("問2").bold()
                            Text(viewModel.detail.questionTop2!)
                            Text(viewModel.detail.question2!.replacingOccurrences(of: "\\n", with: "\n")).bold().padding(.leading)
                            Text(viewModel.detail.questionBottom2!)
                            HStack(spacing: 10) {
                                VStack(spacing: 12) {
                                    ForEach(0..<viewModel.detail.choice2!) { num in
                                        CheckBox(answer: $number2, number: num).frame(height: 20)
                                    }
                                }
//                                Text("\(number2)")
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("A").bold().frame(height: 20)
                                    Text("B").bold().frame(height: 20)
                                    Text("C").bold().frame(height: 20)
                                    Text("D").bold().frame(height: 20)
                                    if viewModel.detail.choice2_5 != ""{
                                        Text("E").bold().frame(height: 20)
                                    }
                                    if viewModel.detail.choice2_6 != ""{
                                        Text("F").bold().frame(height: 20)
                                    }
                                    if viewModel.detail.choice2_7 != ""{
                                        Text("G").bold().frame(height: 20)
                                    }
                                    if viewModel.detail.choice2_8 != ""{
                                        Text("H").bold().frame(height: 20)
                                    }
                                    if viewModel.detail.choice2_9 != ""{
                                        Text("I").bold().frame(height: 20)
                                    }
                                    if viewModel.detail.choice2_10 != ""{
                                        Text("J").bold().frame(height: 20)
                                    }
                                }
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(viewModel.detail.choice2_1!).bold().frame(height: 20)
                                    Text(viewModel.detail.choice2_2!).bold().frame(height: 20)
                                    Text(viewModel.detail.choice2_3!).bold().frame(height: 20)
                                    Text(viewModel.detail.choice2_4!).bold().frame(height: 20)
                                    if viewModel.detail.choice2_5 != ""{
                                        Text(viewModel.detail.choice2_5!).bold().frame(height: 20)
                                    }
                                    if viewModel.detail.choice2_6 != ""{
                                        Text(viewModel.detail.choice2_6!).bold().frame(height: 20)
                                    }
                                    if viewModel.detail.choice2_7 != ""{
                                        Text(viewModel.detail.choice2_7!).bold().frame(height: 20)
                                    }
                                    if viewModel.detail.choice2_8 != ""{
                                        Text(viewModel.detail.choice2_8!).bold().frame(height: 20)
                                    }
                                    if viewModel.detail.choice2_9 != ""{
                                        Text(viewModel.detail.choice2_9!).bold().frame(height: 20)
                                    }
                                    if viewModel.detail.choice2_10 != ""{
                                        Text(viewModel.detail.choice2_10!).bold().frame(height: 20)
                                    }
                                }.padding(.leading)
                                Spacer()
                            }.padding(.horizontal)
                        }.padding(.top, 50)
                    }
                    Spacer()
                }.padding(.horizontal)
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
            } else if number2 == 10 && viewModel.detail.choice2_1 != "" {
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
        }.alert(isPresented: $isShowTimerAlert) {
            Alert(title: Text(""), message: Text("制限時間になりました。"), dismissButton: .destructive(Text("OK")))
        }
        NavigationLink(destination: NextComentaryView(answer1: $number1, answer2: $number2, showStudyView: $showStudyView, viewModel: StudyNextContentView(detail: content), content: content, user: user), isActive: $isShowNext) {}
        
    }
}
//CommentaryView(answer1: $number1, answer2: $number2, content: content)
