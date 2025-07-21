//
//  ScaledLineHeight.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 29.09.23.
//

import SwiftUI

struct ScaledLineHeight: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var lineHeight: CGFloat?
    var fontSize: CGFloat

    func body(content: Content) -> some View {
        guard let lineHeight = lineHeight, lineHeight - fontSize > 0.0 else {
            return content.lineSpacing(0)
        }
        let scaledLineHeight = UIFontMetrics.default.scaledValue(for: lineHeight - fontSize)
        return content.lineSpacing(scaledLineHeight)
    }
}

extension View {
    func scaledLineHeight(lineHeight: CGFloat?, fontSize: CGFloat) -> some View {
        modifier(ScaledLineHeight(lineHeight: lineHeight, fontSize: fontSize))
    }
}
