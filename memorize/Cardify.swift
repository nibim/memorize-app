//
//  Cardify.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 09.03.25.
//

import SwiftUI

struct Cardify: ViewModifier , Animatable{
    init(isFaceUp: Bool) {
        rotaion = isFaceUp ? 0 : 180
    }
    var isFaceUp: Bool {
        rotaion < 90
    }
    var rotaion: Double
    var animatableData: Double {
        get { rotaion }
        set { rotaion = newValue }
        
    }
    func body(content: Content) -> some View {
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(Color.white))
                .overlay(content)
            
                .opacity(isFaceUp ? 1 : 0)
                .rotation3DEffect(.degrees(isFaceUp ? 0 : 180), axis: (0,1,0))
            base.fill()
                .opacity(isFaceUp ? 0 : 1 )
        }
        .rotation3DEffect(.degrees(rotaion), axis:(0,1,0))
       
    }
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}
