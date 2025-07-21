//
//  ArticleView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import Foundation
import SwiftUI

enum ArticleOrigin {
    case sectionFront
    case myArticles
}

struct ArticleView: View {
    @StateObject var viewModel: ArticleViewModel

    var body: some View {
        ScrollView() {
            VStack(alignment: .center, spacing: 20) {
                navigationDestination
                Text(viewModel.articleBody)
            }
            .padding()
        }
        .navigationTitle(viewModel.articleTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
    }

    var navigationDestination: some View {
        switch viewModel.origin {
        case .sectionFront:
            NavigationLink(value: SectionFrontDestination.stockTicker) {
                Text("Stock Ticker")
            }
        case .myArticles:
            NavigationLink(value: MyArticlesDestination.stockTicker) {
                Text("Stock Ticker")
            }
        }
    }
}
