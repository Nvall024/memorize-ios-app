//
//  ContentView.swift
//  Memorize
//
//  Created by Nathaly Valle on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    var vehicleEmojis = ["🚒", "🚕", "🚎", "🚓", "🛵", "🚚", "🚛", "🚑", "🚌", "🚗", "🏎️", "🛻"]
    var petEmojis = ["🐢", "🐠", "🐕", "🐇", "🦜", "🐌", "🐥", "🦉", "🐙", "🦋", "🐈", "🦥"]
    var foodEmojis = ["🍝", "🍙", "🌮", "🍕", "🍟", "🍱", "🍜", "🍔", "🥐", "🥞", "🥪", "🍦"]
    
    @State var emojiCount = 12
    @State var isPets = false
    @State var isFood = false
    
    var body: some View {
        VStack{
            ScrollView{
                Text("Memorize!").font(.largeTitle)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    if(isFood){
                        ForEach(foodEmojis[0..<emojiCount], id: \.self){ emoji in
                            Cardview(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }else if(isPets){
                        ForEach(petEmojis[0..<emojiCount], id: \.self){ emoji in
                            Cardview(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }else {
                        ForEach(vehicleEmojis[0..<emojiCount], id: \.self){ emoji in
                            Cardview(content: emoji).aspectRatio(2/3, contentMode: .fit)
                            }
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
               addVehicles
                Spacer()
                addPets
                Spacer()
                addFoods
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
   }
    
    var addVehicles: some View {
        Button{
            isPets = false
            isFood = false
        } label: {
            VStack{
                Image( systemName:"car")
                Text("vehicle")
            }
        }
    }
    
    var addPets: some View{
        Button{
            isFood = false;
            isPets = true;
        } label: {
            VStack{
                Image( systemName:"pawprint")
                Text("animal")
            }
        }
    }

    var addFoods: some View{
        Button{
            isPets = false;
            isFood = true;
        } label: {
            VStack{
                Image( systemName:"fork.knife")
                Text("food")
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View{
        ZStack{
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
