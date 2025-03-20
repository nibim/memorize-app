//
//  ContentView.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 10.01.25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    var body: some View {
        VStack{
                cards
                .foregroundColor(viewModel.color)
            HStack{
                score
                Spacer()
                shuffel
            }
        }
        .padding()
    }
    
    private var shuffel: some View {
        Button("Shuffle"){
            withAnimation(){
                viewModel.shuffle()
            }
        }
    }
    private var score: some View {
        Text("Scope: \(viewModel.score)")
            .animation(nil)
    }
    
    private var cards : some View {   //cards is a computed property which reperesents SwiftUI view
        AspectVGrid(viewModel.cards ,aspectRatio: aspectRatio) { card in
                CardView(card)
                    .padding(4)
                    .overlay(FlyingNumber(number: scoreChange(causedBY: card)))
                    .zIndex(scoreChange(causedBY: card) != 0 ? 1 : 0) //not working
                    .onTapGesture {
                        choose(card)
            }
        }
    }
    private func choose(_ card: Card){
        withAnimation{
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, causedByCardId: card.id)
        }
    }
    @State private var lastScoreChange = (0 , causedByCardId: "") //using tuple
    private func scoreChange(causedBY card: Card) -> Int {
        let (amount,  id) = lastScoreChange 
        return card.id == id ? amount : 0
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())  // This will fix the error
}
