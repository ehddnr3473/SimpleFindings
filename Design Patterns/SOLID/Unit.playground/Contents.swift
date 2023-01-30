import UIKit

protocol GameUnit: AnyObject {
    var name: String { get set }
    var attackPoint: Int { get set }
    var hitPoint: Int { get set }
    var represent: (String, Int, Int) { get }
    
    func comeUnderAttack(attacker: GameUnit)
}

extension GameUnit {
    var represent: (String, Int, Int) {
        (name, attackPoint, hitPoint)
    }
    
    func comeUnderAttack(attacker: GameUnit) {
        hitPoint -= attacker.attackPoint
    }
}

protocol Champion: GameUnit, AnyObject {
    var dialogue: String { get }
    init(name: String, attackPoint: Int, hitPoint: Int, dialogue: String)
    func speak() -> (String, String)
}

extension Champion {
    func speak() -> (String, String) {
        (name, dialogue)
    }
}

protocol Minion: GameUnit, AnyObject {
    init(name: String, attackPoint: Int, hitPoint: Int)
}


class Jayce: Champion {
    var name: String
    var attackPoint: Int
    var hitPoint: Int
    var dialogue: String
    
    required init(name: String, attackPoint: Int, hitPoint: Int, dialogue: String) {
        self.name = name
        self.attackPoint = attackPoint
        self.hitPoint = hitPoint
        self.dialogue = dialogue
    }
}

class MeleeMinion: Minion {
    var name: String
    var attackPoint: Int
    var hitPoint: Int
    
    required init(name: String, attackPoint: Int, hitPoint: Int) {
        self.name = name
        self.attackPoint = attackPoint
        self.hitPoint = hitPoint
    }
}


func speak(champion: Champion) {
    let speak = champion.speak()
    print("나는 \(speak.0). \(speak.1)")
}

func represent(unit: GameUnit) {
    print("이름: \(unit.represent.0) 공격력: \(unit.represent.1) 체력: \(unit.represent.2)")
}

func attack(attacker: GameUnit, defender: GameUnit) {
    print("\(attacker.name)이(가) \(defender.name)를 공격")
    defender.comeUnderAttack(attacker: attacker)
    represent(unit: defender)
}


let jayce = Jayce(name: "Jayce", attackPoint: 57, hitPoint: 590, dialogue: "안녕하세요.")
speak(champion: jayce)

let meleeMinion = MeleeMinion(name: "Melee minion", attackPoint: 12, hitPoint: 477)
attack(attacker: meleeMinion, defender: jayce)



