import UIKit

/*
 Builder
 객체 생성 디자인 패턴
 */

// 1
struct Student {
    var name: String? = nil
    var age: Int? = nil
}

class StudentBuilder {
    private var student: Student = Student()
    
    func withName(_ name: String) -> Self {
        student.name = name
        return self
    }
    
    func withAge(_ age: Int) -> Self {
        student.age = age
        return self
    }
    
    func build() -> Student {
        return student
    }
}

let student = StudentBuilder()
    .withName("Kim")
    .withAge(28)
    .build()

// 2
class FriendBuilder {
    var name: String?
    var age: Int?
    var hobby: String?
    
    typealias BuilderClosure = (FriendBuilder) -> ()
    
    init(builderClosure: BuilderClosure) {
        builderClosure(self)
    }
}

struct Friend {
    let name: String
    let age: Int
    let hobby: String
    
    init?(builder: FriendBuilder) {
        if let name = builder.name,
           let age = builder.age,
           let hobby = builder.hobby {
            self.name = name
            self.age = age
            self.hobby = hobby
        } else {
            return nil
        }
    }
    
    var description: String {
        return "My friend (name: \(name), age: \(age), hobby: \(hobby))"
    }
}

let friendBuilder = FriendBuilder { builder in
    builder.name = "Kim"
    builder.age = 23
    builder.hobby = "Game"
}

if let friend = Friend(builder: friendBuilder) {
    print(friend.description)
}
