//
//  VideoPlayerView.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewRepresentable {
    typealias UIViewType = PlayerView

    let player: AVPlayer

    init(player: AVPlayer) {
        self.player = player
    }

    func makeUIView(context: Context) -> PlayerView {
        return PlayerView(player: player)
    }

    func updateUIView(_ uiView: PlayerView, context: Context) {}
}

final class PlayerView: UIView {
    var player: AVPlayer? {
        get {
            return playerLayer?.player
        }
        set {
            playerLayer?.player = newValue
        }
    }

    var playerLayer: AVPlayerLayer? {
        return layer as? AVPlayerLayer
    }

    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

    init(player: AVPlayer) {
        super.init(frame: .zero)
        self.player = player
        self.backgroundColor = .black

        if let playerLayer = playerLayer {
            playerLayer.contentsGravity = .resizeAspect
            playerLayer.videoGravity = .resizeAspect
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
