//
//  ContentView.swift
//  Memorize
//
//  Created by Nathaly Valle on 1/21/23.
//

import SwiftUI

struct DuplicateView: View {
    var emojis = ["🚒", "🚕", "🚎", "🚓", "🛵", "🚚", "🚛", "🚑", "🚌", "🚗", "🏎️", "🛻"]
    @State var emojiCount = 12
    var body: some View {
        VStack{
            ScrollView {
                // LazyVGrid is lazy about accessing the body vars of all of it's Views
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                        Cardview(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
                .foregroundColor(.red)
                Spacer()
                HStack{
                    remove
                    Spacer()
                    add
                }
                .font(.largeTitle)
                .padding(.horizontal)
        }
        .padding(.horizontal)
   }
    
    var remove: some View {
        Button{
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image( systemName: "minus.circle")
        }

    }
    
    var add: some View{
        Button{
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
        Image( systemName:"plus.circle")
        }
    }
}

// All views in swiftUI are immutable, cannot be modified
struct Cardview: View {
    var content: String
    // You cannot have variables that have no value
    // ex- isFaceUp: Bool
    // @state is for temporary state
    @State var isFaceUp: Bool = true
    var body: some View {
        //ZStack: A view that overlays its subviews, aligning them in both axes.
        ZStack{
            // let are constants that never change
            // var are variables that change/vary
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
                
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
   }
}



struct DuplicateView_Previews: PreviewProvider {
    static var previews: some View {
        // You can have infinite views
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
