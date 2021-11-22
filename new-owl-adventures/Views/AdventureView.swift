//
//  AdventureView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 19/11/21.
//

import SwiftUI

struct AdventureView: View {
    @State private var isPresenting = false
    
    let adventure: Adventure
    var musicPlayer: MusicPlayer {
        return MusicPlayer(playlistUrl: adventure.playlist.url)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(AppTheme.primaryBackgroundColor).edgesIgnoringSafeArea(.all)
        
            // Genre, description text container
            VStack(alignment: .leading, spacing: 10) {
                Text("\(adventure.playlist.genre.rawValue)")
                    .font(.system(size: 22, weight: .bold, design: .serif))
                    .padding(.horizontal)
                    
                Text("\(adventure.description.rawValue)")
                    .font(.system(size: 20, weight: .regular, design: .serif))
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal)
                   
                Divider()
                    Color(AppTheme.primaryForegroundColor)
                    .frame(maxHeight: 2)
                    .padding(.horizontal)
                
                // timer container
                HStack(alignment: .top) {
                    Text("Would you like to set a Timer?")
                        .font(.system(size: 18, weight: .regular, design: .serif))
                    Spacer()
                    Text("0:00")
                        .foregroundColor(Color(AppTheme.accentColor))
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(AppTheme.accentColor), lineWidth: 2)
                        )
                        .font(.system(size: 18))
                }
                .padding(.horizontal)
                
                VStack(alignment: .center, spacing: 0) {
                    Image(Adventure.getImageAsset(forAdventure: adventure.name, imageAsset: .detail))
                        .resizable()
                        .scaledToFit()
                        .overlay() {
                            Color.black.opacity(0.1)
                        }
                    
                    MusicPlayerControlsView(
                        playlistCoverImage: adventure.cardImage,
                        playlistName: adventure.name.rawValue,
                        musicPlayer: musicPlayer
                    )
                }
            }
            .foregroundColor(Color(AppTheme.primaryForegroundColor))
            
        }
        .navigationTitle(adventure.name.rawValue)
        
        // navigation view toolbar button and presentation action
        .toolbar {
            Button("End Adventure") {
                isPresenting.toggle()
            }
            
            .fullScreenCover(isPresented: $isPresenting) {
                AdventureCompletedView(adventure: adventure)
            }
        }
    }
}

struct AdventureView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureView(adventure: Adventure.sample)
    }
}
