//
//  VideoListItem.swift
//  Africa
//
//  Created by Andre Abtahi on 7/24/21.
//

import SwiftUI

struct VideoListItemView: View {
    
    // Properties
    let video: Video
    
    // Body
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail) // pulling image by video id
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }// ZSTACK
            
            VStack(alignment: .leading, spacing: 10){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }// VSTACK
        }// HSTACK
    }
}

// Preview
struct VideoListItem_Previews: PreviewProvider {
    
    static let videos: [Video] = Bundle.main.decode(file: "videos.json")
    
    static var previews: some View {
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
