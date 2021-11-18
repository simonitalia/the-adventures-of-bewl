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
    case classical, nature, cinematic
}

enum PlaylistAssetName: String, CaseIterable {
    case piano, forest, cinema
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
    let playlist: String
    let image: String
    let moods: [String]
}

class Adventures: ObservableObject {
    var list = [Adventure]()
    
    // construct list on initialilization
    init() {
        
        AssetName.allCases.forEach { filename in
            
//            let playlistURL = getAssetURL(forAsset: filename, assetType: .playlist)
//            let imageURL = getAssetURL(forAsset: filename, assetType: .image)
            
            switch filename {
            case .classical:
                let adventure = Adventure(
                    name: Adventure.Name.classical.rawValue,
                    description: Adventure.Description.classical.rawValue,
                    playlist: PlaylistAssetName.piano.rawValue,
                    image: ImageAssetName.classical.rawValue,
                    moods: Adventure.MoodTags.classical)
                list.append(adventure)
                
            case .nature:
                let adventure = Adventure(
                    name: Adventure.Name.nature.rawValue,
                    description: Adventure.Description.nature.rawValue,
                    playlist: PlaylistAssetName.forest.rawValue,
                    image: ImageAssetName.nature.rawValue,
                    moods: Adventure.MoodTags.nature)
                list.append(adventure)
                
            case .cinematic:
                let adventure = Adventure(
                    name: Adventure.Name.cinematic.rawValue,
                    description: Adventure.Description.cinematic.rawValue,
                    playlist: PlaylistAssetName.cinema.rawValue,
                    image: ImageAssetName.cinematic.rawValue,
                    moods: Adventure.MoodTags.cinematic)
                list.append(adventure)
            }
        }
    }
    
//    private func getAssetURL(forAsset: AssetFilename, assetType: AssetType) -> URL {
        
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

//        guard let assetURL = Bundle.main.url(forResource: forAsset.rawValue, withExtension: assetType.rawValue) else {
//            fatalError("Asset url not found!!")
//                 force app crash as asset url is required
//        }
        
//        return assetURL
//    }
}
