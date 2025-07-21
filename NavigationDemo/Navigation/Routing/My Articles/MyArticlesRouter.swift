//
//  MyArticlesRouter.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 2.10.23.
//

import Foundation

class MyArticlesRouter: ArticleRouting, ObservableObject {
    @Published var path = [MyArticlesDestination]()

    func pushArticleView(with article: Article) {
        path.append(MyArticlesDestination.article(item: article))
    }
}
