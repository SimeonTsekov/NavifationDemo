//
//  StocksRouter.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import Foundation
import SwiftUI

class StocksRouter: ObservableObject {
    @Published var path = [StocksDestination]()
}
