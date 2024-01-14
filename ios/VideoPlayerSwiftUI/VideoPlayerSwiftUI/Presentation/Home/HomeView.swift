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
            GeometryReader { geometry in
                if let videoData = viewModel.currentVideoData {
                    VStack {
                        videoContentView(videoData, geometry)
                    }
                    .navigationBarTitle("Video Player", displayMode: .inline)
                    .customNavigationBar(backgroundColor: .black, textColor: .white)
                } else {
                    Text("Loading...")
                }
            }
        }
        .task {
            await viewModel.loadData()
        }
    }

    private func videoContentView(_ videoData: VideoEntity, _ geometry: GeometryProxy) -> some View {
        Group {
            VideoPlayerView(player: viewModel.player)
                .frame(height: geometry.size.height * 0.3)
                .background(.black)
                .overlay(
                    videoControls()
                )

            detailView(
                videoTitle: videoData.title,
                authorName: videoData.author.name,
                videoDescription: videoData.description
            )
        }
    }

    private func videoControls() -> some View {
        HStack(alignment: .center, spacing: 24) {
            Button(action: {
                viewModel.togglePlayPause()
            }, label: {
                ZStack(alignment: .center) {
                    Circle()
                        .fill(.white.opacity(0.7))
                        .frame(width: 80, height: 80)
                        .shadow(radius: 10)
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(.black)
                        }

                    Image("play")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            })
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
