//
//  MainTabView.swift
//  CaptionCalendar
//
//  Created by 高間 on 2021/07/26.
//

import SwiftUI
import EventKit
import Combine

struct MainTabView: View {
    @State private var selection = 0
    @State var showMenu: Bool = false
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    var user: User
    var body: some View {
        let sideBarWidth = getRect().width - 90
        ZStack(alignment: .bottom) {
            HStack(spacing: 0) {
                SideMenu(showMenu: $showMenu, user: user)
                MainContentView(selection: $selection, showMenu: $showMenu, user: user)
                .frame(width: getRect().width)
                .overlay(Rectangle()
                            .fill(
                                Color.primary.opacity(Double((offset/sideBarWidth)/5))
                            )
                            .ignoresSafeArea(.container, edges: .vertical)
                            .onTapGesture { withAnimation {
                    showMenu.toggle()
                    offset = 0
                }})
            }
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset > 0 && selection == 0 ? offset : 0)
            
            .onAppear() {
                UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.7488358858)
//                UITabBar.appearance().unselectedItemTintColor = Color.gray.opacity(0.5) as? UIColor
                UITabBar.appearance().barTintColor = UIColor(named: "TintColor")
//                offset = 0
            }
            .animation(.easeOut, value: offset == 0)
            .onChange(of: showMenu) { newValue in
                if showMenu && offset == 0 {
                    offset = sideBarWidth
                    lastStoredOffset = offset
                }
                if !showMenu && offset == sideBarWidth {
                    offset = 0
                    lastStoredOffset = 0
                }
            }
            .onChange(of: gestureOffset, perform: { newValue in
                onChange()
            })
            
            Rectangle()
                .fill(.red).opacity(0)
                .contentShape(Rectangle())
                .frame(width: getScreenBounds().width, height: 100)
                .gesture(
                    DragGesture()
                        .updating($gestureOffset, body: { value, out, _ in
                            out = value.translation.width
                        }).onEnded(onEnd(value:))
                )
        }
    }
    func onChange(){
        let sideBarWidth = getRect().width - 90
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideBarWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    func onEnd(value: DragGesture.Value){
        let sideBarWidth = getRect().width - 90
        let translation = value.translation.width
        withAnimation {
            if translation > 0 {
                if translation > (sideBarWidth / 2) {
                    offset = sideBarWidth
                    showMenu = true
                } else {
                    if offset == sideBarWidth {
                        return
                    }
                    offset = 0
                    showMenu = false
                }
            } else {
                if -translation > (sideBarWidth / 2) {
                    offset = 0
                    showMenu = false
                } else {
                    if offset == 0 || !showMenu {
                        return
                    }
                    offset = sideBarWidth
                    showMenu = true
                }
            }
        }
        lastStoredOffset = offset
    }
}
