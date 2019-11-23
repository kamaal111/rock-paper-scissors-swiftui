//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Kamaal Farah on 22/11/2019.
//  Copyright © 2019 Kamaal. All rights reserved.
//


import SwiftUI


struct ContentView: View {
    @State private var displayAppsMove = false
    @State private var appsMove = Int.random(in: 0..<posibleMoves.count)
    @State private var appScore = 0
    @State private var playerMove = 0
    @State private var playerScore = 0
    @State private var winOrLose: WinOrLose = .draw


    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors:[
                    Color(ColorPallete.BackgroundColorTop.rawValue),
                    Color(ColorPallete.BackgroundColorBottom.rawValue)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
                .edgesIgnoringSafeArea(.all)

            if displayAppsMove {
                VStack {
                    HStack {
                        ScoreView(name: "Kamaal", score: playerScore)
                        ScoreView(name: "AI", score: appScore)
                    }
                    
                    ResultView(
                        appsMove: $appsMove,
                        displayAppsMove: $displayAppsMove,
                        playerMove: playerMove,
                        winOrLose: winOrLose
                    )
                }
            } else {
                VStack {
                    HStack {
                        ScoreView(name: "Kamaal", score: playerScore)
                        ScoreView(name: "AI", score: appScore)
                    }

                    Text("Choose ☝️")
                        .foregroundColor(Color(ColorPallete.TextColor.rawValue))
                        .font(.largeTitle)

                    HStack {
                         ForEach(0..<posibleMoves.count) { move in
                             MoveButtonView(
                                 appScore: self.$appScore,
                                 playerScore: self.$playerScore,
                                 displayAppsMove: self.$displayAppsMove,
                                 winOrLose: self.$winOrLose,
                                 playerMove: self.$playerMove,
                                 appsMove: self.appsMove,
                                 move: move
                             )
                         }
                     }
                }
            }
        }
    }
}


