//
//  ResultView.swift
//  RockPaperScissors
//
//  Created by Kamaal Farah on 23/11/2019.
//  Copyright © 2019 Kamaal. All rights reserved.
//


import SwiftUI


struct ResultView: View {
    @Binding var appsMove: Int
    @Binding var displayAppsMove: Bool

    var playerMove: Int
    var winOrLose: WinOrLose


    var body: some View {
        VStack {
            Text(winConditionText(for: winOrLose))
                .foregroundColor(Color(ColorPallete.TextColor.rawValue))

            Button(action: {
                self.resetState()
            }, label: {
                VStack {
                    Text("Your opponent")
                        .font(.system(size: 20))
                    Text("chose")
                        .font(.system(size: 20))
                    Image(posibleMoves[appsMove].rawValue)
                        .resizable()
                        .frame(width: 50, height: 50)

                    Text("Click here")
                        .font(.headline)
                    Text("to continue")
                        .font(.headline)

                    Image(posibleMoves[playerMove].rawValue)
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Your choice")
                        .font(.system(size: 20))
                }
                .accentColor(Color(ColorPallete.TextColor.rawValue))
                .frame(width: 150, height: 300)
                .border(Color.blue)
                .cornerRadius(25)
                .padding(.top)
            })
        }
    }


    func resetState() {
        appsMove = Int.random(in: 0..<posibleMoves.count)
        displayAppsMove = !displayAppsMove
    }

    func winConditionText(for condition: WinOrLose) -> String {
        switch condition {
        case .draw:
            return "Match resulted in a draw 🤷‍♂️"
        case .lose:
            return "You lost 😭"
        case .win:
            return "You can call yourself a proud winnen 🎊"
        }
    }
}
