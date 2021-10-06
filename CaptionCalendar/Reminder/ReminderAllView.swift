//
//  ReminderAllView.swift
//  CaptionCalendar
//
//  Created by 髙間洋平 on 2021/10/01.
//

import SwiftUI
import Kingfisher

struct ReminderContentView: View {
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @ObservedObject var viewModel: ReminderAllViewModel
    let reminder: Reminder
    let user: User
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                ZStack(alignment: .top) {
                    if let image = image {
                        image
                            .resizable().scaledToFill()
                            .frame(width: getScreenBounds().width*3/5-1, height: 90)
                            .clipped()
                        if #available(iOS 15.0, *) {
                            LinearGradient(colors: [
                                Color("TintColor").opacity(0.3),
                                Color("TintColor").opacity(0.15),
                                .clear
                            ], startPoint: .top, endPoint: .bottom).frame(height: 90)
                        }
                    } else {
                        if reminder.headerImageUrl != "" {
                            KFImage(URL(string: reminder.headerImageUrl!))
                                .resizable().scaledToFill()
                                .frame(width: getScreenBounds().width*3/5-1, height: 90)
                                .clipped()
                            if #available(iOS 15.0, *) {
                                LinearGradient(colors: [
                                    Color("TintColor").opacity(0.3),
                                    Color("TintColor").opacity(0.15),
                                    .clear
                                ], startPoint: .top, endPoint: .bottom).frame(height: 90)
                            }
                        }
                    }
                    
                    
                    HStack {
                        Text(reminder.categoryName!)
                            .font(.system(size: 15)).bold()
                            .foregroundColor(.primary)
                        Spacer()
                        
                        Menu {
                            Button(action: {
                                showImagePicker = true
                            }) {
                                Text("Set a header image")
                                Image(systemName: "photo")
                            }
                            Button(action: {
                                viewModel.DeleteImage()
                                image = nil
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    viewModel.fetchReminder()
                                }
                            }) {
                                Text("Delete a header image")
                                Image(systemName: "photo.fill")
                            }
                        } label: {
                            Image(systemName: "text.justify")
                                .foregroundColor(Color("TextColor"))
                        }
                    }.padding(.horizontal, 15).frame(height: 35)
                }
                if viewModel.loading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("CaptionColor")))
                        .scaleEffect(1)
                }
                
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedUIImage)
            })
            
            ScrollView {
                VStack {
                    ForEach(viewModel.reminder, id: \.self) { reminderinfo in
                        if reminderinfo.categoryName == reminder.categoryName {
                            NavigationLink(destination: {
                                ReminderDeteilView(reminder: reminderinfo)
                            }, label: {
                                if reminderinfo.courseName == "" {
                                    ReminderCellView(reminder: reminderinfo)
                                } else {
                                    ReminderTimetableView(reminder: reminderinfo)
                                }
                            })
                        }
                    }
                    NavigationLink(destination: {
                        CreateReminderView(categoryName: reminder.categoryName!, user: user)
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        HStack {
                            Image(systemName: "plus")
                                .font(.system(size: 13))
                            Text("追加")
                                .font(.system(size: 12))
                        }
                        .foregroundColor(Color("TextColor"))
                        .frame(width: getScreenBounds().width*3/5 - 20, height: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("TextColor"), lineWidth: 0.3)
                        ).padding(.top)
                        
                    })
                    Spacer()
                }
                .padding(.top)
                .frame(width: getScreenBounds().width*3/5)
            }
        }
        .onAppear(perform: {
            viewModel.fetchReminder()
        })
    }
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
        viewModel.saveUserImage(profileImage: selectedImage)
//        viewModel.fetchReminder()
    }
    
}
