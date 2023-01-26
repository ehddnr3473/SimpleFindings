import UIKit

protocol BallGame {
    associatedtype T: Ball
    
    var ball: T { get set }
    var rentalFee: Int { get set }
    init(ball: T)
    func getPrice() -> Int
}

protocol Ball {
    var rentalFee: Int { get set }
}

class SoccerBall: Ball {
    var rentalFee = 1000
}

class Soccer<T: SoccerBall>: BallGame {
    var ball: T
    var rentalFee = 10000
    
    required init(ball: T) {
        self.ball = ball
    }
    
    func getPrice() -> Int {
        rentalFee + ball.rentalFee
    }
}

protocol BallGameFactory {
    associatedtype BallGameType: BallGame
    func createBallGame() -> BallGameType
}

class SoccerFactory: BallGameFactory {
    func createBallGame() -> some BallGame {
        Soccer(ball: SoccerBallFactory().createBall() as! SoccerBall)
    }
}

class BadmintonFactory: BallGameFactory {
    func createBallGame() -> some BallGame {
        Badminton(ball: ShuttlecockFactory().createBall() as! Shuttlecock)
    }
}

protocol BallFactory {
    func createBall() -> Ball
}

class SoccerBallFactory: BallFactory {
    func createBall() -> Ball {
        SoccerBall()
    }
}

class ShuttlecockFactory: BallFactory {
    func createBall() -> Ball {
        Shuttlecock()
    }
}

class Shuttlecock: Ball {
    var rentalFee = 500
}

class Badminton<T: Shuttlecock>: BallGame {
    var ball: T
    var rentalFee = 5000
    
    required init(ball: T) {
        self.ball = ball
    }
    
    func getPrice() -> Int {
        rentalFee + ball.rentalFee
    }
}

class Game {
    private var factory: any BallGameFactory
    private var fee = 0
    
    init(factory: some BallGameFactory) {
        self.factory = factory
    }
    
    func change(factory: some BallGameFactory) {
        self.factory = factory
    }
    
    private func calculateFee() {
        fee = factory.createBallGame().getPrice()
    }
    
    func printFee() {
        calculateFee()
        print(fee)
    }
}

var game = Game(factory: SoccerFactory())
game.printFee()

game.change(factory: BadmintonFactory())
game.printFee()

