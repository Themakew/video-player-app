//
//  VideoUseCase.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

final class VideoUseCase: VideoUseCaseProtocol {
    var selectedVideoData: VideoEntity?

    enum VideoError: Error {
        case noVideosAvailable
    }

    private var videoList = [VideoEntity]()
    private var selectedVideoIndex = 0

    private let videoRepository: VideoRepositoryProtocol

    init(_ videoRepository: VideoRepositoryProtocol) {
        self.videoRepository = videoRepository
    }

    func getVideoData() async throws -> VideoEntity {
        let videoDataResponse = try await videoRepository.getVideoList()
        let dataList = videoDataResponse.sorted { $0.publishedAt < $1.publishedAt }

        videoList = dataList

        guard let firstVideo = dataList.first else {
            throw VideoError.noVideosAvailable
        }

        return firstVideo
    }

    func goToPreviousVideo() {
        if selectedVideoIndex > 0 {
            selectedVideoIndex -= 1
        }

        selectedVideoData = videoList[selectedVideoIndex]
    }

    func goToNextVideo() {
        if selectedVideoIndex < videoList.count - 1 {
            selectedVideoIndex += 1
        }

        selectedVideoData = videoList[selectedVideoIndex]
    }

    func canGoToPrevious() -> Bool {
        return selectedVideoIndex > 0
    }

    func canGoToNext() -> Bool {
        return selectedVideoIndex < videoList.count - 1
    }
}
