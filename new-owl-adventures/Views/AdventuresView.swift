//
//  ContentView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct AdventuresView: View {
    
    private let adventures = Adventures().list
    
    @State private var searchText = ""
    @State private var selectedMood = ""
    
    // store search adventures matching name
    private var searchAdventures: [Adventure] {
        if searchText.isEmpty {
            return adventures
        
        } else {
            return adventures.filter { adventure in
                adventure.name.rawValue.contains(searchText)
            }
        }
    }
    
    // list of search suggestions
    var searchSuggestions: [String] {
        var names = [String]()
        adventures.forEach { names.append($0.name.rawValue) }
        return names
    }
    
    var body: some View {
        
        let columns = [GridItem(.flexible())]
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                    ForEach(searchAdventures) { AdventureItemView(adventure: $0) }
                }
                .padding(.horizontal)
            }
            .background(Color(AppTheme.primaryBackgroundColor))
            .searchable(text: $searchText) {
                ForEach(searchSuggestions, id: \.self) { name in
                    Text(name).searchCompletion(name)
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
