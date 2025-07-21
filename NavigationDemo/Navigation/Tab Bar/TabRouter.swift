//
//  TabRouter.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 28.09.23.
//

import Combine
import Foundation
import SwiftUI

class TabRouter: ObservableObject {
    @Published var currentTab: TabDestination = .sectionFront

    let destinations = TabDestination.allCases
}
