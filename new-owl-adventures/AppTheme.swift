//
//  AppTheme.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 19/11/21.
//

import SwiftUI

enum AppTheme {
    static let accentColor = UIColor.systemYellow
    static let primaryBackgroundColor = UIColor.black
    static let secondaryBackgroundColor = UIColor.systemGray
    static let primaryForegroundColor = UIColor.white
    static let gradient = [
        Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.7),
        Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0)
    ]
}

struct TitleFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: Font.Weight.semibold))
    }
}

struct SubtitleFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 21, weight: Font.Weight.medium))
    }
}

struct BodyFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: Font.Weight.regular))
    }
}

struct PaddingTop: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.top, 24)
    }
}
