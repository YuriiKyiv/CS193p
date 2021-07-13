//
//  ContentView.swift
//  Memorize
//
//  Created by Yurii Trokhymchuk on 11.06.2021.
//

import SwiftUI

struct ContentView: View {
    let sports = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🏒","🏑","🥍","🏏","🪃","🥅","⛳️"]
    let animals = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐵","🙈","🙉","🙊","🐒","🐔","🐧","🐦","🐤","🐣","🐥"]
    let food = ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝","🍅","🥦","🥬","🥒","🌶","🫑","🌽"]
    
    @State var emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🏒","🏑","🥍","🏏","🪃","🥅","⛳️"]
    
    var top: some View {
        Text("Memorize").font(.largeTitle)
    }
    
    var body: some View {
        VStack {
            top
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 64))]) {
                    let random = Int.random(in: 4...16)
                    ForEach(emojis[0..<random], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            footer
        }
        .padding(.horizontal)
    }
    
    var footer: some View {
        HStack {
            sportsView
            Spacer()
            animalsView
            Spacer()
            foodView
        }
        .font(.largeTitle)
        .padding()
    }
    
    var sportsView: some View {
        VStack {
            Button {
                emojis = sports.shuffled()
            } label: {
                Image(systemName: "sportscourt")
            }
            Text("Sport").font(.title3).foregroundColor(.blue)
        }
    }
    
    var animalsView: some View {
        VStack {
            Button {
                emojis = animals.shuffled()
            } label: {
                Image(systemName: "tortoise")
            }
            Text("Animals").font(.title3).foregroundColor(.blue)
        }
    }
    
    var foodView: some View {
        VStack {
            Button {
                emojis = food.shuffled()
            } label: {
                Image(systemName: "mouth")
            }
            Text("Food").font(.title3).foregroundColor(.blue)
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
            } else {
                shape.foregroundColor(.red)
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
