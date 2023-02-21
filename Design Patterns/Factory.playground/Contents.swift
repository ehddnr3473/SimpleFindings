/*
 팩토리 메서드 패턴(Factory Method Pattern)
 - 객체 생성을 캡슐화하는 디자인 패턴
 - 객체를 생성하는 코드를 클라이언트에서 분리하여 별도의 팩토리 클래스에서 관리
 - 인터페이스를 이용하여 객체 생성을 추상화. 이를 통해 클라이언트는 생성될 객체의 구체적인 타입을 알 필요 없이, 팩토리에서 제공하는 인터페이스를 사용하여 객체를 생성할 수 있음.
 - 객체 생성 로직이 복잡해서 가독성을 해치거나 객체 생성 시점이 런타임에 결정되는 경우에 유용.
 - 객체 생성 과정을 추상화하여 유연성을 높이고, 코드 재사용성을 높일 수 있음.
 */

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
