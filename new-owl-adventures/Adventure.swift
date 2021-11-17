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

enum AssetFilename: String {
    case classical = "Classical", nature = "Nature", cinematic = "Cinematic"
}

struct Adventure: Identifiable {
    
    enum Name: String, CaseIterable {
        case classical = "The pian-owl", nature = "The magician's potion", cinematic = "The audition"
    }
    
    enum MoodTags  {
        static let classical = ["happy", "energetic"]
        static let nature = ["stress", "sad"]
        static let cinematic = ["happy", "demotivated", "tired"]
    }

    let id = UUID()
    let name: String
    let playlistUrl: URL
    let imageUrl: URL
    let moods: [String]
}

struct Adventures {
    var list = [Adventure]()
    
    // construct list on initialilization
    init() {
        
        Adventure.Name.allCases.forEach { name in
            
            let playlistUrl = getAssetUrl(adventure: name, assetType: .playlist)
            let imageUrl = getAssetUrl(adventure: name, assetType: .image)
            
            switch name {
            case .classical:
                let adventure = Adventure(
                    name: name.rawValue,
                    playlistUrl: playlistUrl,
                    imageUrl: imageUrl,
                    moods: Adventure.MoodTags.classical)
                list.append(adventure)
                
            case .nature:
                let adventure = Adventure(
                    name: name.rawValue,
                    playlistUrl: playlistUrl,
                    imageUrl: imageUrl,
                    moods: Adventure.MoodTags.nature)
                list.append(adventure)
                
            case .cinematic:
                let adventure = Adventure(
                    name: name.rawValue,
                    playlistUrl: playlistUrl,
                    imageUrl: imageUrl,
                    moods: Adventure.MoodTags.cinematic)
                list.append(adventure)
            }
        }
    }
    
    private func getAssetUrl(adventure: Adventure.Name, assetType: AssetType) -> URL {

        guard let assetUrl = Bundle.main.url(forResource: adventure.rawValue, withExtension: assetType.rawValue) else {
            fatalError("Asset url not found!!")
                // force app crash as asset url is required
        }
        
        return assetUrl
    }
}
