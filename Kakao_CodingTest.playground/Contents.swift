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
//print(interpretSecretMap(size: 6, firstMap: [46,33,33,22,31,50], secondMap: [27,56,19,14,14,10]))



let sample1 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]
let sample2 = ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]
let sample3 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]
let sample4 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]
let sample5 = ["Jeju", "Pangyo", "NewYork", "newyork"]
let sample6 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]



func printRuntime(cityList: [String], cacheSize: Int) -> Int {

  typealias CityInfo = (weight:Int,index:Int)
  var cache = [(String,CityInfo)]()
  let cacheHit = 5
  let cacheMiss = 1
  var runtimeValue = 0

  if cacheSize == 0 {
    return cityList.count * cacheHit
  } else {
    for i in 0..<cityList.count {
      let city = cityList[i].lowercased()
      if let index = cache.index(where: { $0.0 == city }) {
        runtimeValue += cacheMiss
        cache[index].1.weight += 1
      } else {

        if cache.count == cacheSize {
          cache = cache.sorted(by: {
            if $0.0.1.weight == $0.1.1.weight {
              return $0.0.1.index < $0.1.1.index
            } else {
              return $0.0.1.weight < $0.1.1.weight
            }
          })
          cache.remove(at: 0)   // Remove least recently used
        }
        let newCityInfo = (0,i)
        cache.insert((city,newCityInfo), at: 0)
        //print(" i : \(i), cache: \(cache)")
        runtimeValue += cacheHit
      }
    }
    return runtimeValue
  }
}

//print("runtimeValue : \(printRuntime(cityList: sample1, cacheSize: 3))")
//print("runtimeValue : \(printRuntime(cityList: sample2, cacheSize: 3))")
//print("runtimeValue : \(printRuntime(cityList: sample3, cacheSize: 2))")
//print("runtimeValue : \(printRuntime(cityList: sample4, cacheSize: 5))")
//print("runtimeValue : \(printRuntime(cityList: sample5, cacheSize: 2))")
//print("runtimeValue : \(printRuntime(cityList: sample6, cacheSize: 0))")




let dartSample1 = "1S2D*3T"
let dartSample2 = "1D2S#10S"
let dartSample3 = "1D2S0T"
let dartSample4 = "1S*2T*3S"
let dartSample5 = "1D#2S*3S"
let dartSample6 = "1T2D3D#"
let dartSample7 = "1D2S3T*"

dartSample1.components(separatedBy: "S")
dartSample1.components(separatedBy: "D*")
dartSample1.components(separatedBy: "T*")
dartSample1.components(separatedBy: "T#")

let s = "hey ho ha"
let pattern = "(h).*(h).*(h)"
// our goal is capture group 3, "h" in "ha"
let regex = try! NSRegularExpression(pattern: pattern)
let result = regex.matches(in:s, range:NSMakeRange(0, s.utf16.count))
let third = result[0].rangeAt(3) // <-- !!
third.location // 7
third.length // 1

//do {
//  var regex2 = try NSRegularExpression(pattern: "[0...10]+(S,D,T)+(*,#)*")
//  print(regex2.matches(in: dartSample1,range: NSMakeRange(0, dartSample1.utf16.count)))
//} catch let error as NSError {
//  print("\(error.userInfo)\(error.localizedDescription)")
//}


extension String {
  subscript (r: Range<Int>) -> String {
    let start = index(startIndex, offsetBy: r.lowerBound)
    let end = index(startIndex, offsetBy: r.upperBound)
    return self[start..<end]
  }

  subscript (r: ClosedRange<Int>) -> String {
    let start = index(startIndex, offsetBy: r.lowerBound)
    let end = index(startIndex, offsetBy: r.upperBound)
    return self[start...end]
  }
}

