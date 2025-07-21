//
//  SectionFrontNavigationView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import SwiftUI

struct SectionFrontNavigationView: View {
    @ObservedObject private var router = SectionFrontRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            sectionFrontView
                .navigationDestination(for: SectionFrontDestination.self) { $0 }
                .navigationTitle(router.currentSection ?? "Section Front")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(value: SectionFrontDestination.sections(router: router)) {
                            Text("Sections")
                        }
                    }
                }
                .onOpenURL { incomingURL in
                    router.handleDeeplink(for: incomingURL)
                }
        }
    }

    var sectionFrontView: some View {
        SectionFrontView(sectionFrontRouter: router)
    }
}
