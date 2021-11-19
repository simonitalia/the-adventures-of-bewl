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
    @State private var selectedMood = Adventure.Tags.all
    @State private var isSearching = false
    
    var body: some View {
        
        let columns = [GridItem(.flexible())]
        
        NavigationView {
            VStack(alignment: .center, spacing: 5) {
                FilterView(selectedMood: $selectedMood)
                
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                        ForEach(adventures) { adventure in
                            
//                            if adventure.moods.contains(selectedMood.rawValue)
//                                && (adventure.name.localizedCaseInsensitiveContains(searchText)
//                                || adventure.genre.localizedCaseInsensitiveContains(searchText)
//                                    || adventure.moods.map({ $0.localizedCaseInsensitiveContains(searchText)}).contains(true)
//                                || searchText == "") {
//                                NavigationLink(destination: Text("AdventureView")) {
                                AdventureItemView(adventure: adventure)
//                                }
//                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .searchable(text: $searchText)
                .navigationTitle("Adventures")
                .gesture(
                    DragGesture()
                        .onChanged({ _ in
                            UIApplication.shared.dismissKeyboard()
                        })
                    )
            }
            .background(Color(AppTheme.primaryBackgroundColor))
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
            .preferredColorScheme(.dark)
    }
}
