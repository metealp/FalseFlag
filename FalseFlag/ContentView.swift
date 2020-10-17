//
//  ContentView.swift
//  FalseFlag
//
//  Created by Mete Alp Kizilcay on 14.10.2020.
//

import SwiftUI


var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
var correctAnswer = Int.random(in: 0...2)

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score: Int = 0
    @State private var tappedFlagIndex: Int = 0
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 30) {
                VStack {
                    Text("Tap the flag of fallen country")
                        .bolder()
                        .padding()
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
                ForEach(0 ..< 3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }){
                        FlagImage(imageName: countries[number])
                    }
                    .padding()
                }
                Spacer()
                Text("Your score is \(score)")
                    .bolder()
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreMessage = "Well done! Play again?"
            score += 1
        } else {
            tappedFlagIndex = number
            scoreTitle = "Wrong"
            scoreMessage = "Wrong! That’s the flag of \(countries[tappedFlagIndex])"
        }
        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        showingScore = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
