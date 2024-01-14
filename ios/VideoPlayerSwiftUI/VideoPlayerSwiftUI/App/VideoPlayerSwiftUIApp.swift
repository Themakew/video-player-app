//
//  VideoPlayerSwiftUIApp.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

@main
struct VideoPlayerSwiftUIApp: App {

    init() {
        UIView.appearance().overrideUserInterfaceStyle = .light
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
