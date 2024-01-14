//
//  HomeView.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import SwiftUI
import AVKit

struct HomeView: View {
    @State var viewModel: HomeViewModelProtocol

    var body: some View {
        NavigationStack {
            Group {
                if let videoData = viewModel.currentVideoData {
                    VStack {
                        videoContentView(videoData)
                    }
                } else {
                    Text("Loading...")
                }
            }
            .navigationBarTitle("Video Player", displayMode: .inline)
            .customNavigationBar(backgroundColor: .black, textColor: .white)
        }
        .task {
            await viewModel.loadData()
        }
    }

    private func videoContentView(_ videoData: VideoEntity) -> some View {
        Group {
            VideoPlayerView(player: viewModel.player)
                .frame(height: 300)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(VideoUseCase(VideoRepository(APIRequest())), AVPlayerUseCase()))
}
