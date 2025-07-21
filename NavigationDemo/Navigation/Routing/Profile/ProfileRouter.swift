//
//  ProfileRouter.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import Foundation
import SwiftUI

class ProfileRouter: ObservableObject {
    @Published var path = [ProfileDestination]()
    @Published var isSheetPresented = false

    func clearPath() {
        path = []
    }

    func presentSheet() {
        isSheetPresented = true
    }

    func hideSheet() {
        isSheetPresented = false
    }
}
