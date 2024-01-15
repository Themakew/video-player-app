//
//  AVPlayerUseCaseProtocol.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import AVKit

protocol AVPlayerUseCaseProtocol {
    var isPlaying: Bool { get }
    var player: AVPlayer { get }

    func updatePlayerURL(_ url: URL)
    func togglePlayPause()
    func pausePlayer()
}
