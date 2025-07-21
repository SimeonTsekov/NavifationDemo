//
//  TabDestination.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import Foundation
import SwiftUI

enum TabDestination: String, CaseIterable, Hashable {
    case sectionFront
    case myArticles
    case stocks
    case profile

    func label(isSelected: Bool) -> some View {
        return Label {
            Text(title)
        } icon: {
            icon(isSelected: isSelected)
        }
    }

    private var title: String {
        switch self {
        case .sectionFront:
            return "Home"
        case .myArticles:
            return "MyArticles"
        case .stocks:
            return "Stocks"
        case .profile:
            return "Profile"
        }
    }

    private func icon(isSelected: Bool) -> some View {
        switch self {
        case .sectionFront:
            return Image(systemName: isSelected ? "house.fill" : "house")
        case .myArticles:
            return Image(systemName: isSelected ? "bookmark.fill" : "bookmark")
        case .stocks:
            return Image(systemName: isSelected ? "chart.line.uptrend.xyaxis.circle.fill" : "chart.line.uptrend.xyaxis.circle")
        case .profile:
            return Image(systemName: isSelected ? "person.fill" : "person")
        }
    }
}
