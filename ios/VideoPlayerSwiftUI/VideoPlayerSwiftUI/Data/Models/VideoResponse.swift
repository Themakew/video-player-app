//
//  VideoResponse.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

struct VideoResponse: Decodable {
    let id: String
    let title: String
    let hlsURL: String
    let fullURL: String
    let description: String
    let publishedAt: String
    let author: AuthorResponse
}

struct AuthorResponse: Decodable {
    let id: String
    let name: String
}
