//
//  MainView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            AdventuresView()
                .tabItem {
                    Label("Adventures", systemImage: "music.note.tv")
             }
            
            ExercisesView()
                .tabItem {
                    Label("Exercises", systemImage: "brain")
            }
            
            AwardsView()
                .tabItem {
                    Label("Awards", systemImage: "rosette")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
