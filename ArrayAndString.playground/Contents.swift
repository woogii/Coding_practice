//: Playground - noun: a place where people can play

import UIKit


var dict = Dictionary<Character,Int>()
var myDictionary: [Int: [Character: Int]] = [0:[:], 1:[:],2:[:],3:[:], 4:[:]]
var orderedDict = Dictionary<Character,Int>()
var myDictionary: [Int: [Character: Int]] = [:]

//let characterList = ["P","Q","R","S","T","P","R","A","T","B","C","P","P","P","P","P","C","P","P","J"]

extension Character
{
  func unicodeScalarCodePoint() -> UInt32
  {
    let characterString = String(self)
    let scalars = characterString.unicodeScalars
    
    return scalars[scalars.startIndex].value
  }
}

extension String {
  
  func indexAt(index:Int)->Character {
    return self[self.index(self.startIndex, offsetBy:index)]
  }
}

var testString = "total"

for i in 0..<testString.characters.count {
  
  if var dict = myDictionary[i] {
    
    if dict.contains(where: {return $0.key == test[test.index(test.startIndex, offsetBy: i)] }) {
      if let value = dict[test[test.index(test.startIndex, offsetBy: i)]] {
        dict[test[test.index(test.startIndex, offsetBy: i)]] = value + 1
      }
    } else {
      dict[test[test.index(test.startIndex, offsetBy: i)]] = 1
    }
    
  }

  let char = testString.indexAt(index:i)
  dict[char] = (dict[char] ?? 0) + 1
  
  myDictionary[i] = [char:(dict[char] ?? 0)]

}

let sortedDict = myDictionary.sorted(by:{ $0.0 < $1.0 })

for i in 0..<testString.characters.count {
  
  let char = testString.indexAt(index:i)

  print(sortedDict[i].value[char] ?? 0)
  if (sortedDict[i].value[char] ?? 0) > 1 {
    print("char : \(char)")
  }
  
}

//let characters = ["P","Q","R","S","T","P","R","A","T","B","C","P","P","P","P","P","C","P","P","J"]


