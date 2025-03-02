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
    
    var indexOfTheOnlyFaceUpCard: Int? {
        get{
            let faceUpCardsIndices = cards.indices.filter { index in cards[index].isFaceUp }
            return faceUpCardsIndices.count == 1 ? faceUpCardsIndices.first : nil
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: String
    }
}
