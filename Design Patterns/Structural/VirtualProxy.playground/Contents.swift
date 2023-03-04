/*
 Virtual Proxy
 - Protection Proxy와 마찬가지로, proxy 패턴은 underlying 객체를 참조하는 surrogate 또는 placeholder 객체를 제공하기 위해 사용됨.
 - Virtual proxy는 필요에 따라(요청 시) 객체를 로드하는 데 사용됨.
 */

protocol HEVSuitMedicalAid {
    func administerMorphine() -> String
}

final class HEVSuit: HEVSuitMedicalAid {
    func administerMorphine() -> String {
        "Morphine administered."
    }
}

final class HEVSuitHumanInterface: HEVSuitMedicalAid {
    lazy private var physicalSuit: HEVSuit = HEVSuit()
    
    func administerMorphine() -> String {
        physicalSuit.administerMorphine()
    }
}

let humanInterface = HEVSuitHumanInterface() // physicalSuit == nil
humanInterface.administerMorphine()
humanInterface // physicalSuit != nil
