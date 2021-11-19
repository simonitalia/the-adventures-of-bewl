//
//  Filter.swift
//  new-owl-adventures
//
//  Created by Vitaly on 18/11/21.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var selectedMood: Adventure.Tags
    
    var body: some View {
        ScrollView(.horizontal) {
            Picker("Choose your mood", selection: $selectedMood, content: {
                ForEach(Adventure.Tags.allCases, id: \.self) { mood in
                    Text("\(mood.rawValue.capitalized)")
                        .tag(mood)
                }
            })
                .pickerStyle(.segmented)
        }
        .padding(16)
    }
}
