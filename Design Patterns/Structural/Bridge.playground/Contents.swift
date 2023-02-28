/*
 Bridge
 추상 요소를 구현 세부 사항에서 분리하는 데 사용되므로
 인터페이스를 수정하지 않고 구현 세부 사항을 대체할 수단을 제공함.
 */

protocol Appliance {
    func run()
}

protocol Switch {
    var appliance: Appliance { get set }
    func turnOn()
}

final class RemoteControl: Switch {
    var appliance: Appliance
    
    init(appliance: Appliance) {
        self.appliance = appliance
    }
    
    func turnOn() {
        appliance.run()
    }
}

final class TV: Appliance {
    func run() {
        print("TV turned on")
    }
}

final class VacuumCleaner: Appliance {
    func run() {
        print("Vacuum cleaner turned on")
    }
}

let tvRemoteControl = RemoteControl(appliance: TV())
tvRemoteControl.turnOn()

let vacuumCleanerRemoteContol = RemoteControl(appliance: VacuumCleaner())
vacuumCleanerRemoteContol.turnOn()
