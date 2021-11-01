//
//  ClassColorChooser.swift
//  ClassColorChooser
//
//  Created by 髙間洋平 on 2021/08/28.
//

import SwiftUI

struct ClassColorChooser: View {
    @State private var showingTimeTable = false
    @Binding var isPresentedColorChooser: Bool
    let classes: TimeTable
    let user: User
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 0) {
                ForEach(0..<6){ num in
                    Button(action: {
                        registrationColor(color: "Color\(num)")
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(Color("Color\(num)"))
                                .frame(width: 25, height: 25)
                        }.frame(width: width/7, height: 80)
                        
                    })
                }
            }
            HStack(spacing: 0) {
                ForEach(6..<12){ num in
                    Button(action: {
                        registrationColor(color: "Color\(num)")
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(Color("Color\(num)"))
                                .frame(width: 25, height: 25)
                        }.frame(width: width/7, height: 80)
                    })
                }
            }
        }
        NavigationLink(destination: MainTableView(user: user).navigationBarHidden(true), isActive: $showingTimeTable) {
        }
    }
    func registrationColor(color: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_USERS.document(uid).collection("2021LH").document(classes.classId).updateData(["color": color]) { _ in
            
            isPresentedColorChooser = false
            showingTimeTable = true
        }
    }
}
