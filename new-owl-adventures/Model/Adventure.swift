//
//  Adventure.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import Foundation
import SwiftUI

struct Adventure: Identifiable {
    
    enum ImageAssetName: String {
        case piano = "piano", forest = "forest", cinema = "cinema"
    }

    enum PlaylistAssetName: String, CaseIterable {
        case classical = "Classical", nature = "Nature", cinematic = "Cinematic"
    }
    
    enum Name: String, CaseIterable {
        case classical = "The piano-owl", nature = "The magician's potion", cinematic = "The audition"
    }
    
    enum Genre: String, CaseIterable {
        case classical = "Classical music", nature = "Nature sound", cinematic = "Cinematic music"
    }
    
    enum Tags: String, CaseIterable  {
        case all, happy, sad, stressed, tired, demotivated, energetic
    }
    
    enum MoodTags  {
        static let classical = [Tags.all.rawValue, Tags.happy.rawValue, Tags.energetic.rawValue]
        static let nature = [Tags.all.rawValue, Tags.stressed.rawValue, Tags.sad.rawValue]
        static let cinematic = [Tags.all.rawValue, Tags.happy.rawValue, Tags.demotivated.rawValue, Tags.tired.rawValue]
    }

    let id = UUID()
    var name: Adventure.Name
    let genre: Adventure.Genre
    let playlistURL: URL
    let image: Adventure.ImageAssetName
    let moods: [String]
    
    static let sample = Adventure(name: Adventure.Name.nature, genre: Adventure.Genre.nature, playlistURL: Bundle.main.url(forResource: Adventure.PlaylistAssetName.nature.rawValue, withExtension: "m4a")!, image: Adventure.ImageAssetName.forest, moods: MoodTags.nature)
}

class Adventures {
    var list = [Adventure]()
    
    // construct list on initialization
    init() {
        
        Adventure.Name.allCases.forEach { name in
            
            let playlistURL = getAssetURL(forAdventure: name)
            
            switch name {
            case .classical:
                let adventure = Adventure(
                    name: Adventure.Name.classical,
                    genre: Adventure.Genre.classical,
                    playlistURL: playlistURL,
                    image: Adventure.ImageAssetName.piano,
                    moods: Adventure.MoodTags.classical)
                list.append(adventure)
                
            case .nature:
                let adventure = Adventure(
                    name: Adventure.Name.nature,
                    genre: Adventure.Genre.nature,
                    playlistURL: playlistURL,
                    image: Adventure.ImageAssetName.forest,
                    moods: Adventure.MoodTags.nature)
                list.append(adventure)
                
            case .cinematic:
                let adventure = Adventure(
                    name: Adventure.Name.cinematic,
                    genre: Adventure.Genre.cinematic,
                    playlistURL: playlistURL,
                    image: Adventure.ImageAssetName.cinema,
                    moods: Adventure.MoodTags.cinematic)
                list.append(adventure)
            }
        }
    }
    
    private func getAssetURL(forAdventure name: Adventure.Name) -> URL {
        
        var assetURL: URL?

        switch name {
        case .classical:
            assetURL = Bundle.main.url(forResource: Adventure.PlaylistAssetName.classical.rawValue, withExtension: "m4a")
        case .nature:
            assetURL = Bundle.main.url(forResource: Adventure.PlaylistAssetName.nature.rawValue, withExtension: "m4a")
        case .cinematic:
            assetURL = Bundle.main.url(forResource: Adventure.PlaylistAssetName.cinematic.rawValue, withExtension: "m4a")
        }

        guard let assetURL = assetURL else {
            fatalError("Asset url not found!!")
                // force app crash as asset url is required
        }
        
        return assetURL
    }
}
