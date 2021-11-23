//
//  AdventureView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 19/11/21.
//

import SwiftUI

struct AdventureView: View {
    @Environment(\.presentationMode) var PresentationMode
    @State private var isPresenting = false
    @State private var musicPlayer: MusicPlayer?
    
    @State var isPlaying: Bool = false {
        didSet {
            if isPlaying {
                musicPlayer?.audioPlayer.play()

            } else {
                musicPlayer?.audioPlayer.pause()
            }
        }
    }
    
    @State private var hasAdventureStarted = false
    
    //animation properties
    private enum BewlAnimation {
        enum notPlayingImage: String, CaseIterable {
            case eyesOpen = "bewl-eyes-open-wings-down"
            case eyesClosed = "bewl-eyes-closed-wings-down"
        }
        
        enum isPlayingImage: String, CaseIterable {
            case eyesClosedWingsDown = "bewl-eyes-closed-wings-down"
//            case eyesOpenWingsDown = "bewl-eyes-open-wings-down"
            case eyesOpenRightWingUp = "bewl-eyes-open-right-wing-up"
            case eyesOpenLeftWingUp = "bewl-eyes-open-left-wing-up"
            case eyesClosedRightWingUp = "bewl-eyes-closed-right-wing-up"
        }
    }
    
    private let bewlNotPlayingImageSet: [BewlAnimation.notPlayingImage] = {
        var images = [BewlAnimation.notPlayingImage]()
        
        BewlAnimation.notPlayingImage.allCases.forEach {
            images.append($0)
        }
        
        return images
    }()
    
    private let bewlIsPlayingImageSet: [BewlAnimation.isPlayingImage] = {
        var images = [BewlAnimation.isPlayingImage]()
        
        BewlAnimation.isPlayingImage.allCases.forEach {
            images.append($0)
        }
        
        return images
    }()
    
   
    @State var toggleNotPlayingImage = false
    private var currentBewlImage: String {
        
        switch isPlaying {
            
        case false: // current not playing image
            return toggleNotPlayingImage ? bewlNotPlayingImageSet[0].rawValue : bewlNotPlayingImageSet[1].rawValue
            
        case true: // current playing image
            return bewlIsPlayingImageSet.randomElement()?.rawValue ?? bewlIsPlayingImageSet[0].rawValue
        }
    }
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()

    @StateObject var adventure: Adventure
        //@StateObject places object into environemnt
    
    var body: some View {
        ZStack(alignment: .center) {
            Color(AppTheme.primaryBackgroundColor).edgesIgnoringSafeArea(.all)
            
            // Bewl classical adevnture image animation container
            if adventure.name == Adventure.Name.classical {
                ZStack {
                    Image(currentBewlImage)
   
                }
                .offset(x: 0, y: 100)
                .zIndex(100)
                
                .onReceive(timer) { _ in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                        toggleNotPlayingImage.toggle()
                    }
                }
            }
            
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
                                hasAdventureStarted = true

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
                hasAdventureStarted = false
            }
            .disabled(!hasAdventureStarted)
            
            .fullScreenCover(isPresented: $isPresenting) {
                AdventureCompletedView().environmentObject(adventure)
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
