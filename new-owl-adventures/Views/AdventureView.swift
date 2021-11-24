//
//  AdventureView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 19/11/21.
//

import SwiftUI

struct AdventureView: View {
    @Environment(\.presentationMode) var PresentationMode
    @StateObject var adventure: Adventure
    @State private var isPresenting = false
    @State private var musicPlayer: MusicPlayer?
    
    //animation properties
    private enum BewlAnimationImage {
        enum notPlaying: String, CaseIterable {
            case eyesOpen = "bewl-eyes-open-wings-down"
            case eyesClosed = "bewl-eyes-closed-wings-down"
        }
        
        enum isPlaying: String, CaseIterable {
            case eyesClosedWingsDown = "bewl-eyes-closed-wings-down"
            case eyesOpenRightWingUp = "bewl-eyes-open-right-wing-up"
            case eyesOpenLeftWingUp = "bewl-eyes-open-left-wing-up"
            case eyesClosedRightWingUp = "bewl-eyes-closed-right-wing-up"
        }
    }
    
    private let bewlNotPlayingImageSet: [BewlAnimationImage.notPlaying] = {
        var images = [BewlAnimationImage.notPlaying]()
        
        BewlAnimationImage.notPlaying.allCases.forEach {
            images.append($0)
        }
        
        return images
    }()
    
    private let bewlIsPlayingImageSet: [BewlAnimationImage.isPlaying] = {
        var images = [BewlAnimationImage.isPlaying]()
        
        BewlAnimationImage.isPlaying.allCases.forEach {
            images.append($0)
        }
        
        return images
    }()
    
    @State private var toggleNotPlayingImage = false
    private var currentBewlImage: String {
        
        switch musicPlayer?.audioPlayer.isPlaying {
            
        case true: // current playing image
            return bewlIsPlayingImageSet.randomElement()?.rawValue ?? bewlIsPlayingImageSet[0].rawValue
            
        default: // current not playing image
            return toggleNotPlayingImage ? bewlNotPlayingImageSet[0].rawValue : bewlNotPlayingImageSet[1].rawValue
        }
    }
    
    private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(AppTheme.primaryBackgroundColor).edgesIgnoringSafeArea(.all)
            
            // Bewl classical adevnture image animation container
            if adventure.name == Adventure.Name.classical {
                ZStack {
                    Image(currentBewlImage)
                    
                }
                .offset(x: 0, y: 398)
                .zIndex(100)
                
                .onReceive(timer) { _ in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                        toggleNotPlayingImage.toggle()
                    }
                }
            }
            
            // Genre, description text container
            ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(adventure.playlist.genre.rawValue)")
                    .modifier(TitleFont())
                    .padding(.bottom, 2)
                    .padding(.horizontal, 20)
                
                Text("\(adventure.description.rawValue)")
                    .modifier(BodyFont())
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                
                Divider()
                    .frame(maxHeight: 2)
                    .background(Color(AppTheme.primaryForegroundColor))
                    .padding(.bottom, 8)
                    .padding(.horizontal, 20)
                
                
                // timer container
                HStack {
                    Text("Would you like to set a Timer?")
                        .modifier(BodyFont())
                    Spacer()
                    Text("0:00")
                        .modifier(BodyFont())
                        .foregroundColor(Color(AppTheme.accentColor))
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color(AppTheme.accentColor), lineWidth: 2)
                        )
                }
                .padding(.horizontal, 20)
                
                Divider()
                    .frame(height: 20)
                
                Image(Adventure.getImageAsset(forAdventure: adventure.name, imageAsset: .detail))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay() {
                            Color.black.opacity(0.15)
                        }
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
            }
            .foregroundColor(Color(AppTheme.primaryForegroundColor))
            
                // Music Controls Container
                ZStack {
                    Rectangle()
                        .opacity(0)
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
                                    .frame(width: 48, height: 48)
                                    .cornerRadius(4)
                                    .shadow(color: Color.black.opacity(1), radius: 4, x: 2, y: 2)
                                    .padding(.leading, 20)
                                Text(adventure.name.rawValue)
                                    .modifier(BodyFont())
                                    .padding(.leading, 10)
                                Spacer()
                            }
                        }
                        .buttonStyle(PlainButtonStyle())

                        Button(action: {
                            if musicPlayer?.audioPlayer.isPlaying == true {
                                musicPlayer?.audioPlayer.pause()
                        
                            } else {
                                musicPlayer?.audioPlayer.play()
                            }
                            
                            adventure.isAdventureInProgress = true

                        }) {
                            let imageName = musicPlayer?.audioPlayer.isPlaying == true ? "pause.circle.fill" : "play.circle.fill"
                            Image(systemName: imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 28, height: 28, alignment: .center)
                                .padding(.trailing, 8)

                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal)
                    }
                }
                .frame(height: 64)
                .foregroundColor(Color(AppTheme.accentColor))
                .cornerRadius(8)
                
            }
        }
        .padding(.top, 24)
        .navigationTitle(adventure.name.rawValue)
        
        .onAppear {
            musicPlayer = MusicPlayer(playlist: adventure.playlist)
        }
        
        .onChange(of: adventure.isAdventureCompleted) { _ in
            if adventure.isAdventureCompleted {
                PresentationMode.wrappedValue.dismiss()
            }
        }
        
        .onDisappear {
            adventure.isAdventureCompleted = false
        }
        
        // navigation view toolbar button and presentation action
        .toolbar {
            Button("End Adventure") {
                musicPlayer?.audioPlayer.stop()
                isPresenting = true
                    // trigger presentation of adventure completed view
            }
            .disabled(!adventure.isAdventureInProgress)
            
            .fullScreenCover(isPresented: $isPresenting) {
                AdventureCompletedView().environmentObject(adventure)
            }
        }
    }
}

struct AdventureView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureView(adventure: Adventure.sample)
    }
}
