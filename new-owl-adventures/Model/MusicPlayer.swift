//
//  MusicPlayer.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import Foundation
import AVFoundation
import SwiftUI

struct MusicPlayer {
    
    let playlist: Playlist
    var audioPlayer: AVAudioPlayer
    
    init(playlist: Playlist, numberOfLoops: Int = 1) {
        self.playlist = playlist
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: playlist.url)
            audioPlayer.numberOfLoops = numberOfLoops
            audioPlayer.prepareToPlay()
            
        } catch {
            fatalError(error.localizedDescription)
                //force app crash
        }
    }
}
