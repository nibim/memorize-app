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
            TimelineView(.animation) { timeline in
                if(card.isFaceUp || !card.isMatched){
                Pie(endAngle: .degrees(card.bonusPercentRemaining * 360  ))
                    .opacity(Constants.Pie.opacity)
                    .overlay(cardContenAndText.padding(Constants.Pie.inset))
                    .padding(Constants.inset)
                    .cardify(isFaceUp: card.isFaceUp)// we modify the previous view(Pie) by  the modifier.
                    .transition(.scale)
                }
                else{
                    Color.clear
                }
        }
    
        
    }
    
    var cardContenAndText: some View {
        Text(card.content)
            .font(.system(size: Constants.FontSize.large))
            .minimumScaleFactor(Constants.FontSize.scalefactor)
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value:card.isMatched)
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
