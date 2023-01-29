import UIKit

// Base class / Superclass
class Champion {
    func speak() {
        print("챔피언")
    }
}

// Subclass
class Jayce: Champion {
    override func speak() {
        print("안녕하세요, 제이스입니다.")
    }
}

// Subclass
class Minion: Champion {
    override func speak() {
        fatalError("저는 말을 못해요.")
    }
}

func speak(champion: Champion) {
    champion.speak()
}

let champion = Champion()
speak(champion: champion)

let jayce = Jayce()
speak(champion: jayce)

let minion = Minion()
speak(champion: minion)
