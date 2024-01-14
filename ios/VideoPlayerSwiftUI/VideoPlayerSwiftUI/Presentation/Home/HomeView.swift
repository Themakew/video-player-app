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
                if let videoData = viewModel.selectedVideoData {
                    Text(videoData.title)
                }
            }
        }
        .task {
            await viewModel.loadData()
        }
    }
}
