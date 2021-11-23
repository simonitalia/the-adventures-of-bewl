//
//  AwardsView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 18/11/21.
//

import SwiftUI

struct AwardsView: View {
    var body: some View {
    NavigationView {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Adventures")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding([.top, .leading])
                
                ZStack(alignment: .leading) {
                    Image("first").resizable().scaledToFit()
                    VStack(alignment: .leading) {
                    Text("The wizard's potion")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding([.top, .leading])
                    Text("You have collected 3 potions")
                            .font(.headline)
                            .fontWeight(.medium)
                            .padding(.leading)
                        Image("Potions")
                            .padding([.top, .leading], -85.0)
                            .scaledToFit()
                            .scaleEffect(0.4)
                    }
                }
                
                ZStack(alignment: .leading) {
                    Image("Second").resizable().scaledToFit()
                    
                    VStack(alignment: .leading) {
                    Text("The pian-owl")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
                        
                    Text("You have collected 5 notes")
                            .font(.headline)
                            .fontWeight(.medium)
                            .padding(.leading)
                        Image("notes")
                            .scaledToFit()
                            .scaleEffect(0.4)
                            .padding(.leading, -120.0)
                            .padding(.vertical, -35.0)
                    }
                }
            
                Text("Exercises")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding([.top, .leading])
                
                ZStack(alignment: .leading) {
                    Image("Rectangle").resizable().scaledToFill()
                    VStack(alignment: .leading) {
                    Text("Breathe")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
                    Text("You have done the breathe exercise 3 times")
                            .font(.headline)
                            .fontWeight(.medium)
                            .padding(.leading)
                    }
                }
                
                ZStack(alignment: .leading) {
                    Image("Rectangle").resizable().padding(1.0).scaledToFit()
                    VStack(alignment: .leading) {
                    Text("Puzzle")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
                        
                    Text("You have done the puzzle 3 times")
                            .font(.headline)
                            .fontWeight(.medium)
                            .padding(.leading)
                        
                       
                    }
                }
                
            }
            
            
        }.navigationTitle("Awards")
           
                
                
            }
    
        }
    
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
            .preferredColorScheme(.dark)
    }
}
