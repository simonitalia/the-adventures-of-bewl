//
//  AdventureCompletedView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 21/11/21.
//

import SwiftUI

struct AdventureCompletedView: View {
    @Environment(\.presentationMode) var PresentationMode

    let adventure: Adventure
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(AppTheme.primaryBackgroundColor).edgesIgnoringSafeArea(.all)
            }
            .toolbar {
                Button("Done") {
                    PresentationMode.wrappedValue.dismiss()
                }
            }
        }
        .opacity(0.9)
    }
}

struct AdventureCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureCompletedView(adventure: Adventure.sample)
    }
}
