//: Playground - noun: a place where people can play

import UIKit


var dict = Dictionary<Character,Int>()
var myDictionary: [Int: [Character: Int]] = [:]

extension Character
{
  func unicodeScalarCodePoint() -> UInt32
  {
    let characterString = String(self)
    let scalars = characterString.unicodeScalars
    
    return scalars[scalars.startIndex].value
  }
}

var test = "total"

for i in 0..<test.characters.count {
  //print(char)
  
    var dict = myDictionary[i] as! [Character:Int]
    
    if dict.contains(where: {return $0.key == test[test.index(test.startIndex, offsetBy: i)] }) {
      if let value = dict[test[test.index(test.startIndex, offsetBy: i)]] {
        dict[test[test.index(test.startIndex, offsetBy: i)]] = value + 1
      }
    } else {
      dict[test[test.index(test.startIndex, offsetBy: i)]] = 1
    }
  
}

print(dict)

