//
//  MoveButtonView.swift
//  RockPaperScissors
//
//  Created by Kamaal Farah on 22/11/2019.
//  Copyright © 2019 Kamaal. All rights reserved.
//


import SwiftUI


struct MoveButtonView: View {
    @Binding var appScore: Int
    @Binding var playerScore: Int
    @Binding var displayAppsMove: Bool
    @Binding var winOrLose: WinOrLose
    @Binding var playerMove: Int

    var appsMove: Int
    var move: Int


    var body: some View {
        Button(action: {
            self.playerDidPress(ownMove: self.move, appMove: self.appsMove)
        }, label: {
            Image(posibleMoves[move].rawValue)
                .resizable()
                .frame(width: 100, height: 100)
        })
            .accentColor(Color(ColorPallete.TextColor.rawValue))
    }


    func winCondition(ownMove: Int, appMove: Int) -> WinOrLose {
        let ownMoveCase = posibleMoves[ownMove]
        let appMoveCase = posibleMoves[appsMove]

        playerMove = ownMove

        if ownMoveCase == .paper && appMoveCase == .rock { return .win }
        if ownMoveCase == .paper && appMoveCase == .scissors { return .lose }
        if ownMoveCase == .rock && appMoveCase == .paper { return .lose }
        if ownMoveCase == .rock && appMoveCase == .scissors { return .win }
        if ownMoveCase == .scissors && appMoveCase == .paper { return .win }
        if ownMoveCase == .scissors && appMoveCase == .rock { return .lose }
        return .draw
    }

    func playerDidPress(ownMove: Int, appMove: Int) {
        let condition = winCondition(ownMove: ownMove, appMove: appMove)

        switch condition {
        case .draw:
            displayAppsMove = !displayAppsMove
            winOrLose = .draw
            break
        case .lose:
            displayAppsMove = !displayAppsMove
            winOrLose = .lose
            appScore += 1
            break
        case .win:
            displayAppsMove = !displayAppsMove
            winOrLose = .win
            playerScore += 1
            break
        }
    }
}


