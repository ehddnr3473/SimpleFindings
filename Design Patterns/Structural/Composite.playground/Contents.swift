/*
 Composite
 모든 요소를 표준 방식으로 접근하고 사용할 수 있는 관련 객체의 계층적, 재귀적 트리 구조를 만드는 데 사용됨.
 */

// MARK: - Component
protocol Shape {
    func draw(fillColor: String)
}

// MARK: - Leafs
final class Square: Shape {
    func draw(fillColor: String) {
        print("Drawing a Square with color \(fillColor)")
    }
}

final class Circle: Shape {
    func draw(fillColor: String) {
        print("Drawing a circle with color \(fillColor)")
    }
}

// MARK: - Composite
final class Whiteboard: Shape {
    private lazy var shapes = [Shape]()
    
    init(_ shapes: Shape...) {
        self.shapes = shapes
    }
    
    func draw(fillColor: String) {
        for shape in shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}

var whiteboard = Whiteboard(Circle(), Square())
whiteboard.draw(fillColor: "Pink")
