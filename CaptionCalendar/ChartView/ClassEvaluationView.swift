//
//  ClassEvaluationView.swift
//  ClassEvaluationView
//
//  Created by 髙間洋平 on 2021/08/24.
//

import SwiftUI

struct ClassEvaluationView: View {
    @Binding var name: String
    @State var pickerSelection = 1
    @State private var angle = Angle(degrees: 315)
    let classes: TimeTable
    
    init( name: Binding<String>, classes: TimeTable ) {
        self._name = name
        self.classes = classes
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    var body: some View {
        
        let barAttendanceValues : [[Int]] =
        [
            [0,0,0,0,0],
            [classes.attendanceNone!,
             classes.attendanceSometimes!,
             classes.attendanceEverytime!,
             classes.attendanceReport!,
             classes.attendanceNotClear!]
        ]
        let barUnitValues : [[Int]] =
        [
            [0,0,0,0,0],
            [classes.unit1!,
             classes.unit2!,
             classes.unit3!,
             classes.unit4!,
             classes.unit5!]
        ]
        
        ZStack{
            VStack{
                Text(name)
                    .bold()
                
                Picker(selection: $pickerSelection, label: Text("Stats")) {
                    Text("〜2020").tag(0)
                    Text("2021").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 10)
                
                if name == "出席" {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(barAttendanceValues[pickerSelection], id: \.self){
                            data in
                            
                            ClassEvaluationBarView(value: data, cornerRadius: CGFloat(8))
                        }
                    }
                    .animation(.default)
                    HStack(spacing: 0) {
                        Group {
                            Text("なし")
                            Text("時々")
                            Text("毎回")
                            Text("レポ")
                            Text("その他")
                        }
                        .frame(width: 30)
                        .font(.system(size: 10))
                        .rotationEffect(angle)
                    }
                }
                if name == "単位" {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(barUnitValues[pickerSelection], id: \.self){
                            data in
                            ClassEvaluationBarView(value: data, cornerRadius: CGFloat(8))
                        }
                    }
                    .animation(.default)
                    HStack(spacing: 0) {
                        Group {
                            Text("難")
                            Text("")
                            Text("普通")
                            Text("")
                            Text("楽")
                        }
                        .frame(width: 30)
                        .font(.system(size: 10))
                        .rotationEffect(angle)
                    }
                }
            }
        }
    }
}
