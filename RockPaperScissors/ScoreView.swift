//
//  ScoreView.swift
//  RockPaperScissors
//
//  Created by Kamaal Farah on 22/11/2019.
//  Copyright © 2019 Kamaal. All rights reserved.
//


import SwiftUI


struct ScoreView: View {
    var name: String
    var score: Int


    var body: some View {
        Text("\(name)'s score: \(score)")
            .foregroundColor(Color(ColorPallete.TextColor.rawValue))
            .font(.system(size: 20))
            .padding()
    }
}

