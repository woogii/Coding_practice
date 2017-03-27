//: Playground - noun: a place where people can play

import UIKit


var dict = Dictionary<Character,Int>()
var myDictionary: [Int: [Character: Int]] = [0:[:], 1:[:],2:[:],3:[:], 4:[:]]
var orderedDict = Dictionary<Character,Int>()
var myDictionary: [Int: [Character: Int]] = [:]

extension Character
{
  func unicodeScalarCodePoint() -> UInt32
  {
    let characterString = String(self)
    let scalars = characterString.unicodeScalars
    
    return scalars[scalars.startIndex].value
  }
  
  var asciiValue:UInt32? {
    return String(self).unicodeScalars.filter({$0.isASCII}).first?.value
  }
}

extension String {
  
  func indexAt(index:Int)->Character {
    return self[self.index(self.startIndex, offsetBy:index)]
  }
}

/* Find the first non-repeated character in String Array */

let characterList = ["P","Q","R","S","T","P","R","A","T","B","C","P","P","P","P","P","C","P","P","J"]
var lookupForCharacterList = Dictionary<String,Int>()

for char in characterList {
  lookupForCharacterList[char] = (lookupForCharacterList[char] ?? 0) + 1
}

print(lookupForCharacterList)
print(characterList.filter({lookupForCharacterList[$0] == 1}).first ?? "Not Exist")

/* Find the first non-repeated character in String */

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

print(dict)
//let sortedDict = myDictionary.sorted(by:{ $0.0 < $1.0 })
//print(sortedDict)

print(testString.characters.filter({ dict[$0] == 1 }).first ?? "Not exist")

//for i in 0..<testString.characters.count {
//  
//  let char = testString.indexAt(index:i)
//
//  print(sortedDict[i].value[char] ?? 0)
//  if (sortedDict[i].value[char] ?? 0) > 1 {
//    print("char : \(char)")
//  }
//  
//}



/* Remove Specified Characters */

var lookupDict = Dictionary<Character, Bool>()

func removeChars(str:String, remove:String)->String {
  
  var removedString:String = ""
  
  // create look-up table
  for char in remove.characters {
    lookupDict[char] = false
  }
  
  for char in str.characters {
    // see if a char in Str exits in look-up table
    if let _ = lookupDict[char] {
      lookupDict[char] = true
    }
  }
  
  for i in 0..<str.characters.count {
    
    if let isExist = lookupDict[str.indexAt(index:i)] {
      
      if !isExist {
        removedString.append(str.indexAt(index:i))
      }
    } else {
      removedString.append(str.indexAt(index:i))
    }
    
  }
  
  return removedString
}

removeChars(str: "Battle of the Vowels: Hawaii vs. Grozny", remove: "aeiou")

/* Reverse Words */

let sampleStr = "Do or do not, there is no try."

let newSampleStr = sampleStr.components(separatedBy: " ").reversed().joined(separator: " ")


//let numberString = "46921"
//let minusNumberString = "-1234"

//numberString.indexAt(index: 0)
//minusNumberString.indexAt(index: 0)





//func stringToInt(numberString:String)-> Int{
//  
//  var mutableString = numberString
//  var finalValue = Int()
//  
//  if numberString.indexAt(index: 0) != "-" {
//  
//    var multiplier = 1
//    
//    for char in numberString.characters.reversed() {
//      
//      let digitValue = char.asciiValue! - Character("0").asciiValue!
//  
//      if numberString.indexAt(index: 0) != "-" {
//        finalValue += Int(digitValue) * multiplier
//        multiplier = multiplier * 10
//      }
//    }
//    
//  } else {
//    
//    var multiplier = -1
//  
//    mutableString.remove(at: numberString.startIndex)
//    
//    for char in mutableString.characters.reversed() {
//      
//      let digitValue = char.asciiValue! - Character("0").asciiValue!
//      finalValue += Int(digitValue) * multiplier
//      multiplier = multiplier * 10
//      
//    }
//  }
//  
//  return finalValue
//}


func stringToInt(numberString:String)-> Int{
  
  var finalValue = 0
  var signed = false
  var startIndex = 0
  
  if numberString.indexAt(index: 0) == "-" {
    signed = true
    startIndex = 1
  }
  
  for i in startIndex..<numberString.characters.count  {
      
    let digitValue = numberString.indexAt(index: i).asciiValue! - Character("0").asciiValue!
    finalValue *= 10
    finalValue += Int(digitValue)
    
  }
  
  if signed {
    finalValue *= -1
  }
  
  return finalValue
}


print(stringToInt(numberString: "1235"))
print(stringToInt(numberString: "-145"))


