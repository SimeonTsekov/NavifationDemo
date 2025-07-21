//
//  SectionFrontView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 29.09.23.
//

import SwiftUI

struct SectionFrontView: View {
    @State private var articles: [Article] = [
        Article(title: "Article 1"),
        Article(title: "Article 2"),
        Article(title: "Article 3"),
        Article(title: "Article 4"),
        Article(title: "Article 5"),
        Article(title: "Article 6"),
        Article(title: "Article 7"),
        Article(title: "Article 8"),
        Article(title: "Article 9"),
        Article(title: "Article 10")
    ]

    let sectionFrontRouter: ArticleRouting

    var body: some View {
        List(articles) { article in
            ArticleCardView(article: article)
                .onTapGesture {
                    sectionFrontRouter.pushArticleView(with: article)
                }
                .alignmentGuide(.listRowSeparatorTrailing) { viewDimensions in
                    return viewDimensions[.listRowSeparatorTrailing]
                }

        }
        .listStyle(.plain)
    }
}
