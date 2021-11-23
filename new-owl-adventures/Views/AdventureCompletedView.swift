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
                ZStack(alignment: .top) {
                    Color(AppTheme.primaryBackgroundColor).edgesIgnoringSafeArea(.all)
                    
                    Image(completedAdventureImage)
                        .resizable()
                        .scaledToFill()
                        .overlay() {
                            Color.black.opacity(0.15)
                        }
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
                
                ZStack(alignment: .center) {
                    Color.black.opacity(0.7)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.4), radius: 24, x: 0, y: 12)
                    
                    Text(completedAdventureText)
                        .modifier(BodyFont())
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                        .lineSpacing(10)
                        .foregroundColor(Color(AppTheme.primaryForegroundColor))
                }
                .padding(.top, 60)
            }
        }
    }
}

struct AdventureCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureCompletedView().environmentObject(Adventure.sample)
    }
}
