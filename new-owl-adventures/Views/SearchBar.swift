//
//  SearchBar.swift
//  new-owl-adventures
//
//  Created by Vitaly on 17/11/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("LightGray"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
            }
            .foregroundColor(.white)
            .padding(.leading, 10)
        }
            .frame(height: 40)
            .cornerRadius(10)
            .padding(.top, 10)
            .padding(.horizontal, 16)
    }
}
