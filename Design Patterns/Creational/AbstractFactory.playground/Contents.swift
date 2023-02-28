/*
 Abstract Factory
 - 관련있는 객체들을 생성하는 인터페이스를 제공하는 디자인 패턴
 - 클라이언트는 생성되는 구체 타입을 명시적으로 지정하지 않고도 객체를 생성할 수 있음.
 */

// 1
protocol Animal {
    func speak() -> String
}

class Dog: Animal {
    func speak() -> String {
        "Woof"
    }
}

class Cat: Animal {
    func speak() -> String {
        "Meow"
    }
}

protocol AnimalFactory {
    func createAnimal() -> Animal
}

class DogFactory: AnimalFactory {
    func createAnimal() -> Animal {
        Dog()
    }
}

class CatFactory: AnimalFactory {
    func createAnimal() -> Animal {
        Cat()
    }
}

let dogFactory = DogFactory()
let dog = dogFactory.createAnimal()
print(dog.speak())

let catFactory = CatFactory()
let cat = catFactory.createAnimal()
print(cat.speak())


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
