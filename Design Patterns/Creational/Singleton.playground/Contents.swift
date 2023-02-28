/*
 Singleton
 - 특정 클래스의 인스턴스가 하나만 생성된다는 것을 보장하고, 글로벌하게 접근이 가능함.
 - 모든 Sigleton 클래스 객체에 대한 추가 참조는 동일한 인스턴스를 참조함.
 
 * Overuse *
 - thread safety 하지 않음. 적절히 구현하지 않으면 문제가 발생할 수 있음.
   여러 스레드가 동일한 인스턴스에 접근하여 race condition 또는 다른 동시성 문제가 발생할 수 있음.
 - 의존성을 관리하고 테스트 가능성을 향상시키는 강력한 기술인 의존성 주입을 어렵게 만들 수 있음.
 - 글로벌하게 생성되므로 테스트할 때 mock으로 대체하거나 다른 implementation으로 대체하기가 어려울 수 있음.
 - Singleton 패턴을 과도하게 사용하면, 강하게 결합되어 코드 수정이 어려움.
 - global state 생성 -> 코드를 추론하고 디버깅하기가 어려워짐.
 - 또한, global state를 자주 사용하려는 상황으로 이어질 수도 있음.
 */
final class Kim {
    static let shared = Kim()
    
    private(set) var age: Int
    
    private init() {
        self.age = 28
    }
    
    func setAge(_ age: Int) {
        self.age = age
    }
}

print(Kim.shared.age)
Kim.shared.setAge(14)
print(Kim.shared.age)
