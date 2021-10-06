//
//  ReminderCategoryView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/03.
//

import SwiftUI
import Kingfisher

struct ReminderCategoryView: View {
    @Binding var showSettingCategory: Bool
    @ObservedObject var viewModel = ReminderMainViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.reminder, id: \.self) { reminder in
                    HStack {
                        ZStack(alignment: .topTrailing) {
                            if reminder.headerImageUrl != "" {
                                KFImage(URL(string: reminder.headerImageUrl!))
                                    .resizable().scaledToFill()
                                    .frame(height: 120)
                                    .clipped()
                            }
                            if #available(iOS 15.0, *) {
                                LinearGradient(colors: [
                                    Color("TintColor").opacity(0.3),
                                    Color("TintColor").opacity(0.15),
                                    .clear
                                ], startPoint: .top, endPoint: .bottom).frame(height: 40)
                            }
                            HStack {
                                Text(reminder.categoryName!)
                                    .font(.system(size: 17)).bold()
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                            .padding(.horizontal, 15)
                            .frame(height: 40)
                        }.frame(width: getScreenBounds().width*4/5)
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Category", displayMode: .inline)
            .navigationBarItems(trailing: backButton)
        }
        
    }
    var backButton: some View {
        Button(action: {
            showSettingCategory.toggle()
        }, label: {
            Image(systemName: "multiply.circle.fill")
                .font(.title3)
                .foregroundColor(Color("TextColor"))
        })
    }
}
