//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/25/21.
//

import SwiftUI
import AVKit    // audio/video kit

struct VideoPlayerView: View {
    
    //  Properties
    var videoSelected: String
    var videoTitle: String
    
    //  Body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")){
                // Text(videoTitle)
            }// VIDEOPLAYER
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                    , alignment: .topLeading
            )//Overlay
        }// VSTACK
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
