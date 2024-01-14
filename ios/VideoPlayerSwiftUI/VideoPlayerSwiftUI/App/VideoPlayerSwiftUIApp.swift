//
//  VideoPlayerSwiftUIApp.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

@main
struct VideoPlayerSwiftUIApp: App {
    let apiService = APIRequest()

    init() {
        UIView.appearance().overrideUserInterfaceStyle = .light
    }

    var body: some Scene {
        WindowGroup {
            let videoRepository = VideoRepository(apiService)
            let videoUseCase = VideoUseCase(videoRepository)
            let viewModel = HomeViewModel(videoUseCase)

            HomeView(viewModel: viewModel)
        }
    }
}
