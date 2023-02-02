import UIKit

private class A {
    private let myProperty: Int
    
    init(myProperty: Int) {
        self.myProperty = myProperty
    }
    
    func doSomething() {
        print("Hello")
    }
}

private class B: A { // private final class
    fileprivate let myProperty2: Int
    
    init(myProperty: Int, myProperty2: Int) {
        self.myProperty2 = myProperty2
        super.init(myProperty: myProperty)
    }
    
    override func doSomething() {
        print("World")
    }
}

private func usingA(_ a: A) {
    a.doSomething() // A --> B(overriding), 따라서 vtable을 통한 간접 호출
}

private func usingB(_ b: B) -> Int {
    b.doSomething() // 직접 접근
    return b.myProperty2 // 직접 접근
}

private let a = A(myProperty: 5)
private let b = B(myProperty: 8, myProperty2: 10)

usingA(a)
usingB(b)

//print(a.myProperty, b.myProperty) // 접근 불가
