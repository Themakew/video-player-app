//
//  NavigationView.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import SwiftUI

extension View {
    func customNavigationBar(backgroundColor: UIColor, textColor: UIColor) -> some View {
        self.modifier(CustomNavigationBarModifier(backgroundColor: backgroundColor, textColor: textColor))
    }
}

fileprivate struct CustomNavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor
    var textColor: UIColor

    init(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor

        setAppearance(backgroundColor, textColor)
    }

    func body(content: Content) -> some View {
        content
    }

    private func setAppearance(_ backgroundColor: UIColor, _ textColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: textColor]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = textColor
    }
}
