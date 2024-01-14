//
//  VideoUseCase.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

protocol VideoUseCaseProtocol {
    var selectedVideoData: VideoEntity? { get }
}

final class ViewUseCase: VideoUseCaseProtocol {
    var selectedVideoData: VideoEntity?

    enum VideoError: Error {
        case noVideosAvailable
    }

    private let videoRepository: VideoRepositoryProtocol

    init(_ videoRepository: VideoRepositoryProtocol) {
        self.videoRepository = videoRepository
    }

    func getVideoData() async throws -> VideoEntity {
        let videoDataResponse = try await videoRepository.getVideoList()
        let dataListSortedByTheOldest = videoDataResponse.sorted { $0.publishedAt < $1.publishedAt }

        guard let oldestVideoObject = dataListSortedByTheOldest.first else {
            throw VideoError.noVideosAvailable
        }

        return oldestVideoObject
    }
}
