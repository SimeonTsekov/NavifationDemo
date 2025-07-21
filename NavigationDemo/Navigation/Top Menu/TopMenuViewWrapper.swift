//
//  TopMenuViewWrapper.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 2.10.23.
//

import SwiftUI

struct TopMenuViewWrapper {
    var menuView: SelectableView
    var contentView: AnyView

    init(wrappedView: AnyView, tabItem: SelectableView) {
        contentView = wrappedView
        menuView = tabItem
    }
}
