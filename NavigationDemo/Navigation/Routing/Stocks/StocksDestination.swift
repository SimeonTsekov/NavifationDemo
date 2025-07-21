//
//  StocksDestination.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import Foundation
import SwiftUI

enum StocksDestination {
    case stockTicker
}

extension StocksDestination: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }

    static func == (lhs: StocksDestination, rhs: StocksDestination) -> Bool {
        switch (lhs, rhs) {
        case (.stockTicker, .stockTicker):
            return true
        }
    }
}

extension StocksDestination: View {
    var body: some View {
        switch self {
        case .stockTicker:
            StockTickerView()
        }
    }
}
