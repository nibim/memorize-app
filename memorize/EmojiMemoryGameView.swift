//
//  ContentView.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 10.01.25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
                cards
                    .animation(.default, value: viewModel.cards)
            
            Button("Shuffle"){
                viewModel.shuffel()
            }
            .padding()
        }
    }
    var cards : some View {  //cards is a computed property which reperesents SwiftUI view
        GeometryReader{ geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: viewModel.cards.count,
                size: geometry.size,
                atAspectRatio: 2/3
            
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
                ForEach(viewModel.cards) { card in
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(Color.orange)
    }
    func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        atAspectRatio aspectRatio: CGFloat) -> CGFloat {
            let count = CGFloat(count)
            var columnCount = 1.0
            repeat {
                let width = size.width / columnCount
                let height = width / aspectRatio
                
                let rowCount = (count / columnCount).rounded(.up)
                if rowCount * height < size.height {
                    return (size.width / columnCount).rounded(.down)
                }
                columnCount += 1
            } while columnCount < count
            return min(size.width / count , size.height * aspectRatio).rounded(.down)
        }
}
    
    
    

struct CardView: View {
    let card: MemoryGame<String>.Card // it is here that will bridge view to model 🌉
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                .font(.system(size: 200))
                .minimumScaleFactor(0.01)
                .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1 )
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())  // This will fix the error
}
