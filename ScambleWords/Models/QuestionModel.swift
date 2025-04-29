//
//  Question.swift
//  ScambleWords
//
//  Created by Kapilesh Rajput on 29/04/25.
//


struct Question {
    var scrambledLetters: [Letter]
    let answer: String
    let image: String
}

extension Question {
    static func generateQuestions() ->  [Question] {
        return [
            Question(scrambledLetters: [
                Letter(id: 0, text: "R"),
                Letter(id: 1, text: "A"),
                Letter(id: 2, text: "G"),
                Letter(id: 3, text: "E"),
                Letter(id: 4, text: "O"),
                Letter(id: 5, text: "N")
            ], answer: "ORANGE", image: "orange"),
            Question(scrambledLetters: [
                Letter(id: 0, text: "N"),
                Letter(id: 1, text: "A"),
                Letter(id: 2, text: "N"),
                Letter(id: 3, text: "B"),
                Letter(id: 4, text: "A"),
                Letter(id: 5, text: "A")
            ], answer: "BANANA", image: "banana"),
            Question(scrambledLetters: [
                Letter(id: 0, text: "P"),
                Letter(id: 1, text: "L"),
                Letter(id: 2, text: "E"),
                Letter(id: 3, text: "P"),
                Letter(id: 4, text: "A")
            ], answer: "APPLE", image: "apple"),
        ]
    }
}
