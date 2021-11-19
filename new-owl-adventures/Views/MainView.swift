//
//  MainView.swift
//  new-owl-adventures
//
//  Created by Vitaly on 18/11/21.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        TabView {
            AdventuresView()
                .tabItem {
                    Image(systemName: "music.note.tv")
                    Text("Adventures")
                }
                .tag(0)
                
                
            ExercisesView()
                .tabItem {
                    Image(systemName: "brain")
                    Text("Exercises")
                }
                .tag(1)
            
            AwardsView()
                .tabItem {
                    Image(systemName: "rosette")
                    Text("Awards")
                }
                .tag(2)
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = AppTheme.primaryBackgroundColor
            UITabBar.appearance().unselectedItemTintColor = AppTheme.primaryForegroundColor
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
