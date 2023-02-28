/*
 Iterator
 - Iterator 패턴은 underlying structure를 이해할 필요 없이
   collection을 순회하기 위한 인터페이스를 제공하는 데 사용됨.
 */

struct Friend {
    let name: String
}

struct Friends: Sequence {
    let friends: [Friend]
    
    func makeIterator() -> FriendsIterator { // conform Sequence
        FriendsIterator(friends: friends)
    }
}

struct FriendsIterator: IteratorProtocol {
    private var current = 0
    private let friends: [Friend]
    
    init(friends: [Friend]) {
        self.friends = friends
    }
    
    mutating func next() -> Friend? { // conform IteratorProtocol
        defer { current += 1 }
        return friends.count > current ? friends[current] : nil
    }
}

let myFriends = Friends(
    friends: [
        Friend(name: "Kim"),
        Friend(name: "Lee")
    ]
)

for friend in myFriends {
    print("This is my friend, \"\(friend.name)\"")
}
