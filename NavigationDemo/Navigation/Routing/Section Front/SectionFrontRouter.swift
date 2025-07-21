//
//  SectionFrontRouter.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import Foundation
import SwiftUI

protocol ArticleRouting {
    func pushArticleView(with article: Article)
}

class SectionFrontRouter: ObservableObject, ArticleRouting {
    @Published var currentSection: String?
    @Published var path = [SectionFrontDestination]()

    func pushArticleView(with article: Article) {
        path.append(SectionFrontDestination.article(item: article))
    }

    func handleDeeplink(for incomingURL: URL) {
        path.append(.settings)
    }

    func navigateBack() {
        path.removeLast()
    }
}
