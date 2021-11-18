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
        ZStack(alignment: .leading) {
            Image(adventure.image)
                .resizable(resizingMode: .stretch)
                .frame(width: .infinity, height: 257)
                .cornerRadius(20)
                .overlay() {
                    Color.black.opacity(0.3)
                        .frame(width: .infinity, height: 257)
                        .cornerRadius(20)
                }
            VStack(alignment: .leading) {
                Text("\(adventure.name)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, -2)
                Text("\(adventure.description)")
            }
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
            .frame(width: .infinity, height: 257, alignment: .bottom)
        }
        .padding(.horizontal, 16)
//        .onTapGesture {
//            isShowingAdventureView = true
//        }
    }
}

//struct AdventureItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdventureItemView(adventure: Adventure.sample)
//            .preferredColorScheme(.dark)
//            .environmentObject(Adventures())
//    }
//}
