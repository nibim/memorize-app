//
//  MemorizeGame.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 22.02.25.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {                //CardCount('dont care type') can be anything, can be image etc
    private(set) var cards: Array<Card>
    
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> CardContent){
        cards = []
        //add numberOfPairsOfCards x 2
        for pairIndex in 0..<max(numberOfPairsOfCards,2){
            let content = contentFactory(pairIndex)
            cards.append(Card(content: content, id:"\(pairIndex+1)1a"))
            cards.append(Card(content: content, id:"\(pairIndex+1)1b"))
        }
        
    }
    
    mutating func choose (_ card: Card){
        if let chosenIndex = index(of: card){
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    
    mutating func shuffle(){
      cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: String
    }
}
