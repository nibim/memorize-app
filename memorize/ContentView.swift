//
//  ContentView.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 10.01.25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🥳", "👻", "🥺", "💀", "🤯"]
    @State var cardCount = 5
    var body: some View {
        VStack {
            ScrollView{cards}
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards : some View {                //cards is a computed property which reperesents SwiftUI view
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset },
            label: {
                Image(systemName: symbol)}
        ) }
            
            
}
    
    
    

struct CardView: View {
    
    let content: String
    @State var isFaceUp: Bool = true
    let base = RoundedRectangle(cornerRadius: 12)
    
    
    var body: some View {
        ZStack {
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}

#Preview {
    ContentView()
}
