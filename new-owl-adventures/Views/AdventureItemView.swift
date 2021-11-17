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
            Image(adventure.imageFilename)
                .resizable()
                .scaledToFill()
            .frame(width: 384, height: 257)
            .cornerRadius(20)
            .padding(.horizontal, 15)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("\(adventure.name)")
                    .font(.system(size: 22, weight: .bold, design: .serif))
   
                Text("\(adventure.genre)")
                    .font(.system(size: 20, weight: .regular, design: .serif))
                    .font(.title2)
                
            }
            
            .background(Color.red)
            .foregroundColor(.white)
        }
    }
}

struct AdventureItemView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureItemView(adventure: Adventure.sample)
    }
}
