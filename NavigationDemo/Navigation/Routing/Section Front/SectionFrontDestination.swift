//
//  SectionFrontDestination.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import Foundation
import SwiftUI

enum SectionFrontDestination {
    case article(item: Article)
    case stockTicker
    case settings
    case sections(router: SectionFrontRouter)
}

extension SectionFrontDestination: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashValue)
    }
}

extension SectionFrontDestination: Equatable {
    static func == (lhs: SectionFrontDestination, rhs: SectionFrontDestination) -> Bool {
        switch (lhs, rhs) {
        case (.article(let lhsItem), .article(let rhsItem)):
            return lhsItem == rhsItem
        case (.stockTicker, .stockTicker):
            return true
        case (.settings, .settings):
            return true
        case (.sections, .sections):
            return true
        default:
            return false
        }
    }
}

extension SectionFrontDestination: View {
    var body: some View {
        switch self {
        case .article(let article):
            ArticleView(viewModel: articleViewModel(for: article, from: .sectionFront))
        case .stockTicker:
            StockTickerView()
        case .settings:
            SettingsView()
        case .sections(let router):
            SectionsView(sectionFrontRouter: router)
        }
    }

    func articleViewModel(for article: Article, from origin: ArticleOrigin) -> ArticleViewModel {
        return ArticleViewModel(article: article, origin: origin)
    }
}
