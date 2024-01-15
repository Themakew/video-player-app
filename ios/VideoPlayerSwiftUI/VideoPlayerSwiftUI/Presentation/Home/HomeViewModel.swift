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
    var isPlaying: Bool { get set }
    var isPreviousButtonDisabled: Bool { get set }
    var isNextButtonDisabled: Bool { get set }
    var isControlButtonsDisabled: Bool { get set }

    func loadData() async
    func togglePlayPause()
}

@Observable final class HomeViewModel: HomeViewModelProtocol {
    var currentVideoData: VideoEntity?
    var player: AVPlayer
    var isPlaying = false
    var isPreviousButtonDisabled = true
    var isNextButtonDisabled = false
    var isControlButtonsDisabled = false

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

            refreshScreen()
        } catch {
            print("Error: \(error)")
        }
    }

    func togglePlayPause() {
        playerUseCase.togglePlayPause()
        isPlaying = playerUseCase.isPlaying
    }

    func goToPreviousVideo() {
        playerUseCase.pausePlayer()
        videoUseCase.goToPreviousVideo()

        currentVideoData = videoUseCase.selectedVideoData
        refreshScreen()
    }

    func goToNextVideo() {
        playerUseCase.pausePlayer()
        videoUseCase.goToNextVideo()

        currentVideoData = videoUseCase.selectedVideoData
        refreshScreen()
    }

    private func refreshScreen() {
        updateVideoPlayer()
        updateButtonStates()

        isPlaying = playerUseCase.isPlaying
    }

    private func updateVideoPlayer() {
        playerUseCase.pausePlayer()

        if let url = currentVideoData?.hlsURL {
            playerUseCase.updatePlayerURL(url)
        }
    }

    private func updateButtonStates() {
        isPreviousButtonDisabled = videoUseCase.canGoToPrevious()
        isNextButtonDisabled = videoUseCase.canGoToNext()
    }
}
