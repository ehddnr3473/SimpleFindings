/*
 Memento
 - 객체의 상태를 캡처하고 나중에복원할 수 있는 방법을 제공함.
 - 객체의 상태를 저장하고 다시 불러올 수 있도록 하는 방법을 제공하여 객체의 데이터를 보호하고 복원할 수 있게 함.
 
 <세 가지 주요 컴포넌트>
 1. Originator: 상태를 저장하고 복원할 객체
 2. Memento: Originator 객체의 상태를 저장하고 보호하는 데 사용됨.
 3. Caretaker: Memento 객체를 관리하고 Originator 객체의 상태를 복원하는 데 사용됨.
 */

// MARK: - Originator
class Editor {
    var text: String = ""
    var format: String = ""
    
    func createMemento() -> EditorMemento {
        EditorMemento(text: text, format: format)
    }
    
    func restore(memento: EditorMemento) {
        text = memento.text
        format = memento.format
    }
}

// MARK: - Memento
class EditorMemento {
    let text: String
    let format: String
    
    init(text: String, format: String) {
        self.text = text
        self.format = format
    }
}

// MARK: - Caretaker
class EditorHistory {
    var mementos = [EditorMemento]()
    
    func push(memento: EditorMemento) {
        mementos.append(memento)
    }
    
    func pop() -> EditorMemento? {
        mementos.popLast()
    }
}

// MARK: - Usage
let editor = Editor()
let history = EditorHistory()

// User types in text and format
editor.text = "Hello, world!"
editor.format = "plain text"

// Save state
history.push(memento: editor.createMemento())

// User types in new text and format
editor.text = "Goodbye, world!"
editor.format = "rich text"

// User wants to undo last change
editor.restore(memento: history.pop()!)


// MARK: - Game application with UserDefaults
import Foundation

typealias Memento = [String: String]

// MARK: - Originator
protocol MementoConvertible {
    var memento: Memento { get }
    init?(memento: Memento)
}

struct GameState: MementoConvertible {
    private enum Keys {
        static let chapter = "com.valve.halflife.chapter"
        static let weapon = "com.valve.halflife.weapon"
    }
    
    var chapter: String
    var weapon: String
    
    init(chapter: String, weapon: String) {
        self.chapter = chapter
        self.weapon = weapon
    }
    
    init?(memento: Memento) {
        guard let mementoChapter = memento[Keys.chapter],
              let mementoWeapon = memento[Keys.weapon] else { return nil }
        chapter = mementoChapter
        weapon = mementoWeapon
    }
    
    var memento: Memento {
        [Keys.chapter: chapter, Keys.weapon: weapon]
    }
}

// MARK: - Caretaker
enum CheckPoint {
    private static let defaults = UserDefaults.standard
    
    static func save(_ state: MementoConvertible, saveName: String) {
        defaults.set(state.memento, forKey: saveName)
//        defaults.synchronize()
    }
    
    static func restore(saveName: String) -> Any? {
        defaults.object(forKey: saveName)
    }
}

// MARK: - Usage
var gameState = GameState(chapter: "Chapter 1", weapon: "Sword")

gameState.chapter = "Chapter 2"
gameState.weapon = "CrossBow"
CheckPoint.save(gameState, saveName: "gameState 1")

gameState.chapter = "Chapter 3"
gameState.weapon = "Gun"
CheckPoint.save(gameState, saveName: "gameState 2")

if let memento = CheckPoint.restore(saveName: "gameState 1") as? Memento {
    let finalState = GameState(memento: memento)
    dump(finalState)
}
