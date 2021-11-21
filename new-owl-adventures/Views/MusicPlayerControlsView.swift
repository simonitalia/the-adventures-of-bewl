//
//  MusicPlayerControlsView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 20/11/21.
//

import SwiftUI

struct MusicPlayerControlsView: View {
    
    let adventure: Adventure
    @State var musicPlayer: MusicPlayer!
    @State var isPlaying = false

    var body: some View {
        
        //Container
        ZStack {
            Rectangle()
                .opacity(0)
            .frame(width: UIScreen.main.bounds.size.width, height: 65)
            .background(Color(AppTheme.primaryBackgroundColor))
            .overlay() {
                Color.white.opacity(0.1)
            }
            
            // controls container
            HStack {
                Button(action: {}) {
                    HStack {
                        Image(adventure.cardImage)
                            .resizable()
                            .frame(width: 45, height: 45)
                            .shadow(radius: 10, x: 0, y: 3)
                            .padding(.leading)
                        Text(adventure.name.rawValue)
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    isPlaying.toggle()
                    
                    if isPlaying {
                        musicPlayer.audioPlayer.play()
                    
                    } else {
                        musicPlayer.audioPlayer.pause()
                    }
                    
                }) {
                    let imageName = isPlaying ? "pause.circle.fill" : "play.circle.fill"
                    Image(systemName: imageName).font(.title3)
                   
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
            }
        }
        .foregroundColor(Color(AppTheme.accentColor))
        .onAppear {
            musicPlayer = MusicPlayer(playlistUrl: adventure.playlist.url)
        }
    }
}

struct MusicPlayerControlsView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerControlsView(adventure: Adventure.sample, musicPlayer: nil)
    }
}
