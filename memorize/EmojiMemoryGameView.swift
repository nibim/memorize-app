//
//  ContentView.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 10.01.25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    var body: some View {
        VStack{
                cards
                .foregroundColor(viewModel.color)
                .animation(.default, value: viewModel.cards)
            
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards : some View {   //cards is a computed property which reperesents SwiftUI view
        AspectVGrid(viewModel.cards ,aspectRatio: aspectRatio) { card in
                CardView(card)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
            }
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())  // This will fix the error
}
