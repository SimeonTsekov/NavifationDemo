//
//  TopMenuView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 2.10.23.
//

import SwiftUI

struct TopMenu {
    var backgrounColor: Color
    var selectedTabLineColor: Color
    var selectedTabLineHeight: CGFloat
    var lineColor: Color
    var lineHeight: CGFloat
}

struct TopMenuView: View {
    var childViews: [TopMenuViewWrapper]
    @Binding var menu: TopMenu
    @Binding var containerColor: Color
    @State var menuTabBarHeight: CGFloat = .zero
    @Binding var selectedTab: Int
    @Namespace private var animation

    init(childViews: [TopMenuViewWrapper],
         selectedTab: Binding<Int> = .constant(0),
         containerColor: Binding<Color>,
         menu: Binding<TopMenu>) {
        self.childViews = childViews
        _menu = menu
        _containerColor = containerColor
        _selectedTab = selectedTab
    }

    var body: some View {
        VStack(spacing: 0) {
            topMenuButtons
                .background(menu.backgrounColor)
            Rectangle()
                .foregroundColor(menu.lineColor)
                .frame(height: menu.lineHeight)
            TabView(selection: $selectedTab) {
                ForEach(childViews.indices, id: \.self) { index in
                    childViews[index].contentView
                        .tag(index)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(containerColor)
            }
        }
    }

    var topMenuButtons: some View {
        ZStack {
            HStack(spacing: 0) {
                ForEach(childViews.indices, id: \.self) { index in
                    VStack {
                        let childView = childViews[index]
                        Button(action: {
                            selectedTab = index
                        }, label: {
                            childView.menuView.isSelected(selectedTab == index)
                        })
                        .id(index)
                        .padding(.bottom, menu.lineHeight)
                        .frame(maxWidth: .infinity, minHeight: menuTabBarHeight, alignment: .center)
                        .matchedGeometryEffect(id: index, in: animation, isSource: true)
                    }
                }
            }
            .background(viewHeightReader($menuTabBarHeight))
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onEnded { value in
                    if value.translation.width < 0 {
                        if selectedTab > 0 {
                            selectedTab -= 1
                        }
                    }
                    if value.translation.width > 0 {
                        if selectedTab < (childViews.count - 1) {
                            selectedTab += 1
                        }
                    }
                })
            Rectangle()
                .foregroundColor(menu.selectedTabLineColor)
                .frame(height: menu.selectedTabLineHeight)
                .matchedGeometryEffect(id: selectedTab, in: animation, isSource: false)
        }
    }
}

@ViewBuilder
func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
    GeometryReader { geometry -> Color in
        let rect = geometry.frame(in: .local)
        DispatchQueue.main.async {
            binding.wrappedValue = rect.size.height
        }
        return .clear
    }
}
