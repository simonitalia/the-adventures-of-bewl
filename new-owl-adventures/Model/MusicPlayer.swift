//
//  MusicPlayer.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import Foundation
import AVFoundation
import SwiftUI

class MusicPlayer: ObservableObject {
    
    private let playlistUrl: URL
    var audioPlayer: AVAudioPlayer
    var isPlaying = false
    
    init(playlistUrl: URL) {
        self.playlistUrl = playlistUrl
        
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
        
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: playlistUrl)
            self.audioPlayer.numberOfLoops = -1
            
        } catch {
            fatalError(error.localizedDescription)
                //force app crash
        }
    }
    
    func playMusic() {
        audioPlayer.play()
        isPlaying = true
    }
    
    func pauseMusic() {
        audioPlayer.pause()
        isPlaying = false
    }
    
    func stopMusic() {
        audioPlayer.stop()
        isPlaying = false
    }
}
