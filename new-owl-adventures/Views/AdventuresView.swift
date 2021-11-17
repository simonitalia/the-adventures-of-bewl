//
//  ContentView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct AdventuresView: View {

    @EnvironmentObject var adventures: Adventures
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        
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
        }
    }
}

struct AdventuresView_Previews: PreviewProvider {
    static var previews: some View {
        AdventuresView()
            .environmentObject(Adventures())
    }
}
