/*
 Abstract Factory
 - 관련있는 객체들을 생성하는 인터페이스를 제공하는 디자인 패턴
 - 클라이언트는 생성되는 구체 타입을 명시적으로 지정하지 않고도 객체를 생성할 수 있음.
 */

// 1
protocol BallGame {
    var ball: String { get set }
}

class Soccer: BallGame {
    var ball: String
    
    init(ball: String) {
        self.ball = ball
    }
}
class Badminton: BallGame {
    var ball: String
    
    init(ball: String) {
        self.ball = ball
    }
}

protocol BallGameFactory {
    func createBallGame(ball: String) -> BallGame
}

class SoccerFactory: BallGameFactory {
    func createBallGame(ball: String) -> BallGame {
        Soccer(ball: ball)
    }
}

class BadmintonFactory: BallGameFactory {
    func createBallGame(ball: String) -> BallGame {
        Badminton(ball: ball)
    }
}

let soccerFactory = SoccerFactory()
let soccer = soccerFactory.createBallGame(ball: "Soccer ball")

let badmintonFactory = BadmintonFactory()
let badminton = badmintonFactory.createBallGame(ball: "Shuttlecock")



// 2
protocol BurgerDescribing {
    var ingredients: [String] { get }
}

struct CheeseBurger: BurgerDescribing {
    let ingredients: [String]
}

protocol BurgerMaking {
    func make() -> BurgerDescribing
}

// Number implemenation with factory methods
final class BigKahunaBurger: BurgerMaking {
    func make() -> BurgerDescribing {
        CheeseBurger(ingredients: ["Cheese", "Burger", "Lettuce", "Tomato"])
    }
}

final class JackInTheBox: BurgerMaking {
    func make() -> BurgerDescribing {
        CheeseBurger(ingredients: ["Cheese", "Burger", "Tomato", "Onions"])
    }
}

enum BurgerFactoryType: BurgerMaking {
    case bigKahuna
    case jackInTheBox
    
    func make() -> BurgerDescribing {
        switch self {
        case .bigKahuna:
            return BigKahunaBurger().make()
        case .jackInTheBox:
            return JackInTheBox().make()
        }
    }
}

let bigKahuna = BurgerFactoryType.bigKahuna.make()
let jackInTheBox = BurgerFactoryType.jackInTheBox.make()

dump(bigKahuna)
dump(jackInTheBox)
