/*
 Prototype
 - Prototype 디자인 패턴은 기존 객체의 모든 속성을 복사하여 독립적인 복사본을 생성하여 새 객체를 인스턴스화하는 데 사용됨.
 - 새 객체의 생성이 비효율적일 때 유용함.
 */

final class MoonWorker {
    let name: String
    var health: Int = 100
    
    init(name: String) {
        self.name = name
    }
    
    func clone() -> MoonWorker {
        MoonWorker(name: name)
    }
}

let prototype = MoonWorker(name: "Kim")

let kim1 = prototype.clone()
kim1.health = 30

let kim2 = prototype.clone()
kim2.health = 15

let kim3 = prototype.clone()
kim3.health = 89
