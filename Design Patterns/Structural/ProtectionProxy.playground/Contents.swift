/*
 Protection Proxy
 - underlying 객체를 참조하는 대리(surrogate) 또는 placeholder 객체를 제공하는데 사용됨.
 - protection proxy가 접근을 제한하는 구조.
 */

protocol DoorOpening {
    func open(doors: String) -> String
}

final class HAL9000: DoorOpening {
    func open(doors: String) -> String {
        "HAL9000: Affirmative, Dave. I read you. Opened \(doors)"
    }
}

final class CurrentComputer: DoorOpening {
    private var computer: HAL9000!
    
    func authenticate(password: String) -> Bool {
        guard password == "pass" else { return false }
        
        computer = HAL9000()
        
        return true
    }
    
    func open(doors: String) -> String {
        guard computer != nil else {
            return "Access Denied. I'm afraid I can't do that"
        }
        
        return computer.open(doors: doors)
    }
}

let computer = CurrentComputer()
let podBay = "Pod Bay Doors"

computer.open(doors: podBay)

computer.authenticate(password: "pass")
computer.open(doors: podBay)
