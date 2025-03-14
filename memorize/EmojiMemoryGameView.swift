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
                    .onTapGesture {
                        viewModel.choose(card)
            }
        }
    }
    private func scoreChange(causedBY card: Card) -> Int {
        return 0
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())  // This will fix the error
}
