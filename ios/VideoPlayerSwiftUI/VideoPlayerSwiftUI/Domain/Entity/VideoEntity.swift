//
//  VideoEntity.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import Foundation

struct VideoEntity: Identifiable {
    let id: String
    let title: String
    let hlsURL: URL
    let description: String
    let publishedAt: Date
    let author: AuthorEntity
}

struct AuthorEntity: Identifiable {
    let id: String
    let name: String
}
