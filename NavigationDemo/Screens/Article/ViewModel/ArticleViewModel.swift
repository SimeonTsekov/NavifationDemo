//
//  ArticleViewModel.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 5.10.23.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var articleIsSaved = false

    let origin: ArticleOrigin

    private let article: Article

    init(
        article: Article,
        origin: ArticleOrigin
    ) {
        self.article = article
        self.origin = origin
    }

    var articleTitle: String {
        article.title
    }

    var articleSummary: String {
        article.summary
    }

    var articleBody: String {
        article.body
    }

    func toggleArticleSaveStatus() {
        articleIsSaved.toggle()
    }
}
