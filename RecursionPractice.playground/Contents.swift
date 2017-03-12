//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var arr = [1,2,3,4,5,6,7,8,9,10]

var low = 0
var high = arr.count - 1
var searchItem = 6



func recursiveBinarySearch(arr:[Int], low: Int, high:Int, searchValue:Int) {
  
  let mid = (low + high)/2
  
  if low > high {
    print("not exist")
    return
  }
  
  if arr[mid] == searchItem {
    print("arr : \(arr[mid])")
    print("index : \(mid)")
    return
  } else {
    
    if arr[mid] > searchItem {
      recursiveBinarySearch(arr: arr, low: low, high: mid - 1, searchValue: searchValue)
    } else {
      recursiveBinarySearch(arr: arr, low: mid + 1, high: high, searchValue: searchValue)
    }
    
  }
  
}


recursiveBinarySearch(arr: arr, low: 0, high: high, searchValue: searchItem)


class Permutaion {

  private var used:[Bool]!
  private var outComeString:String = ""
  private var inputString:String
  
  init(inputString:String) {
    self.inputString = inputString
    self.used = [Bool](repeating: false, count: 3)
    self.used.reserveCapacity(inputString.characters.count)
  }
  
  public func permute() {
  
    if inputString.characters.count == outComeString.characters.count {
      print("outComeString: \(outComeString)")
      return
    }
    
    for i in 0..<inputString.characters.count {
      if used[i] {
        continue
      }
      let char = inputString[inputString.index(inputString.startIndex, offsetBy: i)]
      outComeString = outComeString + String(char)
      used[i] = true
      permute()
      used[i] = false
      outComeString = outComeString.substring(to:outComeString.index(before:outComeString.endIndex))
    }
    
  }
  
}

let permutation = Permutaion(inputString: "hat")
permutation.permute()

var input = ""
var char:Character = Character("b")
input = input + String(char)

