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
        static let inset: CGFloat = 4
        struct FontSize {
            static let small: CGFloat = 10
            static let large: CGFloat = 200
            static let scalefactor = small / large
        }
        struct Pie{
            static let opacity: CGFloat = 0.4
            static let inset: CGFloat = 4
        }
    }
    
    var body: some View {
        Pie(endAngle: .degrees(90))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.large))
                    .minimumScaleFactor(Constants.FontSize.scalefactor)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)  // we modify the previous view(Pie) by the modifier.
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
