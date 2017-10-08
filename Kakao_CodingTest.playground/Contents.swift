//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var a1 = 28
var a2 = 21
print(a1|a2)

func interpretSecretMap(size:Int, firstMap:[Int], secondMap:[Int]) -> [String] {

  assert(firstMap.count == size)
  assert(secondMap.count == size)

  var decipherList = [String]()

  for i in 0..<size {

    var bitOpResult = firstMap[i]|secondMap[i]
    var decipher = ""

    for _ in 0..<size {
      if bitOpResult%2 == 1 {
        decipher.characters.append("#")
      } else {
        decipher.append(" ")
      }
      bitOpResult = bitOpResult/2
    }
    decipherList.append(String(decipher.characters.reversed()))
  }

  return decipherList
}


//interpretSecretMap(size: 5, firstMap: [9,20,28,18,11], secondMap: [30,1,21,17,28])
print(interpretSecretMap(size: 6, firstMap: [46,33,33,22,31,50], secondMap: [27,56,19,14,14,10]))