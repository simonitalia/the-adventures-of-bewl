//
//  AdventureView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 19/11/21.
//

import SwiftUI

struct AdventureView: View {
    
    let adventure: Adventure
    
    @State var timeRemaining = 0
    
    
    var body: some View {
        ZStack {
            Color(AppTheme.primaryBackgroundColor).edgesIgnoringSafeArea(.all)
        
            // Genre, description text container
            VStack(alignment: .leading, spacing: 12) {
                Spacer()
                Text("\(adventure.playlist.genre.rawValue)")
                    .font(.system(size: 20, weight: .bold, design: .serif))
                Text("\(adventure.description.rawValue)")
                    .font(.system(size: 18, weight: .regular, design: .serif))
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                
                Divider()
                    Color(AppTheme.primaryForegroundColor)
                    .frame(maxHeight: 2)
                
                // timer container
                HStack(alignment: .top) {
                    Text("Would you like to set a Timer?")
                        .font(.system(size: 18, weight: .regular, design: .serif))
                    Spacer()
                    Text("0:00")
                        .foregroundColor(Color(AppTheme.accentColor))
                        .padding(5)
                        .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(AppTheme.accentColor), lineWidth: 2)
                        )
                        .font(.system(size: 16))
                }
                
                Image(Adventure.getImageAsset(forAdventure: adventure.name, imageAsset: .detail))
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(20)
                Spacer()
            }
            .padding()
            .foregroundColor(Color(AppTheme.primaryForegroundColor))
        }
        .navigationTitle(adventure.name.rawValue)
    }
}

struct AdventureView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureView(adventure: Adventure.sample)
    }
}
