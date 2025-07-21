//
//  ProfileView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 2.10.23.
//

import SwiftUI

struct ProfileView: View {
    let router: ProfileRouter

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            NavigationLink(value: ProfileDestination.logIn) {
                Text("Log In")
            }

            Button("Present Sheet") {
                router.presentSheet()
            }
        }
    }
}
