//
//  AVPlayerUseCase.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import AVKit

protocol AVPlayerUseCaseProtocol {
    var player: AVPlayer { get }

    func updatePlayerURL(_ url: URL)
}

final class AVPlayerUseCase: AVPlayerUseCaseProtocol {
    var player: AVPlayer

    private var timeControlStatusObserver: NSKeyValueObservation?

    init(player: AVPlayer = AVPlayer()) {
        self.player = player
    }

    func updatePlayerURL(_ url: URL) {
        player.replaceCurrentItem(with: AVPlayerItem(url: url))
    }
}
