//
//  VideoListView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/5/21.
//

import SwiftUI

struct VideoListView: View {
    
    // Property
    @State var videos: [Video] = Bundle.main.decode(file: "videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // Body
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }// LOOP
            }// LIST
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        // Shuffle Videos
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }// TOOLBARITEM
            }
        }// NAVIGATION
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
