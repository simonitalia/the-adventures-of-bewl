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
            AdventuresView()
                .tabItem {
                    Image(systemName: "bolt.circle")
                    Text("Exercises")
                }
            AdventuresView()
                .tabItem {
                    Image(systemName: "flag")
                    Text("Awards")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
            .environmentObject(Adventures())
    }
}
