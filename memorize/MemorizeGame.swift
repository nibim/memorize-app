//
//  MemorizeGame.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 22.02.25.
//

import Foundation

struct MemoryGame<CardContent> {                //CardCount('dont care type') can be anything, can be image etc
    var cards: Array<Card>
    
    func choose (card: Card){
        
    }
    struct Card{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
