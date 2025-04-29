//
//  ContentView.swift
//  ScambleWords
//
//  Created by Kapilesh Rajput on 14/04/25.
//

import SwiftUI

struct GameView: View {
    
    @State private var questions: [Question] = Question.generateQuestions()
    
    @State private var guessedLetters: [Letter] = []
    @State private var showSuccess: Bool = false
    @State private var showFailure: Bool = false
    @State private var score: Int = 0
    @State private var currentQuestionIndex: Int = 0
    @State private var showFinalScore: Bool = false
    
    var body: some View {
        GeometryReader { geometryReader in
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        
                        Spacer()
                        
                        Image(questions[currentQuestionIndex].image)
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        Spacer()
                        
                        HStack {
                            ForEach(guessedLetters) { letter in
                                VStack {
                                    LetterView(letter: letter)
                                    Rectangle()
                                        .fill(Color.white )
                                        .frame(width: 25, height: 2)
                                }
                                .onTapGesture {
                                    if let index = guessedLetters.firstIndex(
                                        of: letter
                                    ) {
                                        guessedLetters.remove(at: index)
                                        questions[currentQuestionIndex]
                                            .scrambledLetters[letter.id] = letter
                                    }
                                    
                                }
                            }
                        }
                        .padding(.bottom)
                    }
                    .frame(width: geometryReader.size.width * 0.9, height: geometryReader.size.width * 0.9)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.border, lineWidth: 2)
                    }
                    
                    Text("Score: \(score)")
                        .foregroundStyle(.white)
                        .font(.system(size: 15))
                        .padding(.top)
                    
                    
                    HStack {
                        ForEach(
                            Array(questions[currentQuestionIndex].scrambledLetters.enumerated()),
                            id: \.1
                        ) {
                            index,
                            letter in
                            LetterView(letter: letter)
                                .onTapGesture {
                                    if !letter.text.isEmpty {
                                        guessedLetters.append(letter)
                                        questions[currentQuestionIndex]
                                            .scrambledLetters[index].text = ""
                                        
                                    }
                                    
                                    if guessedLetters.count == questions[currentQuestionIndex].scrambledLetters.count {
                                        // check for result
                                        let answer = guessedLetters.map {
                                            String($0.text)
                                        }.joined()
                                        
                                        if answer == questions[currentQuestionIndex].answer {
                                            self.showSuccess = true
                                            self.score += 1
                                            DispatchQueue.main
                                                .asyncAfter(
                                                    deadline: .now() + 1,
                                                    execute: {
                                                        self.showSuccess = false
                                                    }
                                                )
                                        } else {
                                            showFailure = true
                                            DispatchQueue.main
                                                .asyncAfter(
                                                    deadline: .now() + 1,
                                                    execute: {
                                                        self.showFailure = false
                                                    }
                                                )
                                        }
                                        
                                        guessedLetters.removeAll()
                                        
                                        if currentQuestionIndex == (questions.count - 1) {
                                            showFinalScore = true
                                        } else {
                                            currentQuestionIndex += 1
                                        }
                                    }
                                }
                        }
                    }
                }
                
                if showSuccess {
                    VStack {
                        Image("tick")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3))
                }
                
                if showFailure {
                    VStack {
                        Image("cross")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3))
                }
            }
        }
        .sheet(isPresented: $showFinalScore) {
            resetGame()
        } content: {
            ScoreView(score: score, questionCount: questions.count)
        }
    }
    
    private func resetGame() {
        currentQuestionIndex = 0
        score = 0
        questions = Question.generateQuestions()
    }
}

#Preview {
    GameView()
}

