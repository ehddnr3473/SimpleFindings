import UIKit

// Base class / Superclass
class Champion {
    private let name: String
    private let dialogue: String
    private var hitPoint: Int
    
    init(name: String, dialogue: String, hitPoint: Int) {
        self.name = name
        self.dialogue = dialogue
        self.hitPoint = hitPoint
    }
    
    func speak() -> (String, String) {
        (name, dialogue)
    }
}

// Subclasses
class Jayce: Champion { }
class Lucian: Champion { }
class MeleeMinion: Champion {
    override func speak() -> (String, String) {
        fatalError("저는 말을 못해요.")
    }
}

func speak(champion: Champion) {
    let speak = champion.speak()
    print("나는 \(speak.0). \(speak.1)")
}

let jayce = Jayce(name: "Jayce", dialogue: "안녕하세요.", hitPoint: 590)
speak(champion: jayce)

let lucian = Lucian(name: "Lucian", dialogue: "싸우자.", hitPoint: 641)
speak(champion: lucian)

let meleeMinion = MeleeMinion(name: "Melee minion", dialogue: "", hitPoint: 477)
speak(champion: meleeMinion)
