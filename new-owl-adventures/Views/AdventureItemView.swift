//
//  AdventureItemView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct AdventureItemView: View {
    
    var name: String
    
    var body: some View {
        ZStack {
            Color.red
            .frame(width: .infinity, height: 257)
            .cornerRadius(20)
            .padding(.horizontal, 15)
            Text("\(name)")
                .padding()
        }
    }
}

struct AdventureItemView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureItemView(name: "123")
    }
}
