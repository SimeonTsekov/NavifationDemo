//
//  StocksNavigationView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import SwiftUI

struct StocksNavigationView: View {
    @StateObject private var router = StocksRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            stocksView
            .navigationDestination(for: StocksDestination.self) { $0 }
            .navigationTitle("Stocks")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var stocksView: some View {
        StocksView()
    }
}
