//
//  Cardify.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 09.03.25.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    func body(content: Content) -> some View {
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(Color.white))
                .overlay(content)
            
                .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 : 1 )
        }
    }
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}
