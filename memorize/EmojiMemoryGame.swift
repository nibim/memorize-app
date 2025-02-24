//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 22.02.25.
//

import SwiftUI

class EmojiMemoryGame { //it is a class because it is going to share everything with everyone
    private static let emojis = ["🥳", "👻", "🥺", "💀", "🤯","🫁","👾","🐭","🦥","🛟"]
    
    private static func createMemoryGame() ->  MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    private var model = createMemoryGame()
        
        // full seperation because we only use this model as a private for this class
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
