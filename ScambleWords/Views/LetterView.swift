//
//  LetterView.swift
//  ScambleWords
//
//  Created by Kapilesh Rajput on 29/04/25.
//
import SwiftUI

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
