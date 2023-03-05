/*
 Mediator
 - 서로 통신하는 클래스 간의 결합도를 낮추기 위해 사용
 - 클래스가 직접 통신하여 구현체에 대한 지식을 요구하는 대신, 클래스는 중재자(mediator) 객체를 통해 메시지를 보냄.
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

