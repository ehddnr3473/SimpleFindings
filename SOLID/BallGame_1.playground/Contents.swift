import UIKit

class BallGame {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
}

func play(ballGame: BallGame) {
    switch ballGame.name {
    case "Soccer":
        print("11 vs 11")
    case "BaseBall":
        print("9 vs 9")
    default:
        fatalError("Not implemented.")
    }
}

let soccer = BallGame("Soccer")
let baseBall = BallGame("BaseBall")
play(ballGame: soccer)
play(ballGame: baseBall)
