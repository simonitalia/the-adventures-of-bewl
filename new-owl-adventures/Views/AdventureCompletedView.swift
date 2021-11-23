//
//  AdventureCompletedView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 21/11/21.
//

import SwiftUI

struct AdventureCompletedView: View {
    @Environment(\.presentationMode) var PresentationMode

    @EnvironmentObject var adventure: Adventure
    
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
    
    var completedAdventureImage: String {
        switch adventure.name {
        
        case .classical:
            return "pianoCompleted"
            
        case .nature:
            return "forestCompleted"
            
        case .cinematic:
            return "cinemaCompleted"
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color(AppTheme.primaryBackgroundColor).edgesIgnoringSafeArea(.all)
                
                Image(completedAdventureImage)
                    .resizable()
                    .scaledToFill()
                    .overlay() {
                        Color.black.opacity(0.1)
                    }
                
                RoundedRectangle(cornerRadius: 20)
                            .frame(width: 400, height: 100, alignment: .center)
                            .opacity(0.7)
                            .padding(40)
                
                Text(completedAdventureText)
                    .font(.system(size: 18, weight: .bold, design: .serif))
                    .foregroundColor(Color(AppTheme.primaryForegroundColor))
                    .padding(65)
            }
            .navigationBarTitleDisplayMode(.inline) //small navigation bar
            
            .onDisappear {
                adventure.isAdventureCompleted = true
            }
            
            .toolbar {
                Button("Done") {
                    PresentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct AdventureCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureCompletedView().environmentObject(Adventure.sample)
    }
}
