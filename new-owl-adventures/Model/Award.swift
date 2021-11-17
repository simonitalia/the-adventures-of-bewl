//
//  Award.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import Foundation

struct Award: Identifiable {
    
    enum Category: String {
        case adevnture = "Adventure", excercise = "Excercise"
    }
    
    let id = UUID()
    let category: Category
    let name: String
    var numberOfCompletions: Int = 0 //
}
