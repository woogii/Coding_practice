//: Playground - noun: a place where people can play

import UIKit
import Foundation

var dict = Dictionary<Character,Int>()
var myDictionary: [Int: [Character: Int]] = [0:[:], 1:[:],2:[:],3:[:], 4:[:]]
var orderedDict = Dictionary<Character,Int>()
//var myDictionary: [Int: [Character: Int]] = [:]

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
    
    if dict.contains(where: {return $0.key == testString[testString.index(testString.startIndex, offsetBy: i)] }) {
      if let value = dict[testString.indexAt(index: i)] {
        dict[testString.indexAt(index: i)] = value + 1
      }
    } else {
      dict[testString[testString.index(testString.startIndex, offsetBy: i)]] = 1
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


//Given an array, find there are 3 numbers have
//
//when we add them the value will equals a specified sum
//Example:
//{1,4,6,10,20,21}
//Sum=32, Result:true (1+10+21)
//Sum=65, Result:false

// Standard questions on array traversal to find maximum subsequence sum, 3 sum, etc.


func findCombinationOfNumberList(sum:Int)->[Int]{
  
  let arr = [1,4,6,10,20,21]
  var dict = Dictionary<Int,Bool>()
  var secondDiff = 0
  var firstDiff = 0
  var partialSum = [Int]()
  
  for element in arr {
    dict[element] = true
  }
  
  for i in 0..<arr.count {

    firstDiff = sum - arr[i]

    partialSum.append(arr[i])
    
    for j in 0..<arr.count {
      
      if j != i {
        
        secondDiff = firstDiff - arr[j]
        partialSum.append(arr[j])
        
        // Prevent possible duplicate ex) Given total is 10 and 4,6 are chosen, 14 - 10 = 4 can be selected again
        if partialSum.contains(secondDiff) {
          partialSum.removeLast()
          continue
        }
        
        if let _ = dict[secondDiff] {
          partialSum.append(secondDiff)
          return partialSum
        } else {
          partialSum.removeLast()
          continue
        }
      }
    }
    
    partialSum = []
    secondDiff = 0
  
  }
  
  return [Int]()
}

print(findCombinationOfNumberList(sum: 36))


//Create function that will determine are the parenthesis balanced in a given string
//boolean isBalanced(string)
//
//a(bcd)d => true
//(kjds(hfkj)sdhf => false
//(sfdsf)(fsfsf => false
//
//{[]}() => true
//{[}] => false
//






//Given a integer , return corresponding ASCII char representation without using language building in feature.
//
//ex. input interger 1234, return "1234" in string or characters


func convertIntToString(number:Int)->String{
  
  var digit:Int
  var mutableNumber = number
  var numberString = ""
  
  if number < 0 {
    mutableNumber = -1 * mutableNumber
  }
  
  while(mutableNumber > 0) {
    
    digit = mutableNumber % 10
    numberString = "\(digit)" + numberString
    mutableNumber = mutableNumber / 10
  }
  
  if number < 0 {
    numberString = "-" + numberString
  }
  
  return numberString
}

convertIntToString(number: 3524)

//2 Answers
//What a fibonacci function which return N th position number both in recursive and loop, also give the explanation on both implementation on their time efficiency.
//5 Answers
//What is HashMap ? Give the comparison on HashMap and TreeMap, that is the efficiency on their intersection and traverse.


let strTest = "abcdefg"

let prefixString = String(strTest.characters.prefix(1))
let prefixString2 = String(strTest.characters.prefix(through: strTest.index(strTest.startIndex, offsetBy: 2)))

let suffixString = String(strTest.characters.suffix(from: strTest.index(strTest.endIndex, offsetBy: -2)))

func isSubString(sourceString:String,targetString:String)-> Bool {
  
  return sourceString.contains(targetString)
//  guard sourceString != targetString else {
//    return true
//  }
//  
//  let stringLength = sourceString.characters.count
//
//  
//  for i in 0..<stringLength - 2 {
//    
//    let splittedString = String(sourceString.characters.prefix(i+1))
//    
//    let splittedString2 = String(sourceString.characters.suffix(from:
//       sourceString.index(sourceString.startIndex, offsetBy: i+1)))
//    
//    print("str1 : \(splittedString)")
//    print("str2 : \(splittedString2)")
//    
//    if splittedString2.contains(targetString) || splittedString.contains(targetString) {
//      return true
//    }
//  }
//  
//  return false
}


// Problem 1.9 

isSubString(sourceString: "waterbottle", targetString: "erbottlewat")

func checkRotation(source:String,target:String)-> Bool {
  
  let sourceLength = source.characters.count
  let targetLength = target.characters.count
  
  if sourceLength == targetLength {
    
    let str3 = source + source
    
    return isSubString(sourceString: str3, targetString: target)
    
  }
  
  return false
}

checkRotation(source: "waterbottle", target: "erbottlewat")