//
//  MyArticlesNavigationView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 2.10.23.
//

import SwiftUI

struct MyArticlesNavigationView: View {
    @ObservedObject private var router = MyArticlesRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            myArticlesContentView
                .navigationDestination(for: MyArticlesDestination.self) { $0 }
                .navigationTitle("MyArticles")
                .navigationBarTitleDisplayMode(.inline)
        }
    }

    var myArticlesContentView: some View {
        MyArticlesContentView(router: router)
    }
}
