/*
 Flyweight
 자원을 가능한 많이 "공유"하여 메모리 사용 또는 계산 비용을 최소화하는 데 사용됨. ex) 캐시
 */

struct SpecialityCoffee {
    let origin: String
}

protocol CoffeeSearching {
    func search(origin: String) -> SpecialityCoffee?
}

final class Menu: CoffeeSearching {
    private var coffeeAvailable: [String: SpecialityCoffee] = [:]
    
    func search(origin: String) -> SpecialityCoffee? {
        if coffeeAvailable.index(forKey: origin) == nil {
            coffeeAvailable[origin] = SpecialityCoffee(origin: origin)
        }
        
        return coffeeAvailable[origin]
    }
}

final class CoffeeShop {
    private var orders: [Int: SpecialityCoffee] = [:]
    private let menu: CoffeeSearching
    
    init(menu: CoffeeSearching) {
        self.menu = menu
    }
    
    func takeOrder(origin: String, table: Int) {
        orders[table] = menu.search(origin: origin)
    }
    
    func serve() {
        for (table, origin) in orders {
            print("Serving \(origin) to table \(table)")
        }
    }
}

let coffeeShop = CoffeeShop(menu: Menu())

coffeeShop.takeOrder(origin: "Yirgacheffe, Etiopia", table: 1)
coffeeShop.takeOrder(origin: "Buziraguhindwa, Burundi", table: 3)

coffeeShop.serve()
