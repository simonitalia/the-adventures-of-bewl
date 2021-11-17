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

class Adventures: ObservableObject {
    var list = [Adventure]()
    
    // construct list on initialilization
    init() {
        
        AssetFilename.allCases.forEach { filename in
            
            let playlistUrl = getAssetUrl(forAsset: filename, assetType: .playlist)
            let imageUrl = getAssetUrl(forAsset: filename, assetType: .image)
            
            switch filename {
            case .classical:
                let adventure = Adventure(
                    name: Adventure.Name.classical.rawValue,
                    playlistUrl: playlistUrl,
                    imageUrl: imageUrl,
                    moods: Adventure.MoodTags.classical)
                list.append(adventure)
                
            case .nature:
                let adventure = Adventure(
                    name: Adventure.Name.nature.rawValue,
                    playlistUrl: playlistUrl,
                    imageUrl: imageUrl,
                    moods: Adventure.MoodTags.nature)
                list.append(adventure)
                
            case .cinematic:
                let adventure = Adventure(
                    name: Adventure.Name.cinematic.rawValue,
                    playlistUrl: playlistUrl,
                    imageUrl: imageUrl,
                    moods: Adventure.MoodTags.cinematic)
                list.append(adventure)
            }
        }
    }
    
    private func getAssetUrl(forAsset: AssetFilename, assetType: AssetType) -> URL {
        
//        let assetUrl: URL?
//
//        switch adventure {
//
//        case .classical:
//            assetUrl = Bundle.main.url(forResource: adventure.rawValue, withExtension: assetType.rawValue)
//
//        case .nature:
//            <#code#>
//        case .cinematic:
//            <#code#>
//        }

        guard let assetUrl = Bundle.main.url(forResource: forAsset.rawValue, withExtension: assetType.rawValue) else {
            fatalError("Asset url not found!!")
                // force app crash as asset url is required
        }
        
        return assetUrl
    }
}
