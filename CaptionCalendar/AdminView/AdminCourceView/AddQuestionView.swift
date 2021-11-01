//
//  AddQuestionView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/09/19.
//

import SwiftUI

struct AddQuestionView: View {
    @State private var selectedOrder = "1"
    @State private var selectedTimer = ""
    @State private var title = ""
    @State private var questionTop = ""
    @State private var question = ""
    @State private var questionBottom = ""
    @State private var questionTop1 = ""
    @State private var questionTop2 = ""
    @State private var question1 = ""
    @State private var question2 = ""
    @State private var questionBottom1 = ""
    @State private var questionBottom2 = ""
    @State private var choice1 = "2"
    @State private var answer1 = "1"
    @State private var choice1_1 = ""
    @State private var choice1_2 = ""
    @State private var choice1_3 = ""
    @State private var choice1_4 = ""
    @State private var choice1_5 = ""
    @State private var choice1_6 = ""
    @State private var choice1_7 = ""
    @State private var choice1_8 = ""
    @State private var choice1_9 = ""
    @State private var choice1_10 = ""
    @State private var choice2 = "0"
    @State private var answer2 = "0"
    @State private var choice2_1 = ""
    @State private var choice2_2 = ""
    @State private var choice2_3 = ""
    @State private var choice2_4 = ""
    @State private var choice2_5 = ""
    @State private var choice2_6 = ""
    @State private var choice2_7 = ""
    @State private var choice2_8 = ""
    @State private var choice2_9 = ""
    @State private var choice2_10 = ""
    @State private var isShowAlert = false
    @Binding var addCource: Bool
    let order = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
    let timer = ["10","15","30","60","90","120","180","240","300"]
    let choiceCount = ["0","4","5","6","7","8","9","10","11","12"]
    let answer = ["0","1","2","3","4","5","6","7","8","9","10"]
    let cource: Textbook
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("問1").bold()
                    Spacer()
                }
                VStack(alignment: .leading) {
                    CustomTextField("Title", text: $title)
                    Divider()
                    VStack {
                        HStack {
                            Text("Time")
                            Picker(selection: $selectedTimer, label: Text("order")) {
                                ForEach(timer, id: \.self) { num in
                                    Text("\(num) seconds")
                                }
                            }
                            Text("必ず選択してください").font(.caption).padding(.leading)
                            Spacer()
                        }
                        HStack {
                            Text("Order")
                            Picker(selection: $selectedOrder, label: Text("order")) {
                                ForEach(order, id: \.self) { num in
                                    Text("\(num)")
                                }
                            }
                            Text("必ず選択してください").font(.caption).padding(.leading)
                            Spacer()
                        }
                    }.padding(.leading)
                    Divider()
                    CustomTextField("Head Question Top　(任意)", text: $questionTop)
                    Divider()
                    CustomTextField("Head Question　(任意)", text: $question)
                    Divider()
                    CustomTextField("Head Question Bottom　(任意)", text: $questionBottom)
                    Divider()
                }
                VStack(alignment: .leading) {
                    CustomTextField("Question Top　(任意)", text: $questionTop1)
                    Divider()
                    CustomTextField("Question　(必須)", text: $question1)
                    Divider()
                    CustomTextField("Question Bottom　(任意)", text: $questionBottom1)
                    Divider()
                    Group {
                        TextField("選択肢１", text: $choice1_1)
                        TextField("選択肢２", text: $choice1_2)
                        TextField("選択肢３", text: $choice1_3)
                        TextField("選択肢４", text: $choice1_4)
                        TextField("選択肢５", text: $choice1_5)
                        TextField("選択肢６", text: $choice1_6)
                        TextField("選択肢７", text: $choice1_7)
                        TextField("選択肢８", text: $choice1_8)
                        TextField("選択肢９", text: $choice1_9)
                        TextField("選択肢１０", text: $choice1_10)
                    }.padding(.leading)
                    HStack {
                        Text("問1の解答")
                        Picker(selection: $answer1, label: Text("answer1")) {
                            ForEach(answer, id: \.self) { num in
                                Text("\(num)")
                            }
                        }
                        Text("必ず選択してください").font(.caption).padding(.leading)
                        Spacer()
                    }
                    
                }
                HStack {
                    Text("選択肢の数")
                    Picker(selection: $choice1, label: Text("choice1")) {
                        ForEach(choiceCount, id: \.self) { num in
                            Text("\(num)")
                        }
                    }
                    Text("必ず選択してください").font(.caption).padding(.leading)
                    Spacer()
                }
                HStack {
                    Text("問2").bold()
                    Text("問1のみの場合は空白のまま登録してください").font(.caption).padding(.leading)
                    Spacer()
                }.padding(.top, 30)
                
                VStack(alignment: .leading) {
                    Divider()
                    CustomTextField("Question Top　(任意)", text: $questionTop2)
                    Divider()
                    CustomTextField("Question　(任意)", text: $question2)
                    Divider()
                    CustomTextField("Question Bottom　(任意)", text: $questionBottom2)
                    Divider()
                }
                VStack(alignment: .leading) {
                    Group {
                        TextField("選択肢１", text: $choice2_1)
                        TextField("選択肢２", text: $choice2_2)
                        TextField("選択肢３", text: $choice2_3)
                        TextField("選択肢４", text: $choice2_4)
                        TextField("選択肢５", text: $choice2_5)
                        TextField("選択肢６", text: $choice2_6)
                        TextField("選択肢７", text: $choice2_7)
                        TextField("選択肢８", text: $choice2_8)
                        TextField("選択肢９", text: $choice2_9)
                        TextField("選択肢１０", text: $choice2_10)
                    }.padding(.leading)
                    HStack {
                        Text("問2の解答")
                        Picker(selection: $answer2, label: Text("answer1")) {
                            ForEach(answer, id: \.self) { num in
                                Text("\(num)")
                            }
                        }
                        Text("2問目がある場合、必ず選択してください。ない場合は０としてください。").font(.caption).padding(.leading)
                        Spacer()
                    }
                }
                HStack {
                    Text("選択肢の数")
                    Picker(selection: $choice2, label: Text("choice2")) {
                        ForEach(choiceCount, id: \.self) { num in
                            Text("\(num)")
                        }
                    }
                    Text("2問目がある場合、必ず選択してください。ない場合は０としてください。").font(.caption).padding(.leading)
                    Spacer()
                }
                Divider()
                    .padding(.top)
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: registrationButton)
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text(""), message: Text("正しく登録することができませんでした。"), dismissButton: .destructive(Text("OK")))
            }
        }.onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
    }
    var registrationButton: some View {
        Button(action: {
            registration()
        }, label: {
            if question1 != "" && choice1_1 != "" {
                Image(systemName: "plus")
            } else {
                Image(systemName: "plus")
                    .foregroundColor(Color.gray)
            }
        })
    }
    
    func registration() {
        let DogRef = COLLECTION_TEXTBOOK.document(cource.textbookID!).collection("course").document(cource.courseID!).collection("question").document()
        let DocID = DogRef.documentID
        let datas: [String: Any] = ["title": title,
                                    "questionTop": questionTop,
                                    "question": question,
                                    "questionBottom": questionBottom,
                                    "questionTop1": questionTop1,
                                    "questionTop2": questionTop2,
                                    "question1": question1,
                                    "question2": question2,
                                    "questionBottom1": questionBottom1,
                                    "questionBottom2": questionBottom2,
                                    "choice1": Int(choice1)!,
                                    "answer1": Int(answer1)!,
                                    "choice1_1": choice1_1,
                                    "choice1_2": choice1_2,
                                    "choice1_3": choice1_3,
                                    "choice1_4": choice1_4,
                                    "choice1_5": choice1_5,
                                    "choice1_6": choice1_6,
                                    "choice1_7": choice1_7,
                                    "choice1_8": choice1_8,
                                    "choice1_9": choice1_9,
                                    "choice1_10": choice1_10,
                                    "choice2": Int(choice2)!,
                                    "answer2": Int(answer2)!,
                                    "choice2_1": choice2_1,
                                    "choice2_2": choice2_2,
                                    "choice2_3": choice2_3,
                                    "choice2_4": choice2_4,
                                    "choice2_5": choice2_5,
                                    "choice2_6": choice2_6,
                                    "choice2_7": choice2_7,
                                    "choice2_8": choice2_8,
                                    "choice2_9": choice2_9,
                                    "choice2_10": choice2_10,
                                    "order": Int(selectedOrder)!,
                                    "timer": Int(selectedTimer)!,
                                    "textbookID": cource.textbookID!,
                                    "courseID": cource.courseID!,
                                    "nextID": "",
                                    "questionID": DocID]
        if question1 != "" && choice1_1 != "" {
            DogRef.setData(datas) { err in
                if err == nil {
                    addCource.toggle()
                } else {
                    isShowAlert.toggle()
                }
            }
        }
    }
}
