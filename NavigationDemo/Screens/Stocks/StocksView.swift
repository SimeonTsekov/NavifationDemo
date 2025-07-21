//
//  StocksView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 2.10.23.
//

import SwiftUI

struct StocksView: View {
    var body: some View {
        NavigationLink(value: StocksDestination.stockTicker) {
            Text("Show Stock Ticker")
        }
    }
}
