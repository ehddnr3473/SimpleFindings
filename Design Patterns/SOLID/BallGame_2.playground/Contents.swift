import UIKit

protocol BallGame {
    func play()
}

class Soccer: BallGame {
    func play() {
        print("11 vs 11")
    }
}

class BaseBall: BallGame {
    func play() {
        print("9 vs 9")
    }
}

class PingPong: BallGame {
    func play() {
        print("1 vs 1 or 2 vs 2")
    }
}

func play(ballGame: BallGame) {
    ballGame.play()
}

let soccer = Soccer()
let baseBall = BaseBall()
let pingPong = PingPong()

play(ballGame: soccer)
play(ballGame: baseBall)
play(ballGame: pingPong)
