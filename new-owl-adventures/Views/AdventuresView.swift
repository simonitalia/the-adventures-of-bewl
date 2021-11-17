//
//  ContentView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct AdventuresView: View {
    
    let adventures = Adventures().list
    
    var body: some View {
        
        let columns = [GridItem(.flexible())]
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                  Text("Hello World")
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