func createDartPoints(pointString: String) -> Int {

  var currentString: String = ""
  var currentValue = 0
  var result = [0,0,0]
  var resultIndex = 0
  let bonus = "SDT"
  let options = "*#"

  for i in 0..<pointString.characters.count {

    currentString = pointString[i...i]

    if bonus.contains(currentString) {
      if currentString == "S" {
        result[resultIndex] = Int(pow((Double)(currentValue), 1))
      } else if currentString == "D" {
        result[resultIndex] = Int(pow((Double)(currentValue), 2))
      } else {
        result[resultIndex] = Int(pow((Double)(currentValue), 3))
      }
      resultIndex += 1
    } else if options.contains(currentString) {
      if currentString == "*" {
        let currentResultIndex = resultIndex - 1
        if currentResultIndex == 0 {
          result[currentResultIndex] *= 2
        } else {
          let previousResultIndex = currentResultIndex - 1
          result[previousResultIndex] *= 2
          result[currentResultIndex] *= 2
        }
      } else {
        result[resultIndex-1] *= -1
      }
    } else {
      if currentString == "0"  {
        if i >= 1 {
          let previousString = pointString[i-1...i-1]
          if previousString == "1" {
            // check whether number is "10"
            currentValue = Int(previousString + currentString)!
            continue
          }
        }
      }
      currentValue = Int(currentString)!
    }
  }

  return result.reduce(0, {$0+$1})
}

print(createDartPoints(pointString: dartSample1))
print(createDartPoints(pointString: dartSample2))
print(createDartPoints(pointString: dartSample3))
print(createDartPoints(pointString: dartSample4))
print(createDartPoints(pointString: dartSample5))
print(createDartPoints(pointString: dartSample6))
print(createDartPoints(pointString: dartSample7))


var test122 = "FRANCE+* "



extension String {
  func charAt(_ index:Int) -> Character {
    return self[self.characters.index(self.characters.startIndex, offsetBy: index)]
  }
}
let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

func getStringArray(str:String) -> [String] {
  var tokenStringArr = [String]()

  for i in 0..<str.characters.count {
    var tokenString:String?
    if i < str.characters.count - 1 {
      tokenString = String(str.charAt(i)).lowercased() + String(str.charAt(i+1)).lowercased()
    }
    guard let token = tokenString else { continue }
    tokenStringArr.append(token)
  }

  return tokenStringArr.filter {
    if $0.rangeOfCharacter(from: characterset.inverted) != nil {
      return false
    } else {
      return true
    }
  }
}

func createDictBasedOn(strArr: [String]) -> [String:Int] {
  var dict = [String: Int]()
  for i in 0..<strArr.count {
    dict[strArr[i]] = (dict[strArr[i]] ?? 0) + 1
  }
  return dict
}

func calcSimilarity(str1: String, str2: String) -> Int {
  let multipliedVal = 65536
  let str1Arr = getStringArray(str: str1)
  let str2Arr = getStringArray(str: str2)
  print(str1Arr)
  print(str2Arr)
  let str1Dict = createDictBasedOn(strArr: str1Arr)
  let str2Dict = createDictBasedOn(strArr: str2Arr)
  print(str1Dict)
  print(str2Dict)
  var unionDict = [String:Int]()
  var interSectDict = [String:Int]()

  for (str1Key, str1Value) in str1Dict {

    for (str2Key, str2Value) in str2Dict {

      if let str2Value = str2Dict[str1Key] {
        if str2Value >= str1Value {
          interSectDict[str1Key] = str1Value
          unionDict[str1Key] = str2Value
        } else {
          interSectDict[str1Key] = str2Value
          unionDict[str1Key] = str1Value
        }
      } else {
        unionDict[str1Key] = str1Value
        unionDict[str2Key] = str2Value
      }
    }
  }

  print(interSectDict)
  print(unionDict)
  if unionDict.count == 0 {
    return multipliedVal
  } else {
    let value = (Float)(interSectDict.values.reduce(0, {$0+$1})) / Float(unionDict.values.reduce(0, {$0 + $1}))
    return Int(value*65536.0)
  }

}

calcSimilarity(str1:"FRANCE", str2: "FRENCH")
calcSimilarity(str1:"handshake", str2: "shake hands")
calcSimilarity(str1:"aa1+aa2", str2: "AAAA12")
calcSimilarity(str1:"E=M*C^2", str2: "e=m*c^2")

