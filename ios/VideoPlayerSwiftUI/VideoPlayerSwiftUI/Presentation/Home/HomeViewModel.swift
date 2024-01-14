//
//  HomeViewModel.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import SwiftUI

protocol HomeViewModelProtocol {
    var selectedVideoData: VideoEntity? { get set }

    func loadData() async
}

@Observable final class HomeViewModel: HomeViewModelProtocol {
    var selectedVideoData: VideoEntity?

    private let videoUseCase: VideoUseCaseProtocol

    init(
        _ videoUseCase: VideoUseCaseProtocol
    ) {
        self.videoUseCase = videoUseCase
    }

    @MainActor
    func loadData() async {
        do {
            let videoData = try await videoUseCase.getVideoData()
            self.selectedVideoData = videoData
        } catch {
            print("Error: \(error)")
        }
    }
}
