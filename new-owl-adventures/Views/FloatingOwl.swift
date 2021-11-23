//
//  FloatingOwl.swift
//  new-owl-adventures
//
//  Created by Vitaly on 23/11/21.
//

import SwiftUI

struct FloatingOwl: View {
    var body: some View {
        Image("trailingOwl")
            .frame(width: 177, height: 160)
            .scaleEffect(0.7)
            .offset(x: 53, y: 44)
    }
}

struct FloatingOwl_Previews: PreviewProvider {
    static var previews: some View {
        FloatingOwl()
    }
}
