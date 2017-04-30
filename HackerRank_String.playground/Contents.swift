//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension String {
  
  subscript(i:Int) -> Character {
  
    return self[self.index(self.startIndex, offsetBy: i)]
  }
}

var originString = "aaabccddd"

/* Super Reduced String */ 

while(true) {
  
  var repeatedCharPairs:String = ""
  
  if !originString.isEmpty {

    for i in 0..<originString.characters.count-1 {
    
        if originString[i] == originString[i+1] {
          repeatedCharPairs = String(originString[i]) + String(originString[i])
          break
      }
    }
  }
  
  if repeatedCharPairs.characters.count > 0 {
    originString = originString.replacingOccurrences(of: repeatedCharPairs, with: "")
    
  } else {
    if originString.characters.count == 0 {
      print("empty string")
    } else {
      print(originString)
    }
    break
  }
  
  
}


