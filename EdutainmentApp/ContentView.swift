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
    @State private var listOfAnswers = []
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                
                Text("Calcualation Game")
                    .font(.title)
                    .padding(5)
                
                Section{
                    Stepper("Enter your range from 2-12 \nCurrent Range: \(range)", value: $range,
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
            
            VStack{
                
                let number1 = listOfNumbers[Int.random(in: 0..<range)]
                let number2 = listOfNumbers[Int.random(in: 0..<range)]
                let answer1 = Int.random(in: 2..<144)
                let answer2 = Int.random(in: 2..<144)
                let answer = number1 * number2
                
                HStack {
                    Text("\(number1)")
                    
                    Image(systemName: "multiply")
                    
                    Text("\(number2)")
                }
                .font(.system(size: 100))
                
                HStack{ //Stack for 3 numbers of answers
                    Text("\(answer1)")
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .background(Color.secondary)
                        .cornerRadius(20)
                    
                    Text("\(answer)")
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .background(Color.secondary)
                        .cornerRadius(20)
                    
                    Text("\(answer2)")
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .background(Color.secondary)
                        .cornerRadius(20)
                }
            }
        }
    }
}








#Preview {
    ContentView()
}
