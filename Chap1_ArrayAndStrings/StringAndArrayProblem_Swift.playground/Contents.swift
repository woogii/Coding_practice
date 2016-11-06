//: Playground - noun: a place where people can play

import UIKit

var str = "HelloPlayground"
print(str)

extension Character {

    func unicodeScalarCodePoint()->UInt32 {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        return scalars[scalars.startIndex].value
    }
}

var dict = [Character:Int]()
var orderedDict = [Int:[Character:Int]]()
var i = 1

for char in str.lowercased().characters {
    
    if dict[char] == nil {
        dict[char] = 1
        
    } else {
        dict[char] = Int(dict[char]!) + 1
    }
    orderedDict[i] = dict
    i = i + 1
}

for (key, value) in orderedDict {
    print("key, value : \(key), \(value)")
}