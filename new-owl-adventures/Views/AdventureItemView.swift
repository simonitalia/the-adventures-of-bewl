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
        
        ZStack {
            
            // background image
            Image(adventure.imageFilename)
                .resizable()
                .scaledToFill()
            
            .frame(width: 384, height: 257)
            .cornerRadius(20)
            
            // preview button
            Button {
            } label: {
                Image(systemName: "waveform.circle")
                    .resizable()
                    .renderingMode(.original)
                    .accentColor(Color(AppTheme.primaryForegroundColor))
            }
                .frame(width: 30, height: 30, alignment: .center)
                .offset(x: 160, y: -100)
            
                 //FIXME: Remove
                .border(Color.blue)
                
            // adventure title, subtitle
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    
                    Text("\(adventure.name)")
                        .font(.system(size: 22, weight: .bold, design: .serif))
       
                    Text("\(adventure.genre)")
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .font(.title2)
                }
                    //FIXME: Remove
                    .border(Color.blue)
                    .background(Color.red)
                    .foregroundColor(.white)
                
                Spacer()
            }
                .padding(30)
        }
    }
}

struct AdventureItemView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureItemView(adventure: Adventure.sample)
    }
}
