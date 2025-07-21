//
//  EditionView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import SwiftUI

struct EditionView: View {
    @EnvironmentObject var router: ProfileRouter

    var body: some View {
        NavigationStack {
            NavigationLink {
                Text("Test")
            } label: {
                Text("Navigate")
            }
            .navigationTitle("Sheet")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        router.hideSheet()
                    }
                }
            }
        }
    }
}
