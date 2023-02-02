import UIKit

private class A {
    func doSomething() {
        print("Hello")
    }
}

private class B: A {
    override func doSomething() {
        print("World")
    }
}

private let a = A()
private let b = B()

a.doSomething()
b.doSomething()
