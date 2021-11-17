//
//  MusicPlayer.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Button("Play", action: {
//                MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "track")
//            })
//                .foregroundColor(.white)
//                .frame(width: 320, height: 52)
//                .background(Color.blue)
//            Button("Pause", action: {
//                MusicPlayer.shared.stopBackgroundMusic()
//            })
//                .foregroundColor(.white)
//                .frame(width: 320, height: 52)
//                .background(Color.blue)
//        }
//    }
//}

class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?
    
    func startBackgroundMusic(backgroundMusicFileName: String) {
        
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
        
        if let bundle = Bundle.main.path(forResource: backgroundMusicFileName, ofType: "m4a") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else {
                    return
                }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else {
            return
        }
        audioPlayer.stop()
    }
}
