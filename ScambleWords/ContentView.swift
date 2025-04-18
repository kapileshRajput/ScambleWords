//
//  ContentView.swift
//  ScambleWords
//
//  Created by Kapilesh Rajput on 14/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var letters: [String] = ["O", "R", "A", "N", "G", "E"]
    
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
                            ForEach(letters, id: \.self) { letter in
                                VStack {
                                    LetterView(character: "")
                                    Rectangle()
                                        .fill(Color.white )
                                        .frame(width: 25, height: 2)
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
                        ForEach(letters, id: \.self) { letter in
                            LetterView(character: letter)
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
    let character: String
    
    var body: some View {
        Text(character)
            .font(.system(size: 15, weight: .semibold))
            .foregroundStyle(.white)
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
