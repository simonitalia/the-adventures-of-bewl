//
//  AdventureView.swift
//  new-owl-adventures
//
//  Created by Vitaly on 18/11/21.
//

import SwiftUI

struct AdventureView: View {
    
    @Binding var isShowingSuccessView: Bool
    var currentAdventure: Adventure
    
    var body: some View {
        NavigationView {
            Text("123")
                .navigationBarTitle(currentAdventure.name)
                .navigationBarItems(
                    trailing:
                        NavigationLink(destination: Text("You're the best!"), isActive: $isShowingSuccessView) {
                        Button("I've finish!") {
                            self.isShowingSuccessView = true
                        }
                        }
                )
        }
    }
}
