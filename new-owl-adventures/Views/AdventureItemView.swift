//
//  AdventureItemView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct AdventureItemView: View {
    
    let adventure: Adventure
    let gradient = [
        Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 1),
        Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0)
    ]
    
    var body: some View {
        ZStack(alignment: .center) {
            Image(Adventure.getImageAsset(forAdventure: adventure.name, imageAsset: .card))
                .resizable()
                .scaledToFill()
                .overlay() {
                    LinearGradient(colors: gradient, startPoint: .bottom, endPoint: .center)
                }
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
                            .modifier(TitleFont())
                            .padding(.bottom, 2)
                        Text("\(adventure.playlist.genre.rawValue)")
                            .modifier(BodyFont())
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
    }
}
