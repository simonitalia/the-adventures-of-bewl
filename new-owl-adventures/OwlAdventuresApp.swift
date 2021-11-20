//
//  new_owl_adventuresApp.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

@main
struct OwlAdventuresApp: App {
    
    @StateObject var musicPlayer = MusicPlayer()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(musicPlayer)
        }
    }
}
