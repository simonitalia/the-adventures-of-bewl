//
//  AdventureItemView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct AdventureItemView: View {
    
    @Binding var isShowingAdventureView: Bool
    let currentAdventure: Adventure
    let name: String
    let description: String
    let backgroundImage: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(backgroundImage)
                .resizable(resizingMode: .stretch)
                .frame(width: .infinity, height: 257)
                .cornerRadius(20)
                .overlay() {
                    Color.black.opacity(0.3)
                        .frame(width: .infinity, height: 257)
                        .cornerRadius(20)
                }
            VStack(alignment: .leading) {
                Text("\(name)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, -2)
                Text("\(description)")
            }
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
            .frame(width: .infinity, height: 257, alignment: .bottom)
        }
        .padding(.horizontal, 16)
        .onTapGesture {
            self.isShowingAdventureView = true
        }
    }
}
