//
//  AdventureView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 19/11/21.
//

import SwiftUI

struct AdventureView: View {
    
    let adventure: Adventure
    
    var body: some View {
        VStack {
            
        }
        
        .navigationTitle(adventure.name.rawValue)
    }
}

struct AdventureView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureView(adventure: Adventure.sample)
    }
}
