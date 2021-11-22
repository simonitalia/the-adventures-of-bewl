//
//  AdventureView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 19/11/21.
//

import SwiftUI

struct AdventureView: View {
    @State private var isPresenting = false
    @State var musicPlayer: MusicPlayer?
    
    @State var isPlaying: Bool = false {
        didSet {
            if isPlaying {
                musicPlayer?.audioPlayer.play()

            } else {
                musicPlayer?.audioPlayer.pause()
            }
        }
    }
    
    let adventure: Adventure
    
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
                
                VStack(alignment: .center, spacing: 10) {
                    Image(Adventure.getImageAsset(forAdventure: adventure.name, imageAsset: .detail))
                        .resizable()
                        .scaledToFit()
                        .overlay() {
                            Color.black.opacity(0.1)
                        }
                        .cornerRadius(20)

                    // Music Controls Container
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

                            }) {
                                let imageName = isPlaying ? "pause.circle.fill" : "play.circle.fill"
                                Image(systemName: imageName)
                                    .frame(width: 50, height: 50, alignment: .center)
                               
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.horizontal)
                        }
                    }
                    .foregroundColor(Color(AppTheme.accentColor))
                }
            }
            .foregroundColor(Color(AppTheme.primaryForegroundColor))
            
        }
        .navigationTitle(adventure.name.rawValue)
        
        // navigation view toolbar button and presentation action
        .toolbar {
            Button("End Adventure") {
                isPlaying = false
                isPresenting = true
            }
            
            .fullScreenCover(isPresented: $isPresenting) {
                AdventureCompletedView(adventure: adventure)
            }
        }
        
        .onAppear {
            musicPlayer = MusicPlayer(playlistUrl: adventure.playlist.url)
        }
    }
}

struct AdventureView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureView(adventure: Adventure.sample)
    }
}
