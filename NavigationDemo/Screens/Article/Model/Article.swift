//
//  ArticleModel.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import Foundation

struct Article: Identifiable, Equatable {
    var id: String { "\(title)_\(body)" }

    let title: String
    let summary = Constants.articleSummary
    let body: String = Constants.articleBody
}
