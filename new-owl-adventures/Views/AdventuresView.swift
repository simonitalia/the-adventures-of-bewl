//
//  ContentView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct AdventuresView: View {

    //        let adventures = Adventures().list
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    AdventureItemView()
                    AdventureItemView()
                    AdventureItemView()
                    AdventureItemView()
                }
            }
        }
    }
}

struct AdventuresView_Previews: PreviewProvider {
    static var previews: some View {
        AdventuresView()
    }
}
