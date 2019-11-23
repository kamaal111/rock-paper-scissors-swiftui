//
//  Globals.swift
//  RockPaperScissors
//
//  Created by Kamaal Farah on 22/11/2019.
//  Copyright © 2019 Kamaal. All rights reserved.
//


enum ColorPallete: String {
    case BackgroundColorTop
    case BackgroundColorBottom
    case TextColor
}

enum WinOrLose {
    case win
    case lose
    case draw
}

enum PosibleMoves: String {
    case rock
    case paper
    case scissors
}


let posibleMoves: [PosibleMoves] = [.paper, .rock, .scissors]
