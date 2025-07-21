    //
    //  ContentView.swift
    //  NavigationDemo
    //
    //  Created by Simeon Tsekov on 27.09.23.
    //

import SwiftUI

struct ContentView: View {
    @StateObject var router = TabRouter()

    var body: some View {
        TabView(selection: $router.currentTab) {
            ForEach(router.destinations, id: \.rawValue) { destinaton in
                tabView(for: destinaton)
            }
        }
    }

    @ViewBuilder func tabView(for destination: TabDestination) -> some View {
        tabContentView(for: destination)
            .tabItem {
                destination.label(isSelected: destination == router.currentTab)
            }
            .tag(destination)
    }

    @ViewBuilder func tabContentView(for destination: TabDestination) -> some View {
        switch destination {
        case .sectionFront:
            SectionFrontNavigationView()
        case .myArticles:
            MyArticlesNavigationView()
        case .stocks:
            StocksNavigationView()
        case .profile:
            ProfileNavigationView()
        }
    }
}
