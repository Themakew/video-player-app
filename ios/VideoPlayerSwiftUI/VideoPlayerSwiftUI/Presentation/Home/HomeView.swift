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

            detailView(
                videoTitle: videoData.title,
                authorName: videoData.author.name,
                videoDescription: videoData.description
            )
        }
    }

    private func detailView(
        videoTitle: String,
        authorName: String,
        videoDescription: String
    ) -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(videoTitle)
                    .font(.title)

                Text(authorName)
                    .font(.subheadline)

                MarkdownView(markdownText: videoDescription)
                    .font(.body)
                    .padding(.top)
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(VideoUseCase(VideoRepository(APIRequest())), AVPlayerUseCase()))
}
