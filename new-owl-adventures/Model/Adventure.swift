//
//  Adventure.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import Foundation
import SwiftUI

enum AssetName: String, CaseIterable {
    case classical, nature, cinematic
}

enum ImageAssetName: String, CaseIterable {
    case piano, forest, cinema
}

enum PlaylistAssetName: String, CaseIterable {
    case classical = "classical", nature = "nature", cinematic = "cinematic"
}

enum Tags: String, CaseIterable  {
    case all, happy, sad, stressed, tired, demotivated, energetic
}

struct Adventure: Identifiable {
    
    enum Name: String, CaseIterable {
        case classical = "The piano-owl", nature = "The magician's potion", cinematic = "The audition"
    }
    
    enum Description: String, CaseIterable {
        case classical = "Classical music", nature = "Nature sound", cinematic = "Cinematic music"
    }
    
    enum MoodTags  {
        static let classical = [Tags.all.rawValue, Tags.happy.rawValue, Tags.energetic.rawValue]
        static let nature = [Tags.all.rawValue, Tags.stressed.rawValue, Tags.sad.rawValue]
        static let cinematic = [Tags.all.rawValue, Tags.happy.rawValue, Tags.demotivated.rawValue, Tags.tired.rawValue]
    }

    let id = UUID()
    var name: String
    let description: String
    let playlistURL: URL
    let image: String
    let moods: [String]
    
    static let sample = Adventure(name: Adventure.Name.nature.rawValue, description: Adventure.Description.nature.rawValue, playlistURL: Bundle.main.url(forResource: PlaylistAssetName.nature.rawValue, withExtension: "m4a")!, image: AssetName.nature.rawValue, moods: Adventure.MoodTags.nature)
}

class Adventures: ObservableObject {
    var list = [Adventure]()
    
    // construct list on initialilization
    init() {
        
        Adventure.Name.allCases.forEach { name in
            
            let playlistURL = getAssetURL(adventure: name)
            
            switch name {
            case .classical:
                let adventure = Adventure(
                    name: Adventure.Name.classical.rawValue,
                    description: Adventure.Description.classical.rawValue,
                    playlistURL: playlistURL!,
                    image: ImageAssetName.piano.rawValue,
                    moods: Adventure.MoodTags.classical)
                list.append(adventure)
                
            case .nature:
                let adventure = Adventure(
                    name: Adventure.Name.nature.rawValue,
                    description: Adventure.Description.nature.rawValue,
                    playlistURL: playlistURL!,
                    image: ImageAssetName.forest.rawValue,
                    moods: Adventure.MoodTags.nature)
                list.append(adventure)
                
            case .cinematic:
                let adventure = Adventure(
                    name: Adventure.Name.cinematic.rawValue,
                    description: Adventure.Description.cinematic.rawValue,
                    playlistURL: playlistURL!,
                    image: ImageAssetName.cinema.rawValue,
                    moods: Adventure.MoodTags.cinematic)
                list.append(adventure)
            }
        }
    }
    
    private func getAssetURL(adventure: Adventure.Name) -> URL? {
        
        var assetURL: URL?

        switch adventure {
        case .classical:
            assetURL = Bundle.main.url(forResource: "classical", withExtension: "m4a", subdirectory: "Playlist.bundle")
        case .nature:
            assetURL = Bundle.main.url(forResource: "nature", withExtension: "m4a", subdirectory: "Playlist.bundle")
        case .cinematic:
            assetURL = Bundle.main.url(forResource: "cinematic", withExtension: "m4a", subdirectory: "Playlist.bundle")
        }

        guard let assetURL = assetURL else {
            fatalError("Asset url not found!!")
//                 force app crash as asset url is required
        }
        
        return assetURL
    }
}
