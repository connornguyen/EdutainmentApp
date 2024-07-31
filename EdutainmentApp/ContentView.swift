//
//  ContentView.swift
//  EdutainmentApp
//
//  Created by Apple on 30/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var range = 2
    @State private var question_Num = 5
    let step = 5
    let listOfNumbers = [2, 3, 4, 5, 6, 7, 8, 9 ,10, 11, 12]
    @State private var counting = 0
    @State private var listOfAnswers = [Int]()
    @State private var number1 = 0
    @State private var number2 = 0
    @State private var answer1 = 0
    @State private var answer2 = 0
    @State private var answer = 0
    @State private var scoreTittle = ""
    @State private var score = 0
    @State private var showingScore = false
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                
                Text("Calcualation Game")
                    .font(.title)
                    .padding(5)
                
                Section{
                    Stepper("Enter your range from 2-12 \nCurrent Range: \(String(range + 1))", value: $range,
                            in: 2...12 )
                    .font(.subheadline.bold())
                    
                    Stepper("Number of questions is \(question_Num)",
                            value: $question_Num,
                            in: 5...20,
                            step: step)
                    .font(.subheadline.bold())
                    
                }
                .background(.ultraThinMaterial)
                .padding()
                
                Spacer()
            }
            .padding()
            .onAppear(perform: generateQuestions )
            
            VStack{
                HStack {
                    Text("\(number1)")
                    
                    Image(systemName: "multiply")
                    
                    Text("\(number2)")
                }
                .font(.system(size: 100))
                
                
                HStack{ //Stack for 3 numbers of answers
                    ForEach(listOfAnswers.shuffled(), id: \.self) { answer3 in
                        Button(action: {
                            checkAnswer(answer3)
                            print("Button tapped: \(answer3)")
                        }) {
                            withAnimation{
                                Text(String(answer3))
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.white)
                                    .background(Color.secondary)
                                    .cornerRadius(20)
                            }
                        }
                    }
                }
            }
        }
        .alert(scoreTittle, isPresented: $showingScore){
            Button("Try again?", action: generateQuestions)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func addAnswerToArray(answer1: Int, answer2: Int, correctAnswer: Int) {
        listOfAnswers = [answer1, answer2, correctAnswer]
    }
    
    func generateQuestions() {
        number1 = listOfNumbers[Int.random(in: 0..<range)]
        number2 = listOfNumbers[Int.random(in: 0..<range)]
        answer1 = Int.random(in: 2..<144)
        answer2 = Int.random(in: 2..<144)
        answer = number1 * number2
        
        addAnswerToArray(answer1: answer1, answer2: answer2, correctAnswer: answer)
    }
    
    func checkAnswer(_ number: Int){
        if number == answer {
            scoreTittle = "Correct Answer"
            score += 1
            counting += 1
        } else {
            scoreTittle = "Wrong Answer"
            score = 0
        }
        if counting == question_Num{
            scoreTittle = "You have completed all the questions"
            score = 0
        }
        showingScore = true
    }
    
}



#Preview {
    ContentView()
}
