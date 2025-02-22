//
//  ContentView.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 10.01.25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🥳", "👻", "🥺", "💀", "🤯","🫁","👾","🐭","🦥","🛟"]
    var body: some View {
        
        ScrollView{
            cards
        }
        .padding()
    }
    
    var cards : some View {                //cards is a computed property which reperesents SwiftUI view
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        .foregroundColor(.orange)
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
