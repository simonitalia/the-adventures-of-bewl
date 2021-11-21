//
//  MusicPlayer.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import Foundation
import AVFoundation

class MusicPlayer: ObservableObject {
    
    private let playlistUrl: URL
    var audioPlayer: AVAudioPlayer
    
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
        
    }
    
    func pauseMusic() {
        audioPlayer.pause()
    }
    
    func stopMusic() {
        audioPlayer.stop()
    }
}
