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
                VStack(alignment: .leading, spacing: 0) {
                    Text("Adventures")
                        .modifier(TitleFont())
                        .padding(.top, 8)
                    
                    ZStack(alignment: .leading) {
                        
                        Image("forest")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 160, alignment: .top)
                            .clipped()
                            .cornerRadius(20)
                            .padding(.top, 16)
                            .overlay() {
                                Color.black.opacity(0.5)
                            }
                        
                        VStack(alignment: .leading, spacing: 8){
                            Text("The wizard's potion")
                                .modifier(SubtitleFont())
                            Text("You have collected 3 potions")
                                .modifier(BodyFont())
                            Image("Potions")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 64, alignment: .leading)
                        }
                        .padding(.top, 24)
                        .padding(.leading, 20)
                        
                    }
                    
                    ZStack(alignment: .leading) {
                        
                        Image("piano")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 160, alignment: .top)
                            .clipped()
                            .cornerRadius(20)
                            .padding(.top, 16)
                            .overlay() {
                                Color.black.opacity(0.5)
                            }
                        
                        VStack(alignment: .leading, spacing: 8){
                            Text("The pian-owl")
                                .modifier(SubtitleFont())
                            Text("You have collected 5 notes")
                                .modifier(BodyFont())
                            Image("notes")
                                .resizable()
                                .scaledToFit()
                                .padding(.top, 10)
                                .frame(height: 64, alignment: .leading)
                        }
                        .padding(.top, 24)
                        .padding(.leading, 20)
                        
                    }
                    Text("Exercises")
                        .modifier(TitleFont())
                        .padding(.top, 40)
                    
                    ZStack(alignment: .leading) {
                        Color.brown
                            .frame(height: 120)
                            .cornerRadius(20)
                            .padding(.top, 16)
                            .overlay() {
                                Color.black.opacity(0.6)
                            }
                        
                        VStack(alignment: .leading, spacing: 8){
                            Text("Breathe")
                                .modifier(SubtitleFont())
                                .padding(.top, 16)
                            Text("You have done the breathe exercise 3 times")
                                .modifier(BodyFont())
                                .padding(.trailing, 20)
                                .lineSpacing(4)
                        }
                        .padding(.leading, 20)
                    }
                    
                    ZStack(alignment: .leading) {
                        Color.brown
                            .frame(height: 120)
                            .cornerRadius(20)
                            .padding(.top, 16)
                            .overlay() {
                                Color.black.opacity(0.6)
                            }
                        
                        VStack(alignment: .leading, spacing: 8){
                            Text("Puzzle")
                                .modifier(SubtitleFont())
                                .padding(.top, 16)
                            Text("You have done the puzzle 3 times")
                                .modifier(BodyFont())
                        }
                        .padding(.leading, 20)
                    }
                }
            }
            .padding(.horizontal, 20)
            .modifier(PaddingTop())
            .navigationTitle("Awards")
        }
    }
}

//
//                    ZStack(alignment: .leading) {
//                        Image("Rectangle").resizable().scaledToFill()
//                        VStack(alignment: .leading) {
//                            Text("Breathe")
//                                .font(.title3)
//                                .fontWeight(.semibold)
//                                .padding(.leading)
//                            Text("You have done the breathe exercise 3 times")
//                                .font(.headline)
//                                .fontWeight(.medium)
//                                .padding(.leading)
//                        }
//                    }
//
//                    ZStack(alignment: .leading) {
//                        Image("Rectangle").resizable().padding(1.0).scaledToFit()
//                        VStack(alignment: .leading) {
//                            Text("Puzzle")
//                                .font(.title3)
//                                .fontWeight(.semibold)
//                                .padding(.leading)
//
//                            Text("You have done the puzzle 3 times")
//                                .font(.headline)
//                                .fontWeight(.medium)
//                                .padding(.leading)
//
//
//                        }
//                    }
//
//                }
//            }
//            .navigationTitle("Awards")
//        }
//    }
//}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
