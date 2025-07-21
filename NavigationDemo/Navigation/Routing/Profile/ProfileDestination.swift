//
//  ProfileDestination.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import SwiftUI

enum ProfileDestination {
    case logIn
}

extension ProfileDestination: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }

    static func == (lhs: ProfileDestination, rhs: ProfileDestination) -> Bool {
        switch (lhs, rhs) {
        case (.logIn, .logIn):
            return true
        }
    }
}

extension ProfileDestination: View {
    var body: some View {
        switch self {
        case .logIn:
            SafariWebView()
        }
    }
}
