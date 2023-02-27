/*
 Observer 패턴은 객체가 상태에 대한 변경 사항을 publish할 수 있도록 하는 데 사용됨.
 다른 객체는 변경 사항에 대한 알림을 받기 위해 subscribe.
 */

protocol PropertyObserver: AnyObject {
    func willChange(propertyName: String, newPropertyValue: Any?)
    func didChange(propertyName: String, oldPropertyValue: Any?)
}

final class Observer: PropertyObserver {
    func willChange(propertyName: String, newPropertyValue: Any?) {
        if let newValue = newPropertyValue as? Int {
            print("\(propertyName): will \(newValue)")
        }
    }
    
    func didChange(propertyName: String, oldPropertyValue: Any?) {
        if let oldValue = oldPropertyValue as? Int {
            print("\(propertyName): did \(oldValue)")
        }
    }
}


final class TestPublisher {
    weak var observer: PropertyObserver?
    
    private let testPublisherNumberName = "testChamberNumber"
    
    var testPublisherNumber: Int = 0 {
        willSet {
            observer?.willChange(propertyName: testPublisherNumberName, newPropertyValue: newValue)
        }
        didSet {
            observer?.didChange(propertyName: testPublisherNumberName, oldPropertyValue: oldValue)
        }
    }
}

let observer = Observer()
let publisher = TestPublisher()
publisher.observer = observer

publisher.testPublisherNumber += 1
publisher.testPublisherNumber += 1
publisher.testPublisherNumber += 1
