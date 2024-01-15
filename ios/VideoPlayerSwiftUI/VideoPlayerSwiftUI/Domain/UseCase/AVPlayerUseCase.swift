//
//  AVPlayerUseCase.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import AVKit

final class AVPlayerUseCase: AVPlayerUseCaseProtocol {
    deinit {
        timeControlStatusObserver?.invalidate()
    }

    var isPlaying = false
    var player: AVPlayer

    private var timeControlStatusObserver: NSKeyValueObservation?

    init(player: AVPlayer = AVPlayer()) {
        self.player = player
        self.timeControlStatusObserver = player.observe(\.timeControlStatus, options: [.new, .old]) { [weak self] _, _ in
            self?.isPlaying = self?.player.timeControlStatus == .playing
        }
    }

    func updatePlayerURL(_ url: URL) {
        player.replaceCurrentItem(with: AVPlayerItem(url: url))
    }

    func togglePlayPause() {
        if isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }

    func pausePlayer() {
        if isPlaying {
            player.pause()
        }
    }
}
