//
//  MyArticlesDestination.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 2.10.23.
//

import Foundation
import SwiftUI

enum MyArticlesDestination {
    case article(item: Article)
    case stockTicker
}

extension MyArticlesDestination: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }

    static func == (lhs: MyArticlesDestination, rhs: MyArticlesDestination) -> Bool {
        switch (lhs, rhs) {
        case (.article(let lhsItem), .article(let rhsItem)):
            return lhsItem == rhsItem
        case (.stockTicker, .stockTicker):
            return true
        default:
            return false
        }
    }
}

extension MyArticlesDestination: View {
    var body: some View {
        switch self {
        case .article(let article):
            ArticleView(viewModel: articleViewModel(for: article, from: .myArticles))
        case .stockTicker:
            StockTickerView()
        }
    }

    func articleViewModel(for article: Article, from origin: ArticleOrigin) -> ArticleViewModel {
        return ArticleViewModel(article: article, origin: origin)
    }
}
