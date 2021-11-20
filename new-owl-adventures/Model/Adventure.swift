//
//  Adventure.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import Foundation
import SwiftUI

struct Adventure: Identifiable {
    
    enum Name: String, CaseIterable {
        case classical = "The piano-owl", nature = "The magician's potion", cinematic = "The audition"
    }
    
    enum Description: String {
        case classical = "Bewl wants to learn to play the piano, starting with Beethoven's 5th Symphony. Why don’t you help him?",
             nature = "A wizard is making a love potion and needs Bewl's help to pick herbs, flowers and berries from the forest. Let's get them!",
             cinematic = "National Geographic is casting actors to play the lead Owl in a documentary movie. Bewl can’t miss this opportunity, and neither can you!"
    }
    
    enum ImageAsset {
        
        enum ImageType {
            case card, detail
        }
        
        enum CardImageName: String {
            case piano, forest, cinema
        }
        
        enum DetailImageName: String {
            case pianoDetail, forestDetail, cinemaDetail
        }
    }
    
    let id = UUID()
    var name: Adventure.Name
    let description: Description
    let playlist: Playlist
    let cardImage: String
    let detailImage: String
    
    static let sample = Adventure(name: Adventure.Name.nature, description: Description.nature, playlist: Playlist(playlistGenre: .nature), cardImage: Adventure.getImageAsset(forAdventure: Adventure.Name.nature, imageAsset: .card), detailImage: Adventure.getImageAsset(forAdventure: Adventure.Name.nature, imageAsset: .detail))
    
    static func getImageAsset(forAdventure name: Adventure.Name, imageAsset type: ImageAsset.ImageType) -> String {
        
        switch name {
            
        case .classical:
            return type == .card ? ImageAsset.CardImageName.piano.rawValue : ImageAsset.DetailImageName.pianoDetail.rawValue
        
        case .nature:
            return type == .card ? ImageAsset.CardImageName.forest.rawValue : ImageAsset.DetailImageName.forestDetail.rawValue
        
        case .cinematic:
            return type == .card ? ImageAsset.CardImageName.cinema.rawValue : ImageAsset.DetailImageName.cinemaDetail.rawValue
        }
    }
}

class Adventures {
    var list = [Adventure]()
    
    // construct list on initialization
    init() {
        
        Adventure.Name.allCases.forEach { name in
            
            switch name {
            case .classical:
                let adventure = Adventure(
                    name: Adventure.Name.classical,
                    description: .classical,
                    playlist: Playlist(playlistGenre: .classical),
                    cardImage: Adventure.getImageAsset(forAdventure: name, imageAsset: .card),
                    detailImage: Adventure.getImageAsset(forAdventure: name, imageAsset: .detail))
                list.append(adventure)
                
            case .nature:
                let adventure = Adventure(
                    name: Adventure.Name.nature,
                    description: .nature,
                    playlist: Playlist(playlistGenre: .nature),
                    cardImage: Adventure.getImageAsset(forAdventure: name, imageAsset: .card),
                    detailImage: Adventure.getImageAsset(forAdventure: name, imageAsset: .detail))
                list.append(adventure)
                
            case .cinematic:
                let adventure = Adventure(
                    name: Adventure.Name.cinematic,
                    description: .cinematic,
                    playlist: Playlist(playlistGenre: .cinematic),
                    cardImage: Adventure.getImageAsset(forAdventure: name, imageAsset: .card),
                    detailImage: Adventure.getImageAsset(forAdventure: name, imageAsset: .detail))
                list.append(adventure)
            }
        }
    }
}
