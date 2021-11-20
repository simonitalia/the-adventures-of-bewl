//
//  PlaylistGenre.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 19/11/21.
//

import Foundation

struct Playlist {
    
    enum PlaylistAssetName: String {
        case classical = "Classical", nature = "Nature", cinematic = "Cinematic"
    }
    
    enum Genre: String, CaseIterable {
        case classical = "Classical music", nature = "Nature sound", cinematic = "Cinematic music"
    }
    
    enum Mood: String, CaseIterable  {
        case all, happy, sad, stressed, tired, demotivated, energetic
    }
    
    let genre: Genre
    let moodTags: [Mood]
    var playlistURL: URL {
        return getPlaylistURL(for: genre)
    }
    
    init(playlistGenre: Genre) {
        self.genre = playlistGenre
        
        switch playlistGenre {
        case .classical:
            self.moodTags = [Mood.all, Mood.happy, Mood.energetic]

        case .nature:
            self.moodTags = [Mood.all, Mood.stressed, Mood.sad]
        
        case .cinematic:
            self.moodTags = [Mood.all, Mood.happy, Mood.demotivated, Mood.tired]
        }
    }
    
    private func getPlaylistURL(for genre: Genre) -> URL {
        
        var assetURL: URL?

        switch genre {
        case .classical:
            assetURL = Bundle.main.url(forResource: PlaylistAssetName.classical.rawValue, withExtension: "m4a")
            
        case .nature:
            assetURL = Bundle.main.url(forResource: PlaylistAssetName.nature.rawValue, withExtension: "m4a")
            
        case .cinematic:
            assetURL = Bundle.main.url(forResource: PlaylistAssetName.cinematic.rawValue, withExtension: "m4a")
        }

        guard let assetURL = assetURL else {
            fatalError("Asset url not found!!")
                // force app crash as asset url is required
        }
        
        return assetURL
    }
}

