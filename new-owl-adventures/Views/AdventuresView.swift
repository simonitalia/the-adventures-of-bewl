//
//  ContentView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import SwiftUI

struct AdventuresView: View {
    
    @EnvironmentObject var adventures: Adventures
    @State var searchText = ""
    @State var selectedMood = Tags.all
    @State var searching = false
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                SearchBar(searchText: $searchText, searching: $searching)
                    .overlay(alignment: .trailing) {
                        if searching {
                            Button(action: {
                                searchText = ""
                                withAnimation {
                                    searching = false
                                    UIApplication.shared.dismissKeyboard()
                                }
                            }, label: {
                                Image(systemName: "xmark")
                                    .padding(.top, 10)
                                    .padding(.trailing, 32)
                                    .frame(width: 40, height: 40)
                            })
                        }
                    }
                
                Filter(selectedMood: $selectedMood)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(adventures.list) { adventure in
                            if adventure.moods.contains(selectedMood.rawValue)
                                && (adventure.name.localizedCaseInsensitiveContains(searchText)
                                || adventure.description.localizedCaseInsensitiveContains(searchText)
                                    || adventure.moods.map({ $0.localizedCaseInsensitiveContains(searchText)}).contains(true)
                                || searchText == "") {
                                NavigationLink(destination: Text("AdventureView")) {
                                AdventureItemView(adventure: adventure)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Adventures")
                .gesture(DragGesture()
                            .onChanged({ _ in
                    UIApplication.shared.dismissKeyboard()
                })
                )
            }
        }
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//struct AdventuresView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdventuresView()
//            .preferredColorScheme(.dark)
//            .environmentObject(Adventures())
//    }
//}
