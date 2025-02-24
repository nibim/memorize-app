//
//  MemorizeGame.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 22.02.25.
//

import Foundation

struct MemoryGame<CardContent> {                //CardCount('dont care type') can be anything, can be image etc
    private(set) var cards: Array<Card>
    
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> CardContent){
        cards = []
        //add numberOfPairsOfCards x 2
        for pairIndex in 0..<max(numberOfPairsOfCards,2){
            let content = contentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        
    }
    
    
    func choose (card: Card){
        
    }
    struct Card{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
