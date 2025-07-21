//
//  SectionsView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 29.09.23.
//

import SwiftUI

struct SectionsView: View {
    let sectionFrontRouter: SectionFrontRouter
    private let sections: [String] = (1...10).map {"Section \($0)"}

    var body: some View {
        List {
            ForEach(sections, id: \.self) { section in
                Text(section)
                    .onTapGesture {
                        sectionFrontRouter.currentSection = section
                        sectionFrontRouter.navigateBack()
                    }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Sections")
        .navigationBarTitleDisplayMode(.inline)
    }
}
