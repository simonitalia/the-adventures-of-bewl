//
//  Exercise.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import Foundation
import SwiftUI

struct Exercise: Identifiable {
    
    enum Name: String, CaseIterable {
        case breathe = "Breathe", puzzle = "Puzzle", bubbles = "Bubbles"
    }
    
    enum Description: String {
        case breathe = "Breathe with me for 30 seconds",
             puzzle = "Let’s put this simple puzzle together",
             bubbles = "Burst all the bubbles in front of you"
    }
    
    let id = UUID()
    let name: Exercise.Name
    let description: Exercise.Description
}

class Exercises {
    var list = [Exercise]()
    
    // construct list on initialization
    init() {
        
        Exercise.Name.allCases.forEach { name in
            
            switch name {
            case .breathe:
                let exercise = Exercise(
                    name: Exercise.Name.breathe,
                    description: Exercise.Description.breathe)
                list.append(exercise)
                
            case .puzzle:
                let exercise = Exercise(
                    name: Exercise.Name.puzzle,
                    description: Exercise.Description.puzzle)
                list.append(exercise)
                
            case .bubbles:
                let exercise = Exercise(
                    name: Exercise.Name.bubbles,
                    description: Exercise.Description.bubbles)
                list.append(exercise)
            }
        }
    }
}
