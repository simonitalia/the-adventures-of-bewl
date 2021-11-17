//
//  Exercise.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 17/11/21.
//

import Foundation

struct Exercise: Identifiable {
    
    enum Name: String {
        case puzzle, bubbles, breathe
    }
    
    let id = UUID()
    let name: String
}
