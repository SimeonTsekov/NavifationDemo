//
//  MyArticlesContentView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 2.10.23.
//

import SwiftUI

struct MyArticlesContentView: View {
    @State var myArticlesSelectedTab: Int = 0
    var router: MyArticlesRouter

    private let topMenu: TopMenu

    init(router: MyArticlesRouter) {
        self.router = router
        topMenu = TopMenu(
            backgrounColor: .clear,
            selectedTabLineColor: .primary,
            selectedTabLineHeight: 2,
            lineColor: .secondary,
            lineHeight: 1
        )
    }

    var body: some View {
        myArticlesView
    }

    private var myArticlesView: some View {
        TopMenuView(
            childViews: [recommended, saved],
            selectedTab: $myArticlesSelectedTab,
            containerColor: .constant(.clear),
            menu: .constant(topMenu)
        )
        .navigationBarTitleDisplayMode(.inline)
    }

    var recommended: TopMenuViewWrapper {
        topTab(title: "Recommended")
    }

    var saved: TopMenuViewWrapper {
        topTab(title: "Saved Articles")
    }

    func topTab(title: String) -> TopMenuViewWrapper {
        let sectionView = SectionFrontView(sectionFrontRouter: router)
        let tabItem = SelectableView {
            AnyView(Text(title)
                .padding([.bottom, .top], 12))
        } unselectedView: {
            AnyView(Text(title)
                .padding([.bottom, .top], 12))
        }
        return TopMenuViewWrapper(wrappedView: AnyView(sectionView), tabItem: tabItem)
    }
}
