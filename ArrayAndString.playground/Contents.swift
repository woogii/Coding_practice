//: Playground - noun: a place where people can play

import UIKit


var dict = Dictionary<Character,Int>()
var myDictionary: [Int: [Character: Int]] = [0:[:], 1:[:],2:[:],3:[:], 4:[:]]

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
  
  if var dict = myDictionary[i] {
    
    if dict.contains(where: {return $0.key == test[test.index(test.startIndex, offsetBy: i)] }) {
      if let value = dict[test[test.index(test.startIndex, offsetBy: i)]] {
        dict[test[test.index(test.startIndex, offsetBy: i)]] = value + 1
      }
    } else {
      dict[test[test.index(test.startIndex, offsetBy: i)]] = 1
    }
    
  }
  
}

print(dict)

