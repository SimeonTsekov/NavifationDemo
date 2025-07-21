//
//  SelectableView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 2.10.23.
//

import SwiftUI

struct SelectableView: View {
    var isSelected: Bool
    var selectedView: AnyView
    var unselectedView: AnyView

    init(
        @ViewBuilder selectedView: () -> AnyView,
        @ViewBuilder unselectedView: () -> AnyView
    ) {
        isSelected = false
        self.selectedView = selectedView()
        self.unselectedView = unselectedView()
    }

    var body: some View {
        ZStack {
            if isSelected {
                selectedView
            } else {
                unselectedView
            }
        }
    }
}

extension SelectableView {
    func isSelected(_ value: Bool) -> Self {
        var view = self
        view.isSelected = value
        return view
    }
}
