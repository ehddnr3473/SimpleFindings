import UIKit

// Basic String
var complexJsonString = "{\"id\": \"ehddnr3473\", \"name\": \"Donguk Kim\"}"

// Raw Strings
var rawJsonString = #"{"id": "ehddnr3473", "name": "Donguk Kim"}"#

func toJson(input: String) {
    guard let data = input.data(using: .utf8) else { return }
    let json = try! JSONSerialization.jsonObject(with: data)
    print(json)
}

//toJson(input: complexJsonString)
toJson(input: rawJsonString)

/*
 {
    "id": "ehddnr3473",
    "name": "Donguk Kim"
 }
 */
