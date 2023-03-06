/*
 Mediator
 - 서로 통신하는 클래스(객체) 간의 결합도를 낮추기 위해 사용
    -> 유지보수성 증가, 객체들 간의 상호작용이 명확하게 분리됨.
 - 객체 간의 상호작용을 캡슐화하여 객체 간의 직접적인 결합을 방지
 
 - 클래스가 직접 통신하여 구현체에 대한 지식을 요구하는 대신, 클래스는 중재자(mediator) 객체를 통해 메시지를 보냄.
 - Mediator 클래스가 중재자 역할을 수행하며, 객체들은 Mediator 객체와만 상호작용함.
 */

protocol Receiver {
    associatedtype MessageType
    func receive(message: MessageType)
}

protocol Sender {
    associatedtype MessageType
    associatedtype ReceiverType: Receiver
    
    var recipients: [ReceiverType] { get }
    
    func send(message: MessageType)
}

struct Programmer: Receiver {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func receive(message: String) {
        print("\(name) received: \(message)")
    }
}

final class MessageMediator: Sender {
    internal var recipients: [Programmer] = []
    
    func add(recipient: Programmer) {
        recipients.append(recipient)
    }
    
    func send(message: String) {
        for recipient in recipients {
            recipient.receive(message: message)
        }
    }
}

func spamMonster(message: String, worker: MessageMediator) {
    worker.send(message: message)
}

let messagesMediator = MessageMediator()

let user0 = Programmer(name: "Linus Torvalds")
let user1 = Programmer(name: "Avadis 'Avie' Tevanian")

messagesMediator.add(recipient: user0)
messagesMediator.add(recipient: user1)

spamMonster(
    message: "I'd like to add you to my professional network",
    worker: messagesMediator
)

// MARK: - 채팅 애플리케이션
/*
 Mediator 패턴에서 객체들은 다음과 같은 역할을 수행
 - Colleague: 다른 객체와 상호작용하는 객체
 - ConcreteColleague: Colleague 인터페이스를 구현한 구체적인 객체
 - Mediator: Colleague 객체들 간의 상호작용을 캡슐화하고, Colleague 객체들에게 중재자 역할을 수행하는 인터페이스
 - ConcreteMediator: Mediator 인터페이스를 구현한 구체적인 객체
 */

// MARK: - Mediator interface
protocol ChatRoomMediator {
    func sendMessage(_ message: String, from user: User)
    func addUser(_ user: User)
}

// MARK: - Colleague interface
protocol User: AnyObject {
    var name: String { get }
    func sendMessage(_ message: String)
    func receiveMessage(_ message: String)
}

// MARK: - ConcreteMediator class
class ChatRoom: ChatRoomMediator {
    private var users = [User]()
    
    func sendMessage(_ message: String, from user: User) {
        for recipient in users where recipient !== user {
            recipient.receiveMessage("[\(user.name)]: \(message)")
        }
    }
    
    func addUser(_ user: User) {
        users.append(user)
    }
}

// MARK: - ConcreteColleague class
class ChatUser: User {
    let name: String
    let chatRoom: ChatRoomMediator
    
    init(name: String, chatRoom: ChatRoomMediator) {
        self.name = name
        self.chatRoom = chatRoom
        self.chatRoom.addUser(self)
    }
    
    func sendMessage(_ message: String) {
        chatRoom.sendMessage(message, from: self)
    }
    
    func receiveMessage(_ message: String) {
        print("\(name) received message: \(message)")
    }
}

let chatRoom = ChatRoom()
let john = ChatUser(name: "John", chatRoom: chatRoom)
let jane = ChatUser(name: "Jane", chatRoom: chatRoom)

john.sendMessage("Hi, Jane!")
jane.sendMessage("Hi, John..!")
