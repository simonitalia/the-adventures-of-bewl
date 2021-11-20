//
//  Filter.swift
//  new-owl-adventures
//
//  Created by Vitaly on 18/11/21.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var selectedMood: String
    var playlist: Playlist
    
    var body: some View {
        ScrollView(.horizontal) {
            Picker("Choose your mood", selection: $selectedMood, content: {
                ForEach(playlist.moodTags, id: \.self) { mood in
                    Text("\(mood.rawValue.capitalized)")
                        .tag(mood)
                }
            })
                .pickerStyle(.segmented)
                .background(Color.gray)
                .cornerRadius(10)
                
        }
        .padding(16)
    }
}
