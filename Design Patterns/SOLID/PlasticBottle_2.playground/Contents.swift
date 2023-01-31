import UIKit

class PlasticBottle {
    var beverage: Potable
    
    init(beverage: Potable) {
        self.beverage = beverage
    }
    
    func drink() {
        beverage.drink()
    }
}

protocol Potable: AnyObject {
    func drink()
}

class Water: Potable {
    var volume: Double
    
    init(volume: Double) {
        self.volume = volume
    }
    
    func drink() {
        volume /= 2
    }
}
