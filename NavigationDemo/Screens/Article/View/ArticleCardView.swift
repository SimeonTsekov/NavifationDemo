    //
    //  ArticleCardView.swift
    //  NavigationDemo
    //
    //  Created by Simeon Tsekov on 29.09.23.
    //

import SwiftUI

struct ArticleCardView: View {
    var article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            headlineComponent
            summaryComponent
        }
    }

    private var headlineComponent: some View {
        Text(article.title)
    }

    private var summaryComponent: some View {
        Text(article.summary)
    }
}

