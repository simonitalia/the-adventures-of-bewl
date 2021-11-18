//
//  ContentView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct AdventuresView: View {
    
    init() {
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = AppTheme.secondaryBackgroundColor
        appearance.titleTextAttributes = [.foregroundColor: AppTheme.primaryForegroundColor]
            appearance.largeTitleTextAttributes = [.foregroundColor: AppTheme.primaryForegroundColor]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    @EnvironmentObject var adventures: Adventures
    @State private var searchText = ""
    
    var body: some View {
        
        let columns = [GridItem(.flexible())]
        
        NavigationView {
            
            ZStack {
                Color.black
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(adventures.list) { adventure in
                            AdventureItemView(adventure: adventure)
                        }
                    }
                }
            }
            .navigationTitle("Adventures")
            .searchable(text: $searchText)
        }
    }
}

struct AdventuresView_Previews: PreviewProvider {
    static var previews: some View {
        AdventuresView()
            .environmentObject(Adventures())
    }
}
