//
//  ScoreView.swift
//  ScambleWords
//
//  Created by Kapilesh Rajput on 29/04/25.
//

import SwiftUI

struct ScoreView: View {
    
    let score: Int
    let questionCount: Int
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text("Final Score")
                    .foregroundStyle(.white)
                    .font(.system(size: 26, weight: .bold))
                
                Text("Score: \(score)/\(questionCount)")
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ScoreView(score: 2, questionCount: 3)
}
