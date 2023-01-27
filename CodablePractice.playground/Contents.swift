import UIKit
import Foundation

let jsonString = """
{
    "name": "Donguk Kim",
    "nick_name": "Yeolmok",
    "age": 28
}
"""

struct User: Decodable {
    let name: String
    let nickName: String
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case nickName = "nick_name"
        case age
    }
}

let jsonData: Data = jsonString.data(using: .utf8)!

do {
    let user = try JSONDecoder().decode(User.self, from: jsonData)
    print(user)
} catch {
    print("error: \(error.localizedDescription)")
}
