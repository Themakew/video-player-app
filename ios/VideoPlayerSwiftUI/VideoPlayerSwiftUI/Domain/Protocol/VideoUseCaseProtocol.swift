//
//  VideoUseCaseProtocol.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

protocol VideoUseCaseProtocol {
    var selectedVideoData: VideoEntity? { get }

    func getVideoData() async throws -> VideoEntity
    func goToPreviousVideo()
    func goToNextVideo()
    func canGoToPrevious() -> Bool
    func canGoToNext() -> Bool
}
