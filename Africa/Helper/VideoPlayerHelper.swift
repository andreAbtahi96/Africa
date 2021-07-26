//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Andre Abtahi on 7/25/21.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer{
    
    //  check if there is a valid video file in main app bundle with given file name and extension
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil{
        
        //  New video player with necessary info from parameters
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        
        //  Automatically plays the video
        videoPlayer!.play()
    }// END of IF
    
    return videoPlayer!
}// PLAYVIDEO
