//
//  Profile.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import SwiftUI

struct ProfileNavigationView: View {
    @StateObject private var router = ProfileRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            profileView
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: ProfileDestination.self) { $0 }
            .sheet(isPresented: $router.isSheetPresented) {
                EditionView()
            }
        }
        .environmentObject(router)
    }

    private var profileView: some View {
        ProfileView(router: router)
    }
}
