//
//  VideoRepositoryProtocol.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

protocol VideoRepositoryProtocol {
    func getVideoList() async throws -> [VideoEntity]
}
