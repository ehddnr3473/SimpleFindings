import UIKit

class PlasticBottle {
    var water: Water
    
    init(water: Water) {
        self.water = water
    }
    
    func drink() {
        water.drink()
    }
}

class Water {
    var volume: Double
    
    init(volume: Double) {
        self.volume = volume
    }
    
    func drink() {
        volume /= 2
    }
}
