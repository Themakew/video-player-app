//
//  VideoRepository.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import Foundation

final class VideoRepository: VideoRepositoryProtocol {
    private let apiService: APIRequestProtocol

    init(_ apiService: APIRequestProtocol) {
        self.apiService = apiService
    }

    func getVideoList() async throws -> [VideoEntity] {
        let videoResponse: [VideoResponse] = try await apiService.fetchAPIData(of: [VideoResponse].self)
        let videoEntityList = try videoResponse.map { response in
            guard let hlsURL = URL(string: response.hlsURL) else {
                throw APIResponseError.invalidURL
            }

            guard let publishedAt = getDate(from: response.publishedAt) else {
                throw APIResponseError.invalidDate
            }

            return VideoEntity(
                id: response.id,
                title: response.title,
                hlsURL: hlsURL,
                description: response.description,
                publishedAt: publishedAt,
                author: AuthorEntity(id: response.author.id, name: response.author.name)
            )
        }

        return videoEntityList
    }

    private func getDate(from stringDate: String) -> Date? {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        guard let date = dateFormatter.date(from: stringDate) else {
            return nil
        }

        return date
    }
}
