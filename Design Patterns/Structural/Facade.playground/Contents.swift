// Facade 패턴은 복잡한 하위 시스템에 대한 단순한 인터페이스를 제공하는데 사용
import Foundation

final class Defaults {
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    subscript(key: String) -> String? {
        get {
            defaults.string(forKey: key)
        }
        
        set {
            defaults.set(newValue, forKey: key)
        }
    }
}

let storage = Defaults()
storage["name"] = "Kim"

print(storage["name"]!)
