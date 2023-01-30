/*
 Interface segregation principle
 클라이언트가 자신이 사용하지 않는 메서드에 의존하지 않아야 한다는 원칙
 큰 덩어리의 인터페이스들을 구체적이고 작은 단위들로 분리시킴으로써
 클라이언트들이 꼭 필요한 메서드들만 이용할 수 있게 함.
*/

import UIKit

// 수륙양용 - 큰 덩어리 인터페이스
protocol Amphibious: AnyObject {
    func drive()
    func turnLeft()
    func turnRight()
    
    func steer()
    func steerLeft()
    func steerRight()
}

class Tico: Amphibious {
    func drive() {
        // implement ..
    }
    
    func turnLeft() {
        // implement ..
    }
    
    func turnRight() {
        // implement ..
    }
    
    // 사용하지 않음
    func steer() { }
    func steerLeft() { }
    func steerRight() { }
}

// Amphibious를 Car와 Boat로 분리하여, 필요한 메서드만 이용할 수 있도록 만들어줄 수 있음.
protocol Car: AnyObject {
    func drive()
    func turnLeft()
    func turnRight()
}

protocol Boat: AnyObject {
    func steer()
    func steerLeft()
    func steerRight()
}

class Genesis: Car {
    func drive() {
        //
    }
    
    func turnLeft() {
        //
    }
    
    func turnRight() {
        //
    }
}

class Avante: Car {
    func drive() {
        //
    }
    
    func turnLeft() {
        //
    }
    
    func turnRight() {
        //
    }
}

class CarBoat: Car, Boat {
    func drive() {
        //
    }
    
    func turnLeft() {
        //
    }
    
    func turnRight() {
        //
    }
    
    func steer() {
        //
    }
    
    func steerLeft() {
        //
    }
    
    func steerRight() {
        //
    }
}
