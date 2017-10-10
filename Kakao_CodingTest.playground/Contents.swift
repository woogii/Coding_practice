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
