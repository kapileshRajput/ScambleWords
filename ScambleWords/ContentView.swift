//
//  ContentView.swift
//  ScambleWords
//
//  Created by Kapilesh Rajput on 14/04/25.
//

import SwiftUI

struct Letter: Identifiable, Hashable {
    let id: Int
    var text: String
}


struct ContentView: View {
    
    @State var letters: [Letter] = [
        Letter(id: 0, text: "R"),
        Letter(id: 1, text: "A"),
        Letter(id: 2, text: "G"),
        Letter(id: 3, text: "E"),
        Letter(id: 4, text: "0"),
        Letter(id: 5, text: "N")
    ]
    
    @State var guessedLetters: [Letter] = []
    var correctAnswer: String = "0RANGE"
    
    var body: some View {
        GeometryReader { geometryReader in
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        
                        Spacer()
                        
                        Image("orange")
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
                                        letters[letter.id] = letter
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
                    
                    Text("Score: 0")
                        .foregroundStyle(.white)
                        .font(.system(size: 15))
                        .padding(.top)
                    
                    
                    HStack {
                        ForEach(
                            Array(letters.enumerated()),
                            id: \.1
                        ) {
                            index,
                            letter in
                            LetterView(letter: letter)
                                .onTapGesture {
                                    if !letter.text.isEmpty {
                                        guessedLetters.append(letter)
                                        letters[index] = Letter(
                                            id: 0,
                                            text: ""
                                        )
                                    }
                                    
                                    if guessedLetters.count == letters.count {
                                        // check for result
                                        let answer = guessedLetters.map {
                                            String($0.text)
                                        }.joined()
                                        
                                        if answer == correctAnswer {
                                            
                                        } else {
                                            
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct LetterView: View {
    let letter: Letter
    
    var body: some View {
        Text(letter.text)
            .font(.system(size: 15, weight: .semibold))
            .foregroundStyle(.white)
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
