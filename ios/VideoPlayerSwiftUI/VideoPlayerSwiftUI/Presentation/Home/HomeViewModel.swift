//
//  HomeViewModel.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import AVKit
import SwiftUI

protocol HomeViewModelProtocol {
    var currentVideoData: VideoEntity? { get set }
    var player: AVPlayer { get set }

    func loadData() async
}

@Observable final class HomeViewModel: HomeViewModelProtocol {
    var currentVideoData: VideoEntity?
    var player: AVPlayer

    private let videoUseCase: VideoUseCaseProtocol
    private let playerUseCase: AVPlayerUseCaseProtocol

    init(
        _ videoUseCase: VideoUseCaseProtocol,
        _ playerUseCase: AVPlayerUseCaseProtocol
    ) {
        self.videoUseCase = videoUseCase
        self.playerUseCase = playerUseCase
        self.player = playerUseCase.player
    }

    @MainActor
    func loadData() async {
        do {
            let videoData = try await videoUseCase.getVideoData()
            self.currentVideoData = videoData
        } catch {
            print("Error: \(error)")
        }
    }

    private func updateViewPlayer() {
        if let url = currentVideoData?.hlsURL {
            playerUseCase.updatePlayerURL(url)
        }
    }
}
