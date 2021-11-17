//
//  Adventure.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import Foundation
import SwiftUI

enum AssetType: String {
    case image = "png", playlist = "m4a"
}

enum AssetFilename: String, CaseIterable {
    case classical = "Classical", nature = "Nature", cinematic = "Cinematic"
}

struct Adventure: Identifiable {
    
    enum Name: String, CaseIterable {
        case classical = "The pian-owl", nature = "The magician's potion", cinematic = "The audition"
    }
    
    enum Genre: String {
        case classical = "Classical music", nature = "Nature sounds", cinematic = "Cinematic music"
    }
    
    enum MoodTags  {
        static let classical = ["happy", "energetic"]
        static let nature = ["stress", "sad"]
        static let cinematic = ["happy", "demotivated", "tired"]
    }

    let id = UUID()
    let name: String
    let genre: String
    let playlistUrl: URL
    let imageFilename: String
    let moods: [String]
    
    //sample adventure object for SwiftUI Preview
    static let sample = Adventure(name: Adventure.Name.nature.rawValue, genre: Adventure.Genre.nature.rawValue, playlistUrl: Bundle.main.url(forResource: AssetFilename.nature.rawValue, withExtension: "m4a")!, imageFilename: AssetFilename.nature.rawValue, moods: Adventure.MoodTags.nature)
}

class Adventures: ObservableObject {
    var list = [Adventure]()
    
    // construct list on initialilization
    init() {
        
        Adventure.Name.allCases.forEach { name in
            
            let playlistUrl = getAssetUrl(adventure: name, assetType: .playlist)
            
            switch name {
            case .classical:
                let adventure = Adventure(
                    name: Adventure.Name.classical.rawValue,
                    genre: Adventure.Genre.classical.rawValue,
                    playlistUrl: playlistUrl,
                    imageFilename: AssetFilename.classical.rawValue,
                    moods: Adventure.MoodTags.classical)
                list.append(adventure)
                
            case .nature:
                let adventure = Adventure(
                    name: Adventure.Name.nature.rawValue,
                    genre: Adventure.Genre.nature.rawValue,
                    playlistUrl: playlistUrl,
                    imageFilename: AssetFilename.nature.rawValue,
                    moods: Adventure.MoodTags.nature)
                list.append(adventure)
                
            case .cinematic:
                let adventure = Adventure(
                    name: Adventure.Name.cinematic.rawValue,
                    genre: Adventure.Genre.cinematic.rawValue,
                    playlistUrl: playlistUrl,
                    imageFilename: AssetFilename.cinematic.rawValue,
                    moods: Adventure.MoodTags.cinematic)
                list.append(adventure)
            }
        }
    }
    
    private func getAssetUrl(adventure: Adventure.Name, assetType: AssetType) -> URL {
        
        let assetUrl: URL?
        
        switch adventure {
        case .classical:
            assetUrl = Bundle.main.url(forResource: AssetFilename.classical.rawValue, withExtension: assetType.rawValue)
            
        case .nature:
            assetUrl = Bundle.main.url(forResource: AssetFilename.nature.rawValue, withExtension: assetType.rawValue)
            
        case .cinematic:
            assetUrl = Bundle.main.url(forResource: AssetFilename.cinematic.rawValue, withExtension: assetType.rawValue)
        }
        
        guard let assetUrl = assetUrl else {
            fatalError("Asset url not found!!")
                // force app crash as asset url is required
        }
        
        return assetUrl
    }
}
