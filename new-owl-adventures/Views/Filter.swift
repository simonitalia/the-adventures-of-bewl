//
//  Filter.swift
//  new-owl-adventures
//
//  Created by Vitaly on 18/11/21.
//

import SwiftUI

struct Filter: View {
    
    @Binding var selectedMood: Tags
    
    var body: some View {
        ScrollView(.horizontal) {
            Picker("Choose your mood", selection: $selectedMood, content: {
                ForEach(Tags.allCases, id: \.self) { mood in
                    Text("\(mood.rawValue.capitalized)")
                        .tag(mood)
                }
            })
                .pickerStyle(.segmented)
        }
        .padding(16)
    }
}
