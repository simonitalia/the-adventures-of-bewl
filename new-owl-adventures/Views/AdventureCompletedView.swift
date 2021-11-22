//
//  AdventureCompletedView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 21/11/21.
//

import SwiftUI

struct AdventureCompletedView: View {
    @Environment(\.presentationMode) var PresentationMode

    let adventure: Adventure
    
    var completedAdventureText: String {
        
        switch adventure.name {
        case .classical:
            return "We did amazing team work!\nWe have collected a DO note!"
            
        case .nature:
            return "We did amazing team work!\nThe wizard cooked the potion!"
            
        case .cinematic:
            return "We did amazing team work!\nBewl was cast as the leading Ownl!"
        
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color(AppTheme.primaryBackgroundColor).edgesIgnoringSafeArea(.all)
                
                Image(adventure.detailImage)
                    .resizable()
                    .scaledToFill()
                    .overlay() {
                        Color.black.opacity(0.1)
                    }
                
                VStack(alignment: .center) {
                    Text(completedAdventureText)
                        .font(.system(size: 18, weight: .bold, design: .serif))
                        .foregroundColor(Color(AppTheme.primaryForegroundColor))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 400, height: 100, alignment: .center)
                                    .opacity(0.3)
                        )
                }
                .padding(40)
            }
            .navigationBarTitleDisplayMode(.inline) //small navigation bar
            .toolbar {
                Button("Done") {
                    PresentationMode.wrappedValue.dismiss()
                }
            }
        }
        .opacity(0.9)
    }
}

struct AdventureCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureCompletedView(adventure: Adventure.sample)
    }
}
