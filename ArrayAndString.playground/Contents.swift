//: Playground - noun: a place where people can play

import UIKit


var dict = Dictionary<Character,Int>()
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


