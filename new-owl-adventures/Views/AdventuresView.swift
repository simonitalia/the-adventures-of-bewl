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
    @State private var isSearching = false
    
    var body: some View {
        
        let columns = [GridItem(.flexible())]
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                    ForEach(adventures) { adventure in
                            AdventureItemView(adventure: adventure)
                    }
                }
                .padding(.horizontal)
            }
            .background(Color(AppTheme.primaryBackgroundColor))
            .searchable(text: $searchText)
            .navigationTitle("Adventures")
    //            .gesture(
    //                DragGesture()
    //                    .onChanged({ _ in
    //                        UIApplication.shared.dismissKeyboard()
    //                    })
    //                )
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
