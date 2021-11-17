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
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(adventures.list) { adventure in
                        AdventureItemView(name: adventure.name)
                    }
                }
            }
        }
    }
}

struct AdventuresView_Previews: PreviewProvider {
    static var previews: some View {
        AdventuresView()
            .environmentObject(Adventures())
    }
}
