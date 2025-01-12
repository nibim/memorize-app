//
//  ContentView.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 10.01.25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🥳", "👻", "🥺", "💀", "🤯"]
    @State var cardCount = 4
    var body: some View {
        VStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
            
        }
        .padding()
    }
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
        }
    }
}

#Preview {
    ContentView()
}
