//
//  MusicPlayerControlsView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 20/11/21.
//

import SwiftUI

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemChromeMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct MusicPlayerControlsView: View {
    
    let nowPlayingAdventureName: Adventure.Name
    let nowPlayingAdventureImage: String
    let blur = Blur()
    
    @State var isPlaying = false

    var body: some View {
        
        //Container
        ZStack {
            Rectangle()
                .foregroundColor(Color(AppTheme.primaryForegroundColor))
                .opacity(0)
            .frame(width: UIScreen.main.bounds.size.width, height: 65)
            .background(blur)
            .overlay() {
                Color.black.opacity(0.1)
            }
            
            // controls container
            HStack {
                Button(action: {}) {
                    HStack {
                        Image(nowPlayingAdventureImage)
                            .resizable()
                            .frame(width: 45, height: 45)
                            .shadow(radius: 10, x: 0, y: 3)
                            .padding(.leading)
                        Text(nowPlayingAdventureName.rawValue)
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    isPlaying.toggle()
                }) {
                    let imageName = isPlaying ? "play.circle.fill" : "pause.circle.fill"
                    Image(systemName: imageName).font(.title3)
                   
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
            }
        }
        .foregroundColor(Color(AppTheme.accentColor))
    }
}

struct MusicPlayerControlsView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerControlsView(nowPlayingAdventureName: Adventure.Name.classical, nowPlayingAdventureImage: "piano")
    }
}
