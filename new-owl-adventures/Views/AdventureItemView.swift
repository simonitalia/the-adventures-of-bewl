//
//  AdventureItemView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct AdventureItemView: View {
    
    let adventure: Adventure
    
    var body: some View {
        ZStack(alignment: .center) {
            
            NavigationLink(destination: AdventureView(adventure: adventure)) {
                // background image, overlay
                Image(Adventure.getImageAsset(forAdventure: adventure.name, imageAsset: .card))
                    .resizable()
                    .scaledToFill()
                    .overlay() {
                        Color.black.opacity(0.1)
                    }
            }
            
            // view container
            VStack {
                
                //preview button container
                HStack(alignment: .center) {
                    Spacer()
                    Button {
                    } label: {
                        Image(systemName: "waveform.circle")
                            .resizable()
                            .renderingMode(.original)
                    }
                    .frame(width: 30, height: 30)
                }
                
                // text container
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 2) {
                        Spacer()
                        Text("\(adventure.name.rawValue)")
                            .font(.system(size: 22, weight: .bold, design: .serif))
                        Text("\(adventure.playlist.genre.rawValue)")
                            .font(.system(size: 20, weight: .regular, design: .serif))
                    }
                    Spacer()
                }
            }
            .foregroundColor(Color(AppTheme.primaryForegroundColor))
            .padding()
        }
        .cornerRadius(20)
        .frame(maxHeight: 257)
    }
}

struct AdventureItemView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureItemView(adventure: Adventure.sample)
            .preferredColorScheme(.dark)
    }
}
