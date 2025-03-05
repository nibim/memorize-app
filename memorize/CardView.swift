//
//  CardView.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 05.03.25.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card // it is here that will bridge view to model 🌉
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 4
        struct FontSize {
            static let small: CGFloat = 10
            static let large: CGFloat = 200
            static let scalefactor = small / large
        }
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                Circle()
                    .opacity(0.4)
                    .overlay(
                        Text(card.content)
                            .font(.system(size: Constants.FontSize.large))
                            .minimumScaleFactor(Constants.FontSize.scalefactor)
                            .aspectRatio(1, contentMode: .fit)
                            .padding(5)
                    )
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1 )
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}
