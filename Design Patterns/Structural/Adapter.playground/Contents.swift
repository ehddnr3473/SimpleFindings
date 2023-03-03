/*
 Adapter
 클라이언트에 필요한 인터페이스를 지원하는 클래스로, "adaptee"를 래핑하여 호환되지 않는 두 타입 간의 링크를 제공하는 데 사용됨.
 */

protocol NewFrame {
    var width: Double { get }
    var height: Double { get }
}

struct OldFrameTarget { // adaptee
    let width: Float
    let height: Float
}

struct NewFrameTarget: NewFrame {
    private let target: OldFrameTarget
    
    var width: Double {
        Double(target.width) + 10.0
    }
    
    var height: Double {
        Double(target.height) + 10.0
    }
    
    init(_ target: OldFrameTarget) {
        self.target = target
    }
}

let target = OldFrameTarget(width: 50.0, height: 100.0)
let newFormat = NewFrameTarget(target)

newFormat.width
newFormat.height
