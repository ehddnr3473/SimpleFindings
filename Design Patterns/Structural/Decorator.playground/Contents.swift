/*
 Decorator
 런타임에 decorator 객체로 객체를 wrapping해서 그 객체의 기능을 확장하거나 변경하는 데 사용됨. 상속을 사용하여 behavior를 수정하는 대신 유연한 대안을 제공함.
 */

protocol CostHaving {
    var cost: Double { get }
}

protocol IngredientHaving {
    var ingredients: [String] { get }
}

typealias BeverageDataHaving = CostHaving & IngredientHaving

struct SimpleCoffee: BeverageDataHaving {
    let cost: Double = 1.0
    let ingredients = ["Water", "Coffee"]
}

/*
 여기에서는, BeverageDataHaving(CostHaving & IngredientHaving) 프로토콜을 채택하고, BeverageDataHaving 타입의 프로퍼티를 가짐.
 BeverageDataHaving 프로토콜 적합성을 충족하기 위해서, 마치 **override** 하는 것처럼
 beverage 프로퍼티를 가지고 새로운 cost와 ingredients 프로퍼티를 만들어 줘야 함.
 */
protocol BeverageHaving: BeverageDataHaving {
    var beverage: BeverageDataHaving { get }
}

struct Milk: BeverageHaving { // Decorator
    let beverage: BeverageDataHaving
    
    var cost: Double {
        beverage.cost + 0.5
    }
    
    var ingredients: [String] {
        beverage.ingredients + ["Milk"]
    }
}

struct WhipCoffee: BeverageHaving { // Decorator
    let beverage: BeverageDataHaving
    
    var cost: Double {
        beverage.cost + 0.5
    }
    
    var ingredients: [String] {
        beverage.ingredients + ["Whip"]
    }
}

var someCoffee: BeverageDataHaving = SimpleCoffee()
print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")

someCoffee = Milk(beverage: someCoffee)
print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")

someCoffee = WhipCoffee(beverage: someCoffee)
print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")
