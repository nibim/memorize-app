//
//  MemorizeGame.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 22.02.25.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {                //CardCount('dont care type') can be anything, can be image etc
    private(set) var cards: Array<Card>
    private(set) var score: Int = 0
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> CardContent){
        cards = []
        //add numberOfPairsOfCards x 2
        for pairIndex in 0..<max(numberOfPairsOfCards,2){
            let content = contentFactory(pairIndex)
            cards.append(Card(content: content, id:"\(pairIndex+1)1a"))
            cards.append(Card(content: content, id:"\(pairIndex+1)1b"))
        }
        
    }
    
    var indexOfTheOnlyFaceUpCard: Int? {
        get{
            return cards.indices.filter { index in cards[index].isFaceUp }.only
        }
        set{
            cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0)}
            
        }   
    }
    
    mutating func choose (_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}){
            if !cards[chosenIndex].isMatched && !cards[chosenIndex].isFaceUp{
                if let potentialIndexOfTheOnlyFaceUpCard = indexOfTheOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialIndexOfTheOnlyFaceUpCard].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialIndexOfTheOnlyFaceUpCard].isMatched = true
                        score += 2
                    } else {
                        if cards[chosenIndex].hasBeenSeen {
                            score -= 1
                        }
                        if cards[potentialIndexOfTheOnlyFaceUpCard].hasBeenSeen{
                            
                        }
                    }
                
                }else {
                    for index in cards.indices{
                        cards[index].isFaceUp = false
                    }
                }
                cards[chosenIndex].isFaceUp = true
            
            }
        }
    }
    
    
    
    mutating func shuffle(){
      cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable {
        var isFaceUp: Bool = false{
            didSet {
                if oldValue && !isFaceUp {
                    hasBeenSeen = true
                }
            }
        }
        var isMatched: Bool = false
        var hasBeenSeen: Bool = false
        var content: CardContent
        var id: String
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
