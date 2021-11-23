//
//  ContentView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct AdventuresView: View {
    @State private var searchText = ""

    private let adventures = Adventures().list
    
    // store search adventures matching name or mood
    private var searchAdventures: [Adventure] {
        var filteredAdventures: [Adventure]
        
        if searchText.isEmpty {
            return adventures
        
        } else {
            
            // match by adventure name
            filteredAdventures = adventures.filter { adventure in
                adventure.name.rawValue.lowercased().contains(searchText.lowercased())
            }
            
            // match by mood
            if filteredAdventures.isEmpty {
                filteredAdventures = adventures.filter { adventure in
                    adventure.playlist.moodTags.contains(where: { $0.rawValue.contains(searchText) } )
                }
            }
        }
        
        return filteredAdventures
    }
    
    // list of search suggestions
    private var searchSuggestions: [String] {
        var names = [String]()
        adventures.forEach { names.append($0.name.rawValue) }
        return names
    }
    
    // list of moods
    private let moodsFilter: [Playlist.Mood] = {
        var items = [Playlist.Mood]()
        
        Playlist.Mood.allCases.forEach { mood in
            items.append(mood)
        }
        
        return items
    }()
    
    var body: some View {
        
        let columns = [GridItem(.flexible())]
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                    ForEach(searchAdventures) { adventure in
                        NavigationLink(destination: AdventureView(adventure: adventure)) {
                                AdventureItemView(adventure: adventure)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .background(Color(AppTheme.primaryBackgroundColor))
            .searchable(text: $searchText, prompt: "Search adventure name or mood") {

                // filter list by moood
                ForEach(moodsFilter, id: \.self) { mood in
                    Text("I'm feeling \(mood.rawValue.capitalized)").searchCompletion(mood.rawValue)
                }
            }
            .navigationTitle("Adventures")
        }
        .onAppear {
            // configure navigation view appearance
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = AppTheme.primaryBackgroundColor
            appearance.titleTextAttributes = [.foregroundColor: AppTheme.primaryForegroundColor]
                appearance.largeTitleTextAttributes = [.foregroundColor: AppTheme.primaryForegroundColor]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        .opacity(0.9)
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct AdventuresView_Previews: PreviewProvider {
    static var previews: some View {
        AdventuresView()
    }
}
